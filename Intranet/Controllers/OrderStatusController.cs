using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Intranet.Controllers
{
    public class OrderStatusController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<OrderStatusVM> list = await RequestHelper.SendRequestAsync<object, List<OrderStatusVM>>(URLs.ORDERSTATUS, HttpMethod.Get, null, null);
            return View(list);
        }
        public async Task<IActionResult> Delete(int id)
        {
            await RequestHelper.SendRequestAsync(URLs.ORDERSTATUS_ID.Replace("{id}", id.ToString()), HttpMethod.Delete, null);
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Create()
        {
            return View(new OrderStatusCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(OrderStatusCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync(URLs.ORDERSTATUS, HttpMethod.Post, item, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["Id"] = id;
            OrderStatusCreateEditVM orderStatus = await RequestHelper.SendRequestAsync
                                            <object, OrderStatusCreateEditVM>
                                            (URLs.ORDERSTATUS_ID.Replace("{id}", id.ToString()),
                                            HttpMethod.Get,
                                            null, null);
            return View(orderStatus);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, OrderStatusCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync<OrderStatusCreateEditVM>(URLs.ORDERSTATUS_ID.Replace("{id}", id.ToString()), HttpMethod.Put, item, null);
            return RedirectToAction(nameof(Index));
        }
    }
}
