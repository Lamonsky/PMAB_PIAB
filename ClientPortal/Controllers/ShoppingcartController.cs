using ClientPortal.Helpers;
using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;

namespace ClientPortal.Controllers
{
    public class ShoppingCartController : Controller
    {
        public async Task<IActionResult> Index(string id)
        {
            ShoppingCartVM sh = await RequestHelper.SendRequestAsync<object, ShoppingCartVM>(URLs.SHOPPINGCART_ID.Replace("{id}", id.ToString()), HttpMethod.Get, null, null);
            List<CartDetailVM> list = await RequestHelper.SendRequestAsync<object, List<CartDetailVM>>(URLs.CARTDETAIL_ID.Replace("{id}", sh.Id.ToString()), HttpMethod.Get, null, null);
            return View(list);
        }

        public async Task<IActionResult> Delete(int id, int itemid)
        {
            StockCreateEditVM stockvm = await RequestHelper.SendRequestAsync<object, StockCreateEditVM>(URLs.STOCK_ID.Replace("{id}", itemid.ToString()), HttpMethod.Get, null, null);
            stockvm.Quantity += 1;
            await RequestHelper.SendRequestAsync<StockCreateEditVM>(URLs.STOCK_ID.Replace("{id}", stockvm.Id.ToString()), HttpMethod.Put, stockvm, null);
            await RequestHelper.SendRequestAsync(URLs.CARTDETAIL_ID.Replace("{id}", id.ToString()), HttpMethod.Delete, null);
            return RedirectToAction("Index", "Home");
        }
    }
}
