﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Authentication;
using System.Text;
using System.Threading.Tasks;
using AuthorizeNet;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;
using digioz.Portal.Utilities;

namespace digioz.Portal.Payment.AuthNet
{
    // American Express Test Card:  370000000000002
    // Discover Test Card:          6011000000000012
    // Visa Test Card:              4007000000027
    // Second Visa Test Card:       4012888818888
    // Third Visa Test Card:        4111111111111111
    // JCB:                         3088000000000017
    // Diners Club/ Carte Blanche:  38000000000006

    public class AuthNetMakePayment : IMakePayment
    {
        public PayResponse ProcessPayment(Pay pay, PaymentTypeKey key, List<PayLineItem> payLineItems)
        {
            PayResponse payResponse = new PayResponse();

            // Process Payment Here
            string lsAPILoginID = key.LoginId;
            string lsTransactionKey = key.TransactionKey;
            bool lbAuthNetInTestMode = false;

            if (key.TestMode)
            {
                lbAuthNetInTestMode = true;
            }

            // Set the Environment First
            if (lbAuthNetInTestMode)
            {
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;
            }
            else
            {
                ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.PRODUCTION;
            }

            // TLS 1.2 Bug fix
            const SslProtocols _Tls12 = (SslProtocols)0x00000C00;
            const SecurityProtocolType Tls12 = (SecurityProtocolType)_Tls12;
            ServicePointManager.SecurityProtocol = Tls12;
            //System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = lsAPILoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = lsTransactionKey,
            };

            var creditCard = new creditCardType
            {
                cardNumber = pay.CCNumber, // "4111111111111111",
                expirationDate = pay.CCExp, // "0718",
                cardCode = pay.CCCardCode // "123"
            };

            var billingAddress = new customerAddressType
            {
                firstName = pay.FirstName,
                lastName = pay.LastName,
                address = (pay.BillingAddress + " " + pay.BillingAddress2).Trim(),
                city = pay.BillingCity,
                state = pay.BillingState,
                zip = pay.BillingZip,
                country = pay.BillingCountry
            };

            var shiptoAddress = new customerAddressType
            {
                firstName = pay.FirstName,
                lastName = pay.LastName,
                address = (pay.ShippingAddress + " " + pay.ShippingAddress2).Trim(),
                city = pay.ShippingCity,
                state = pay.ShippingState,
                zip = pay.ShippingZip,
                country = pay.ShippingCountry
            };

            //standard api call to retrieve response
            var paymentType = new paymentType { Item = creditCard };

            // Add the purcahse line items
            var lineItems = new lineItemType[payLineItems.Count];
            var count = 0;

            foreach (var payLineItem in payLineItems)
            {
                string description = StringUtils.StripHTML(payLineItem.Description);
                lineItems[count] = new lineItemType { itemId = payLineItem.ID, name = StringUtils.Truncate(payLineItem.Name, 30), description = description, taxable = payLineItem.Taxable, quantity = payLineItem.Quantity, unitPrice = payLineItem.Price };
                count++;
            }

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // charge the card

                amount = pay.Total,
                payment = paymentType,
                billTo = billingAddress,
                shipTo = shiptoAddress,
                lineItems = lineItems
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the controller that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            // validate response
            if (response != null)
            {
                if (response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if (response.transactionResponse.messages != null)
                    {
                        payResponse.TrxApproved = true;
                        payResponse.TrxAuthorizationCode = response.transactionResponse.responseCode;
                        payResponse.TrxDescription = "Transaction Approved";
                        payResponse.TrxID = response.transactionResponse.transId;
                        payResponse.TrxMessage = response.transactionResponse.messages[0].description;
                        payResponse.TrxResponseCode = response.transactionResponse.responseCode;
                    }
                    else
                    {
                        // Failed Transaction
                        payResponse.TrxApproved = false;
                        payResponse.TrxAuthorizationCode = response.transactionResponse.responseCode;
                        payResponse.TrxID = response.transactionResponse.transId;
                        payResponse.TrxMessage = response.transactionResponse.messages[0].description;
                        payResponse.TrxResponseCode = response.transactionResponse.responseCode;
                        

                        if (response.transactionResponse.errors != null)
                        {
                            payResponse.TrxDescription = "Error Code: " + response.transactionResponse.errors[0].errorCode
                                                       + " Error Message: " + response.transactionResponse.errors[0].errorText;
                        }
                    }
                }
                else
                {
                    // Failed Transaction
                    if (response.transactionResponse != null && response.transactionResponse.errors != null)
                    {
                        payResponse.TrxApproved = false;
                        payResponse.TrxAuthorizationCode = response.transactionResponse.responseCode;
                        payResponse.TrxID = response.transactionResponse.transId;
                        payResponse.TrxMessage = response.transactionResponse.messages[0].description;
                        payResponse.TrxResponseCode = response.transactionResponse.responseCode;

                        payResponse.TrxDescription = "Error Code: " + response.transactionResponse.errors[0].errorCode
                                                   + " Error Message: " + response.transactionResponse.errors[0].errorText;
                    }
                    else
                    {
                        payResponse.TrxApproved = false;
                        payResponse.TrxDescription = "Error Code: " + response.messages.message[0].code
                                                   + " Error Message: " + response.messages.message[0].text;
                    }
                }
            }
            else
            {
                payResponse.TrxApproved = false;
                payResponse.TrxDescription = "Null Response from Payment Gateway.";
            }

            return payResponse;
        }

        public PayResponse ProcessPaymentOld(Pay pay, PaymentTypeKey key, List<PayLineItem> payLineItems)
        {
            PayResponse payResponse = new PayResponse();

            // Process Payment Here
            string lsAPILoginID = key.LoginId;
            string lsTransactionKey = key.TransactionKey;
            bool lbAuthNetInTestMode = false;

            if (key.TestMode)
            {
                lbAuthNetInTestMode = true;
            }

            // TLS 1.2 Bug fix
            const SslProtocols _Tls12 = (SslProtocols)0x00000C00;
            const SecurityProtocolType Tls12 = (SecurityProtocolType)_Tls12;
            ServicePointManager.SecurityProtocol = Tls12;
            //System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;

            //step 1 - create the request
            var request = new AuthorizationRequest(pay.CCNumber, pay.CCExp, decimal.Round(Convert.ToDecimal(pay.Total), 2), pay.Description);

            //These are optional calls to the API
            request.AddCardCode(pay.CCCardCode);

            string address = pay.BillingAddress + " " + pay.BillingAddress2;
            address = address.Trim();

            //Customer info - this is used for Fraud Detection
            request.AddCustomer(pay.ID, pay.Email, pay.FirstName, pay.LastName, pay.BillingAddress, pay.BillingCity, pay.BillingState, pay.BillingZip);

            //order number
            request.AddInvoice(pay.ID);

            // Set Billing and Shipping Address
            request.Country = pay.BillingCountry;
            request.ShipToCountry = pay.ShippingCountry;

            // Include customer phone number
            request.Phone = pay.Phone;

            //Custom values that will be returned with the response
            //request.AddMerchantValue("param1", "value1");

            // Credit Card or eCheck?
            //request.Method = "CC";
            //request.DelimData = "True";
            //request.Version = "3.1";
            //request.RelayResponse = "False";
            //request.Type = "AUTH_CAPTURE";

            //Shipping Address
            string addressShipping = pay.ShippingAddress + " " + pay.ShippingAddress2;
            addressShipping = address.Trim();

            request.AddShipping(pay.ID, pay.Email, pay.FirstName, pay.LastName, addressShipping, pay.ShippingCity, pay.ShippingState, pay.ShippingZip);

            // Add the purcahse line items
            foreach (var payLineItem in payLineItems)
            {
                string description = StringUtils.StripHTML(payLineItem.Description);
                request.AddLineItem(payLineItem.ID, StringUtils.Truncate(payLineItem.Name, 30), description, payLineItem.Quantity, payLineItem.Price, payLineItem.Taxable);
            }

            //step 2 - create the gateway, sending in your credentials
            Gateway gate = null;

            if (lbAuthNetInTestMode)
            {
                gate = new Gateway(lsAPILoginID, lsTransactionKey, lbAuthNetInTestMode);
            }
            else
            {
                gate = new Gateway(lsAPILoginID, lsTransactionKey);
            }

            //step 3 - make some money
            var response = gate.Send(request);

            if (response != null)
            {
                payResponse.TrxApproved = Convert.ToBoolean(response.Approved);
                payResponse.TrxAuthorizationCode = response.AuthorizationCode;
                payResponse.TrxDescription = pay.Description;
                payResponse.TrxID = response.TransactionID;
                payResponse.TrxMessage = response.Message;
                payResponse.TrxResponseCode = response.ResponseCode;
            }

            return payResponse;
        }
    }
}
