using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Intranet.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System.Diagnostics;

namespace Intranet.Controllers
{
    public class PaymentMethodController : Controller
    {
        public async Task<IActionResult> Index()
        {
            List<PaymentMethodVM> method = await RequestHelper.SendRequestAsync<object, List<PaymentMethodVM>>(URLs.PAYMENTMETHOD, HttpMethod.Get, null, null);
            return View(method);
        }
        public async Task<IActionResult> Delete(int id)
        {
            await RequestHelper.SendRequestAsync(URLs.PAYMENTMETHOD_ID.Replace("{id}", id.ToString()), HttpMethod.Delete, null);
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Create()
        {
            return View(new PaymentMethodCreateEditVM());
        }
        [HttpPost]
        public async Task<IActionResult> Create(PaymentMethodCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync(URLs.PAYMENTMETHOD, HttpMethod.Post, item, null);
            return RedirectToAction(nameof(Index));
        }
        public async Task<IActionResult> Edit(int id)
        {
            ViewData["Id"] = id;
            PaymentMethodCreateEditVM item = await RequestHelper.SendRequestAsync
                                            <object, PaymentMethodCreateEditVM>
                                            (URLs.PAYMENTMETHOD_ID.Replace("{id}", id.ToString()),
                                            HttpMethod.Get,
                                            null, null);
            return View(item);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(int id, PaymentMethodCreateEditVM item)
        {
            await RequestHelper.SendRequestAsync
                                <PaymentMethodCreateEditVM>
                                (URLs.PAYMENTMETHOD_ID.Replace("{id}", id.ToString()),
                                HttpMethod.Put,
                                item,
                                null);
            return RedirectToAction(nameof(Index));
        }
    }
}
