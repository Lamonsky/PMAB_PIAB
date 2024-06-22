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
            List<OrderStatusVM> list = await database.OrderStatuses
                .Select(item => new OrderStatusVM
                {
                    Id = item.Id,
                    StatusName = item.StatusName,
                    IsActive = item.IsActive.ToString(),

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.ORDERSTATUS_ID)]
        [HttpGet]
        public async Task<IActionResult> GetOrderStatus(int id)
        {
            DatabaseContext database = new();
            OrderStatusCreateEditVM list = await database.OrderStatuses
                .Select(item => new OrderStatusCreateEditVM
                {
                    Id = item.Id,
                    StatusName = item.StatusName,
                    IsActive = item.IsActive,

                }).FirstOrDefaultAsync();
            return Json(list);
        }
        [Route(URLs.ORDERSTATUS)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] OrderStatusCreateEditVM orderStatusCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.OrderStatuses.Add(new()
            {
                StatusName = orderStatusCreateEditVM.StatusName,
                IsActive = orderStatusCreateEditVM.IsActive
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.ORDERSTATUS_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] OrderStatusCreateEditVM orderStatusCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            OrderStatus orderStatus = await databaseContext.OrderStatuses.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (orderStatus == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            orderStatus.StatusName = orderStatusCreateEditVM.StatusName;
            orderStatus.IsActive = orderStatusCreateEditVM.IsActive;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.ORDERSTATUS_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] OrderStatusCreateEditVM orderStatusCreateEditVM)
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
