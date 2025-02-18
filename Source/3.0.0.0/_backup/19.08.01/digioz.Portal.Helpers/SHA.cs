using System;
using System.Text;
using System.Security.Cryptography;

namespace digioz.Portal.Helpers
{
	public static class SHA
	{
		/// <summary>
		/// Function to get Salt as a byte array of length 8 characters
		/// </summary>
		/// <returns></returns>
		private static byte[] GetSalt()
		{
			return GetSalt(8);
		}

		/// <summary>
		/// Function to get Salt as a byte array
		/// </summary>
		/// <param name="maximumSaltLength"></param>
		/// <returns></returns>
		private static byte[] GetSalt(int maximumSaltLength)
		{
			var salt = new byte[maximumSaltLength];

			//Require NameSpace: using System.Security.Cryptography;
			using (var random = new RNGCryptoServiceProvider())
			{
				random.GetNonZeroBytes(salt);
			}

			return salt;
		}

		/// <summary>
		/// Function to Hash username and password with Salt
		/// Source: https://www.codeproject.com/Articles/1112382/Login-functionality-in-MVC
		/// </summary>
		/// <param name="password"></param>
		/// <param name="username"></param>
		/// <param name="salt"></param>
		/// <returns></returns>
		public static string GetHash512WithSalt(string password, string username, byte[] salt)
		{
			try
			{
				//required NameSpace: using System.Text;
				//Plain Text in Byte
				byte[] plainTextBytes = Encoding.UTF8.GetBytes(password + username);

				//Plain Text + SALT Key in Byte
				byte[] plainTextWithSaltBytes = new byte[plainTextBytes.Length + salt.Length];

				for (int i = 0; i < plainTextBytes.Length; i++)
				{
					plainTextWithSaltBytes[i] = plainTextBytes[i];
				}

				for (int i = 0; i < salt.Length; i++)
				{
					plainTextWithSaltBytes[plainTextBytes.Length + i] = salt[i];
				}

				HashAlgorithm hash = new SHA512Managed();
				byte[] hashBytes = hash.ComputeHash(plainTextWithSaltBytes);
				byte[] hashWithSaltBytes = new byte[hashBytes.Length + salt.Length];

				for (int i = 0; i < hashBytes.Length; i++)
				{
					hashWithSaltBytes[i] = hashBytes[i];
				}

				for (int i = 0; i < salt.Length; i++)
				{
					hashWithSaltBytes[hashBytes.Length + i] = salt[i];
				}

				return Convert.ToBase64String(hashWithSaltBytes);
			}
			catch
			{
				return string.Empty;
			}
		}

		/// <summary>
		/// Function to Generate a Sha256 String
		/// Source: https://codeshare.co.uk/blog/sha-256-and-sha-512-hash-examples/
		/// </summary>
		/// <param name="inputString"></param>
		/// <returns></returns>
		public static string GenerateSHA256String(string inputString)
		{
			SHA256 sha256 = SHA256Managed.Create();
			byte[] bytes = Encoding.UTF8.GetBytes(inputString);
			byte[] hash = sha256.ComputeHash(bytes);

			return GetStringFromHash(hash);
		}

		/// <summary>
		/// Function to generate a Sha512 String
		/// </summary>
		/// <param name="inputString"></param>
		/// <returns></returns>
		public static string GenerateSHA512String(string inputString)
		{
			SHA512 sha512 = SHA512Managed.Create();
			byte[] bytes = Encoding.UTF8.GetBytes(inputString);
			byte[] hash = sha512.ComputeHash(bytes);

			return GetStringFromHash(hash);
		}

		/// <summary>
		/// Function to get String from byte Hash
		/// </summary>
		/// <param name="hash"></param>
		/// <returns></returns>
		private static string GetStringFromHash(byte[] hash)
		{
			StringBuilder result = new StringBuilder();

			for (int i = 0; i < hash.Length; i++)
			{
				result.Append(hash[i].ToString("X2"));
			}

			return result.ToString();
		}
	}

	public static class SHATest
	{
		public static bool TestPasswords()
		{
			bool isSame = false; 

			// Encryption Test 
			string password1 = SHA.GenerateSHA512String("Password1");
			string password2 = SHA.GenerateSHA512String("Password2");

			if (password1 == password2)
			{
				isSame = true;
			}

			return isSame;
		}
	}
}
