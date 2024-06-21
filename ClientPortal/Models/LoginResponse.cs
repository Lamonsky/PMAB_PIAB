using System.Text.Json.Serialization;

namespace MauiApp1.Models
{
    public class LoginResponse
    {
        [JsonPropertyName("accessToken")]
        public string AccessToken { get; set; } = string.Empty;
    }
}
