using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.SelectVMs
{
    public class CartDetailVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("shoppingcard")]
        public string? ShoppingCard { get; set; }

        [JsonPropertyName("items")]
        public string? Items { get; set; }
        [JsonPropertyName("itemId")]
        public int ItemId { get; set; }

        [JsonPropertyName("quantity")]
        public int? Quantity { get; set; }

        [JsonPropertyName("unitprice")]
        public decimal? UnitPrice { get; set; }
    }
}
