using Data;
using Data.SelectVMs;
using Intranet.Helpers;
using Intranet.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Intranet.Controllers
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

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
