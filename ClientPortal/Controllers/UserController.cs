using ClientPortal.Helpers;
using ClientPortal.Models;
using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;

namespace ClientPortal.Controllers
{
    public class UserController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(LoginRequest loginRequest)
        {
            LoginResponse loginResponse = await RequestHelper.SendRequestAsync<LoginRequest, LoginResponse>("/login", HttpMethod.Post, loginRequest, null);
            try
            {
                ShoppingCartVM shoppingCartVM = await RequestHelper.SendRequestAsync<object, ShoppingCartVM>(URLs.SHOPPINGCART_ID.Replace("{id}", loginRequest.EMail.ToString()), HttpMethod.Get, null, null);
                if( shoppingCartVM == null)
                {
                    ShoppingCartCreateEditVM item = new ShoppingCartCreateEditVM();
                    item.UserId = loginRequest.EMail;
                    await RequestHelper.SendRequestAsync(URLs.SHOPPINGCART, HttpMethod.Post, item, null);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Response.Cookies.Append("token", loginResponse.AccessToken);
            Response.Cookies.Append("email", loginRequest.EMail);
            return RedirectToAction("Index", "Home");
        }
        public IActionResult Logout()
        {
            if (Request.Cookies["email"] != null)
            {
                Response.Cookies.Delete("email");
                
            }
            return RedirectToAction("Index", "Home");
        }
    }
}
