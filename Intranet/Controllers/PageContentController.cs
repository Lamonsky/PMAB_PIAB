using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;

namespace Intranet.Controllers
{
    public class PageContentController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<PageContentVM> categories = await RequestHelper.SendRequestAsync<object, List<PageContentVM>>(URLs.PAGECONTENT, HttpMethod.Get, null, null);
            return View(categories);

        }
        public async Task<IActionResult> Delete(int id)
        {
            await RequestHelper.SendRequestAsync(URLs.PAGECONTENT_ID.Replace("{id}", id.ToString()), HttpMethod.Delete, null);
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Create()
        {
            return View(new PageContentCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(PageContentCreateEditVM PAGECONTENT)
        {
            await RequestHelper.SendRequestAsync(URLs.PAGECONTENT, HttpMethod.Post, PAGECONTENT, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["id"] = id;
            PageContentCreateEditVM model = await RequestHelper.SendRequestAsync<object, PageContentCreateEditVM>(URLs.PAGECONTENTEDIT_ID.Replace("{id}", id.ToString()), HttpMethod.Get, null, null);

            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, PageContentCreateEditVM PageContentCreateEditVM)
        {
            await RequestHelper.SendRequestAsync
                                <PageContentCreateEditVM>
                                (URLs.PAGECONTENT_ID.Replace("{id}", id.ToString()),
                                HttpMethod.Put,
                                PageContentCreateEditVM,
                                null);
            return RedirectToAction(nameof(Index));
        }
    }
}
