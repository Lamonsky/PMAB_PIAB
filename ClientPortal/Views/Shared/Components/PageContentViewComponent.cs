using ClientPortal.Helpers;
using Data;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Runtime.InteropServices.ObjectiveC;

namespace ClientPortal.Views.Shared.Components
{
    [ViewComponent(Name = "PageContentViewComponent")]
    public class PageContentViewComponentClass : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync(string type)
        {
            List<PageContentVM> orders = await RequestHelper.SendRequestAsync<object, List<PageContentVM>>(URLs.PAGECONTENT, HttpMethod.Get, null, null);

            PageContentVM vm = orders.FirstOrDefault(p => p.Title == type);
            if (vm == null)
            {
                return View("Default", "");
            }
            else
            {
                return View("Default", vm.Content);
            }            
        }
    }
}
