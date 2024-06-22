using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System.Diagnostics;

namespace Intranet.Controllers
{
    public class CategoryController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<CategoryVM> categories = await RequestHelper.SendRequestAsync<object, List<CategoryVM>>(URLs.CATEGORY, HttpMethod.Get, null, null);
            return View(categories);
        }
        public async Task<IActionResult> Delete(int id)
        {
            await RequestHelper.SendRequestAsync(URLs.CATEGORY_ID.Replace("{id}", id.ToString()), HttpMethod.Delete, null);
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Create()
        {
            return View(new CategoryCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(CategoryCreateEditVM categoryCreateEditVM)
        {
            await RequestHelper.SendRequestAsync(URLs.CATEGORY, HttpMethod.Post, categoryCreateEditVM, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["Id"] = id;
            CategoryCreateEditVM category = await RequestHelper.SendRequestAsync
                                            <object, CategoryCreateEditVM>
                                            (URLs.CATEGORY_ID.Replace("{id}", id.ToString()),
                                            HttpMethod.Get,
                                            null, null);
            return View(category);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, CategoryCreateEditVM categoryCreateEditVM)
        {
            await RequestHelper.SendRequestAsync<CategoryCreateEditVM>(URLs.CATEGORY_ID.Replace("{id}", id.ToString()), HttpMethod.Put, categoryCreateEditVM, null);
            return RedirectToAction(nameof(Index));
        }
    }
}
