using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class ShoppingCartCreateEditVM
    {
        public int Id { get; set; }

        public string? UserId { get; set; }

        public bool? IsActive { get; set; }
    }
}
