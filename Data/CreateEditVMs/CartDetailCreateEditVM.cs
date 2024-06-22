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
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("shoppingCardId")]
        public int? ShoppingCardId { get; set; }

        [JsonPropertyName("itemsId")]
        public int? ItemsId { get; set; }

        [JsonPropertyName("quantity")]
        public int? Quantity { get; set; }

        [JsonPropertyName("unitPrice")]
        public decimal? UnitPrice { get; set; }
    }
}
