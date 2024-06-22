using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System.Diagnostics;

namespace Intranet.Controllers
{
    public class ItemController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<ItemVM> categories = await RequestHelper.SendRequestAsync<object, List<ItemVM>>(URLs.ITEM, HttpMethod.Get, null, null);
            return View(categories);
            
        }
        public async Task<IActionResult> Delete(int id)
        {
            await RequestHelper.SendRequestAsync(URLs.ITEM_ID.Replace("{id}", id.ToString()), HttpMethod.Delete, null);
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Create()
        {
            return View(new ItemCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(ItemCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync(URLs.ITEM, HttpMethod.Post, item, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["id"] = id;
            ItemCreateEditVM model = await RequestHelper.SendRequestAsync<object, ItemCreateEditVM>(URLs.ITEM_ID.Replace("{id}", id.ToString()), HttpMethod.Get, null, null);
            
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, ItemCreateEditVM itemCreateEditVM)
        {
            await RequestHelper.SendRequestAsync
                                <ItemCreateEditVM>
                                (URLs.ITEM_ID.Replace("{id}", id.ToString()), 
                                HttpMethod.Put, 
                                itemCreateEditVM, 
                                null);
            return RedirectToAction(nameof(Index));
        }
    }
}
