using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class CartDetailCreateEditVM
    {
        public int Id { get; set; }

        public int? ShoppingCardId { get; set; }

        public int? ItemsId { get; set; }

        public int? Quantity { get; set; }

        public decimal? UnitPrice { get; set; }
    }
}
