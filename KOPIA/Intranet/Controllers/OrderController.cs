using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Intranet.Controllers
{
    public class OrderController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<OrderVM> list = await RequestHelper.SendRequestAsync<object, List<OrderVM>>(URLs.ORDER, HttpMethod.Get, null, null);
            return View(list);
        }
        public IActionResult Create()
        {
            return View(new OrderCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrderCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync(URLs.ORDER, HttpMethod.Post, item, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["Id"] = id;
            OrderCreateEditVM item = await RequestHelper.SendRequestAsync
                                            <object, OrderCreateEditVM>
                                            (URLs.ORDER_ID.Replace("{id}", id.ToString()),
                                            HttpMethod.Get,
                                            null, null);
            return View(item);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, OrderCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync
                                <OrderCreateEditVM>
                                (URLs.ORDER_ID.Replace("{id}", id.ToString()),
                                HttpMethod.Put,
                                item,
                                null);
            return RedirectToAction(nameof(Index));
        }
    }
}
