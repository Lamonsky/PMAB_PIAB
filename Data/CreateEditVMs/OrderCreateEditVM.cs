using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class OrderCreateEditVM
    {
        public int Id { get; set; }

        public string? UserId { get; set; }

        public DateTime? CreateDate { get; set; }

        public int? OrderStatusId { get; set; }

        public bool? IsActive { get; set; }

        public string? Name { get; set; }

        public string? Email { get; set; }

        public string? MobileNumber { get; set; }

        public string? Address { get; set; }

        public int? PaymentMethodId { get; set; }

        public bool? IsPaid { get; set; }
    }
}
