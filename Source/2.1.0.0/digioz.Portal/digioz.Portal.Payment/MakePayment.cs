using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Payment.AuthNet;
using digioz.Portal.Payment.PayPalPay;

namespace digioz.Portal.Payment
{
    public enum PaymentType
    {
        AuthorizeNet,
        PayPal,
        GooglePay,
        WireTransfer,
        ElectronicCheck
    }

    public class MakePayment
    {
        public PayResponse ProcessPayment(Pay pay, PaymentType payType, PaymentTypeKey key, List<PayLineItem> payLineItems )
        {
            IMakePayment makePayment;
            PayResponse payResponse = null;

            if (payType == PaymentType.AuthorizeNet)
            {
                makePayment = new AuthNetMakePayment();

                payResponse = makePayment.ProcessPayment(pay, key, payLineItems);
            }
            if (payType == PaymentType.PayPal)
            {
                makePayment = new PaypalMakePayment();

                payResponse = makePayment.ProcessPayment(pay, key, payLineItems);
            }

            return payResponse;
        }
    }
}
