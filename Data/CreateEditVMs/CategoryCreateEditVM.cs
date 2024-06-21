using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class CategoryCreateEditVM
    {
        [JsonPropertyName("id")]
        public int Id { get; set; }
        [JsonPropertyName("name")]
        public string? Name { get; set; }
        [JsonPropertyName("imageURL")]
        public string? ImageURL { get; set; }
        [JsonPropertyName("isActive")]
        public bool? IsActive { get; set; }
    }
}
