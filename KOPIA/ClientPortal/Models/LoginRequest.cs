﻿using System.Security.Policy;
using System.Text.Json.Serialization;

namespace ClientPortal.Models
{
    public class LoginRequest
    {
        [JsonPropertyName("eMail")]
        public string EMail { get; set; } = null!;
        [JsonPropertyName("password")]
        public string Password { get; set; } = null!;
    }
}
