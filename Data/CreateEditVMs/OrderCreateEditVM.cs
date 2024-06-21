using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json.Serialization;

namespace Data.CreateEditVMs
{
    public class OrderCreateEditVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }
        [JsonPropertyName("userId")]
        public string? UserId { get; set; }
        [JsonPropertyName("createDate")]
        public DateTime? CreateDate { get; set; }
        [JsonPropertyName("orderStatusId")]
        public int? OrderStatusId { get; set; }
        [JsonPropertyName("isActive")]
        public bool? IsActive { get; set; }
        [JsonPropertyName("name")]
        public string? Name { get; set; }
        [JsonPropertyName("email")]
        public string? Email { get; set; }
        [JsonPropertyName("mobileNumber")]
        public string? MobileNumber { get; set; }
        [JsonPropertyName("address")]
        public string? Address { get; set; }
        [JsonPropertyName("paymentMethodId")]
        public int? PaymentMethodId { get; set; }
        [JsonPropertyName("isPaid")]
        public bool? IsPaid { get; set; }
    }
}
