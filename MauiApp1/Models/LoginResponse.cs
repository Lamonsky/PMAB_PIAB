using System.Text.Json.Serialization;

namespace ClientPortal.Models
{
    public class LoginResponse
    {
        [JsonPropertyName("accessToken")]
        public string AccessToken { get; set; } = string.Empty;
    }
}
