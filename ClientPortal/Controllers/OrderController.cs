using ClientPortal.Helpers;
using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace ClientPortal.Controllers
{
    public class OrderController : Controller
    {
        public async Task<IActionResult> Index(string email)
        {
            List<OrderVM> orders = await RequestHelper.SendRequestAsync<object, List<OrderVM>>(URLs.ORDER_ID.Replace("{id}", email.ToString()), HttpMethod.Get, null, null);

            return View(orders);
        }
        public IActionResult Create()
        {
            return View(new OrderCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrderCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync(URLs.ORDER, HttpMethod.Post, item, null);
            return RedirectToAction("Index", "Home");
        }
        public async Task<IActionResult> Paid(int itemid)
        {
            await RequestHelper.SendRequestAsync(URLs.ORDER_ID_PAID.Replace("{id}", itemid.ToString()), HttpMethod.Put, null);
            return RedirectToAction("Index", "Home");
        }
    }
}
