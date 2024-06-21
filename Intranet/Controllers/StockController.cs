using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Intranet.Controllers
{
    public class StockController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<StockVM> stocks = await RequestHelper.SendRequestAsync<object, List<StockVM>>(URLs.STOCK, HttpMethod.Get, null, null);
            return View(stocks);
        }        
        public IActionResult Create()
        {
            return View(new StockCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(StockCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync(URLs.STOCK, HttpMethod.Post, item, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["Id"] = id;
            StockCreateEditVM item = await RequestHelper.SendRequestAsync
                                            <object, StockCreateEditVM>
                                            (URLs.STOCK_ID.Replace("{id}", id.ToString()),
                                            HttpMethod.Get,
                                            null, null);
            return View(item);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, StockCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync
                                <StockCreateEditVM>
                                (URLs.STOCK_ID.Replace("{id}", id.ToString()),
                                HttpMethod.Put,
                                item,
                                null);
            return RedirectToAction(nameof(Index));
        }
    }
}
