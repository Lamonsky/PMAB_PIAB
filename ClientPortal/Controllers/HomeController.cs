using ClientPortal.Helpers;
using ClientPortal.Models;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace ClientPortal.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public async Task<IActionResult> Index()
        {
            List<CategoryVM> categories = await RequestHelper.SendRequestAsync<object, List<CategoryVM>>(URLs.CATEGORY, HttpMethod.Get, null, null);
            return View(categories);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
