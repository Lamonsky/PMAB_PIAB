using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.SelectVMs
{
    public class OrderStatusVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("statusName")]
        public string? StatusName { get; set; }

        [JsonPropertyName("isActive")]
        public string? IsActive { get; set; }
    }
}
