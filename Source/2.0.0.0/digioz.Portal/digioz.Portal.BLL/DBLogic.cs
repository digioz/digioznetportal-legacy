using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.BLL
{
    public class DBLogic : BaseLogic
    {
        public static List<string> GetTables()
        {
            var tableNames = new List<string>();

            using (Db)
            {
                var metadata = ((IObjectContextAdapter)Db).ObjectContext.MetadataWorkspace;

                var tables = metadata.GetItemCollection(DataSpace.SSpace)
                    .GetItems<EntityContainer>()
                    .Single()
                    .BaseEntitySets
                    .OfType<EntitySet>()
                    .Where(s => !s.MetadataProperties.Contains("Type")
                    || s.MetadataProperties["Type"].ToString() == "Tables");

                foreach (var table in tables)
                {
                    var tableName = table.MetadataProperties.Contains("Table")
                        && table.MetadataProperties["Table"].Value != null
                        ? table.MetadataProperties["Table"].Value.ToString()
                        : table.Name;

                    //var tableSchema = table.MetadataProperties["Schema"].Value.ToString();

                    //Console.WriteLine(tableSchema + "." + tableName);

                    tableNames.Add(tableName);
                }

                tableNames = tableNames.OrderBy(x => x).ToList();

                return tableNames;
            }
        }
    }
}
