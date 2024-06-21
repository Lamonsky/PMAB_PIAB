using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.SelectVMs
{
    public class OrderVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }

        [JsonPropertyName("user")]
        public string? User { get; set; }

        [JsonPropertyName("createDate")]
        public DateTime? CreateDate { get; set; }

        [JsonPropertyName("orderStatus")]
        public string? OrderStatus { get; set; }

        [JsonPropertyName("isActive")]
        public string? IsActive { get; set; }

        [JsonPropertyName("name")]
        public string? Name { get; set; }

        [JsonPropertyName("email")]
        public string? Email { get; set; }

        [JsonPropertyName("mobileNumber")]
        public string? MobileNumber { get; set; }

        [JsonPropertyName("address")]
        public string? Address { get; set; }

        [JsonPropertyName("paymentMethod")]
        public string? PaymentMethod { get; set; }

        [JsonPropertyName("isPaid")]
        public string? IsPaid { get; set; }
    }
}
