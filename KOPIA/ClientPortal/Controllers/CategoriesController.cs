using ClientPortal.Helpers;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using Data.CreateEditVMs;

namespace ClientPortal.Controllers
{
    public class CategoriesController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<CategoryVM> categories = await RequestHelper.SendRequestAsync<object, List<CategoryVM>>(URLs.CATEGORY, HttpMethod.Get, null, null);
            return View(categories);
        }

        public async Task<IActionResult> Items(int category)
        {
            List<ItemVM> items = await RequestHelper.SendRequestAsync<object, List<ItemVM>>(URLs.ITEM_CATEGORY_ID.Replace("{id}", category.ToString()), HttpMethod.Get, null, null);
            return View(items);
        }
        public async Task<IActionResult> AddToCart(int itemid, string email)
        {
            ItemCreateEditVM itemvm = await RequestHelper.SendRequestAsync<object, ItemCreateEditVM>(URLs.ITEM_ID.Replace("{id}", itemid.ToString()), HttpMethod.Get, null, null);
            ShoppingCartVM cartVM = await RequestHelper.SendRequestAsync<object, ShoppingCartVM>(URLs.SHOPPINGCART_ID.Replace("{id}", email), HttpMethod.Get, null, null);
            CartDetailCreateEditVM cartDetailCreateEditVM = new CartDetailCreateEditVM();
            cartDetailCreateEditVM.ShoppingCardId = cartVM.Id;
            cartDetailCreateEditVM.Quantity = 1;
            cartDetailCreateEditVM.ItemsId = itemvm.Id;
            cartDetailCreateEditVM.UnitPrice = itemvm.Price;
            await RequestHelper.SendRequestAsync<CartDetailCreateEditVM>(URLs.CARTDETAIL, HttpMethod.Post, cartDetailCreateEditVM, null);
            return RedirectToAction("Index", "Home");
        }

    }
}