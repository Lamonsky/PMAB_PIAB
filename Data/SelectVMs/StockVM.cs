using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.SelectVMs
{
    public class StockVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("item")]
        public string? Item { get; set; }

        [JsonPropertyName("quantity")]
        public int? Quantity { get; set; }
    }
}
