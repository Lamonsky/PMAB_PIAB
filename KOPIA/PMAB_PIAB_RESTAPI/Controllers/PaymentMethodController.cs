using Data.CreateEditVMs;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class PaymentMethodController : Controller
    {
        [Route(URLs.PAYMENTMETHOD)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<PaymentMethodVM> list = await database.PaymentMethods
                .Select(item => new PaymentMethodVM
                {
                    Id = item.Id,
                    Name = item.Name,
                    IsActive = item.IsActive.ToString(),

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.PAYMENTMETHOD_ID)]
        [HttpGet]
        public async Task<IActionResult> GetPaymentMethod(int id)
        {
            DatabaseContext database = new();
            PaymentMethodCreateEditVM list = await database.PaymentMethods
                .Where(item => item.Id == id)
                .Select(item => new PaymentMethodCreateEditVM
                {
                    Id = item.Id,
                    Name = item.Name,
                    IsActive = item.IsActive

                }).FirstOrDefaultAsync();
            return Json(list);
        }
        [Route(URLs.PAYMENTMETHOD)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] PaymentMethodCreateEditVM paymentMethodCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.PaymentMethods.Add(new()
            {
                Name = paymentMethodCreateEditVM.Name,
                IsActive = paymentMethodCreateEditVM.IsActive
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.PAYMENTMETHOD_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] PaymentMethodCreateEditVM paymentMethodCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            PaymentMethod paymentMethod = await databaseContext.PaymentMethods.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (paymentMethod == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            paymentMethod.Name = paymentMethodCreateEditVM.Name;
            paymentMethod.IsActive = paymentMethodCreateEditVM.IsActive;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.PAYMENTMETHOD_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] PaymentMethodCreateEditVM paymentMethodCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            PaymentMethod paymentMethod = await databaseContext.PaymentMethods.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (paymentMethod == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            paymentMethod.IsActive = false;
            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
