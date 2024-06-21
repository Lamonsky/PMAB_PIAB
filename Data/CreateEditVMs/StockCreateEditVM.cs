using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class StockCreateEditVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }
        [JsonPropertyName("itemsId")]
        public int? ItemsId { get; set; }
        [JsonPropertyName("quantity")]
        public int? Quantity { get; set; }
    }
}
