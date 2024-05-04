using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class OrderStatusCreateEditVM
    {
        public int Id { get; set; }

        public string? StatusName { get; set; }

        public bool? IsActive { get; set; }
    }
}
