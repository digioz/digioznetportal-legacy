using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace digioz.Portal.BO
{
	public class AspNetUserRole
	{
		[Required]
		public string UserId { get; set; }
		[Required]
		public string RoleId { get; set; }
	}
}
