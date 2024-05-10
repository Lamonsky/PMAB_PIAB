﻿using ClientPortal.Helpers;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;

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
    }
}