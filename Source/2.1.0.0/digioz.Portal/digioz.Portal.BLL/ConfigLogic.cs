using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using digioz.Portal.Data.Context;
using digioz.Portal.Domain.DomainModel;
using digioz.Portal.Utilities;

namespace digioz.Portal.BLL
{
    /// <summary>
    /// Class to perform Configuration 
    /// related Business Logic
    /// </summary>
    public class ConfigLogic : BaseLogic
    {
        /// <summary>
        /// Gets a specific configuration
        /// record based on the id passed in
        /// </summary>
        /// <param name="id">The identifier.</param>
        /// <returns></returns>
        public static Config Get(int id)
        {
            Config config = Db.Configs.Find(id);

            return config;
        }

        /// <summary>
        /// Gets all configuration records
        /// from the database
        /// </summary>
        /// <returns></returns>
        public static List<Config> GetAll()
        {
            var configs = Db.Configs.ToList();

            return configs;
        }

        /// <summary>
        /// Gets all Configuration Key and Value 
        /// settings, and adds them to a dictionary
        /// object making it easier to find a value
        /// for a specific configuration key
        /// </summary>
        /// <returns></returns>
        public static Dictionary<string, string> GetConfig()
        {
            var configRecords = Db.Configs.ToList();
            var configDictionary = new Dictionary<string, string>();
            var encryptionKey = Db.Configs.SingleOrDefault(x => x.ConfigKey == "SiteEncryptionKey");

            foreach (var item in configRecords)
            {
                string configValue = item.ConfigValue;

                if (item.IsEncrypted)
                {
                    StringEncryption encryption = new StringEncryption(encryptionKey.ConfigValue);
                    configValue = encryption.Decrypt(item.ConfigValue);
                }

                configDictionary.Add(item.ConfigKey, configValue);
            }

            return configDictionary;
        }

        public static Config GetEncryptionKey()
        {
            var encryptionKey = Db.Configs.SingleOrDefault(x => x.ConfigKey == "SiteEncryptionKey");
            return encryptionKey;
        }

        /// <summary>
        /// Adds the specified configuration 
        /// record to the database
        /// </summary>
        /// <param name="config">The configuration.</param>
        public static void Add(Config config)
        {
            if (config.IsEncrypted)
            {
                var configArray = ConfigLogic.GetConfig();
                string encryptionKey = configArray["SiteEncryptionKey"];
                StringEncryption stringEncryption = new StringEncryption(encryptionKey);

                config.ConfigValue = stringEncryption.Encrypt(config.ConfigValue);
            }

            Db.Configs.Add(config);
            Db.SaveChanges();
        }

        /// <summary>
        /// Edits the specified configuration
        /// record in the database and updates it
        /// </summary>
        /// <param name="config">The configuration.</param>
        public static void Edit(Config config)
        {
            if (config.IsEncrypted)
            {
                var encryptionKey = GetEncryptionKey();
                StringEncryption stringEncryption = new StringEncryption(encryptionKey.ConfigValue);

                config.ConfigValue = stringEncryption.Encrypt(config.ConfigValue);
            }

            Db.Entry(config).State = EntityState.Modified;
            Db.SaveChanges();
        }

        /// <summary>
        /// Deletes the specified configuration
        /// record from the database
        /// </summary>
        /// <param name="id">The identifier.</param>
        public static void Delete(int id)
        {
            var config = Db.Configs.Find(id);
            Db.Configs.Remove(config);
            Db.SaveChanges();
        }
    }
}
