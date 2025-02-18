//using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Security.Claims;
using System.Linq;
using digioz.Portal.BLL;
using digioz.Portal.BO;

namespace digioz.Portal.Identity
{
    /// <summary>
    /// Class that represents the Role table in the Database
    /// </summary>
    public class RoleTable
    {
        //private DbManager db;
        /// <summary>
        /// Constructor that takes a DbManager instance 
        /// </summary>
        /// <param name="database"></param>
        //public RoleTable(DbManager database)
        //{
        //    db = database;
        //}

        /// <summary>
        /// Deltes a role from the Roles table
        /// </summary>
        /// <param name="roleId">The role Id</param>
        /// <returns></returns>
        public void Delete(string roleId)
        {
			var roleLogic = new AspNetRoleLogic();
			roleLogic.Delete(roleId);
        }

        /// <summary>
        /// Inserts a new Role in the Roles table
        /// </summary>
        /// <param name="roleName">The role's name</param>
        /// <returns></returns>
        public void Insert(IdentityRole role)
        {
			var roleBO = new AspNetRole()
			{
				Id = role.Id,
				Name = role.Name
			};

			var roleLogic = new AspNetRoleLogic();
			roleLogic.Add(roleBO);
        }

        /// <summary>
        /// Returns a role name given the roleId
        /// </summary>
        /// <param name="roleId">The role Id</param>
        /// <returns>Role name</returns>
        public string GetRoleName(string roleId)
        {
			var roleLogic = new AspNetRoleLogic();
			var role = roleLogic.Get(roleId);

			return role.Name;
        }

        /// <summary>
        /// Returns the role Id given a role name
        /// </summary>
        /// <param name="roleName">Role's name</param>
        /// <returns>Role's Id</returns>
        public string GetRoleId(string roleName)
        {
			var roleLogic = new AspNetRoleLogic();
			var roleId = roleLogic.GetRoleId(roleName);

			return roleId;
        }

        /// <summary>
        /// Gets the IdentityRole given the role Id
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public IdentityRole GetRoleById(string roleId)
        {
            var roleName = GetRoleName(roleId);
            IdentityRole role = null;

            if (roleName != null)
            {
                role = new IdentityRole(roleName, roleId);
            }

            return role;
        }

        /// <summary>
        /// Gets the IdentityRole given the role name
        /// </summary>
        /// <param name="roleName"></param>
        /// <returns></returns>
        public IdentityRole GetRoleByName(string roleName)
        {
            var roleId = GetRoleId(roleName);
            IdentityRole role = null;

            if (roleId != null)
            {
                role = new IdentityRole(roleName, roleId);
            }

            return role;
        }

        public void Update(IdentityRole role)
        {
			var roleBO = new AspNetRole()
			{
				Id = role.Id,
				Name = role.Name
			};

			var roleLogic = new AspNetRoleLogic();
			roleLogic.Edit(roleBO);
        }
    }
}
