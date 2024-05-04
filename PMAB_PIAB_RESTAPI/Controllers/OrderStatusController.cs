using Data.CreateEditVMs;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class OrderStatusController : Controller
    {
        [Route(URLs.ORDERSTATUS)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<OrderStatusVM> list = await database.Categories
                .Select(item => new OrderStatusVM
                {
                    Id = item.Id,
                    StatusName = item.Name,
                    IsActive = item.IsActive.ToString(),

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.ORDERSTATUS)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] OrderCreateEditVM orderCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.OrderStatuses.Add(new()
            {
                StatusName = orderCreateEditVM.Name,
                IsActive = orderCreateEditVM.IsActive
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.ORDERSTATUS_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] OrderCreateEditVM orderCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            OrderStatus orderStatus = await databaseContext.OrderStatuses.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (orderStatus == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            orderStatus.StatusName = orderCreateEditVM.Name;
            orderStatus.IsActive = orderCreateEditVM.IsActive;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.ORDERSTATUS_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] OrderCreateEditVM orderCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            OrderStatus orderStatus = await databaseContext.OrderStatuses.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (orderStatus == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            orderStatus.IsActive = false;
            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
