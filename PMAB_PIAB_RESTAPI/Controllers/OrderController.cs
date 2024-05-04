using Data.CreateEditVMs;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.Blazor;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages.Manage;
using System.Net;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class OrderController : Controller
    {
        [Route(URLs.ORDER)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<OrderVM> list = await database.Orders
                .Select(item => new OrderVM
                {
                    Id = item.Id,
                    Name = item.Name,
                    User = item.UserId,
                    CreateDate = item.CreateDate,
                    OrderStatus = item.OrderStatus.StatusName,
                    IsActive = item.IsActive.ToString(),
                    Email = item.Email,
                    MobileNumber = item.MobileNumber,
                    Address = item.Address,
                    PaymentMethod = item.PaymentMethod.Name,
                    IsPaid = item.IsPaid.ToString(),
                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.ORDER)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] OrderCreateEditVM orderCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.Orders.Add(new()
            {
                UserId = orderCreateEditVM.UserId,
                CreateDate = DateTime.Now,
                OrderStatusId = orderCreateEditVM.OrderStatusId,
                Name = orderCreateEditVM.Name,
                IsActive = orderCreateEditVM.IsActive,
                Email = orderCreateEditVM.Email,
                MobileNumber= orderCreateEditVM.MobileNumber,
                Address = orderCreateEditVM.Address,
                PaymentMethodId = orderCreateEditVM.PaymentMethodId,
                IsPaid = orderCreateEditVM.IsPaid
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.ORDER_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] OrderCreateEditVM orderCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Order order = await databaseContext.Orders.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (order == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }

            order.UserId = orderCreateEditVM.UserId;
            order.CreateDate = DateTime.Now;
            order.OrderStatusId = orderCreateEditVM.OrderStatusId;
            order.Name = orderCreateEditVM.Name;
            order.IsActive = orderCreateEditVM.IsActive;
            order.Email = orderCreateEditVM.Email;
            order.MobileNumber= orderCreateEditVM.MobileNumber;
            order.Address = orderCreateEditVM.Address;
            order.PaymentMethodId = orderCreateEditVM.PaymentMethodId;
            order.IsPaid = orderCreateEditVM.IsPaid;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.ORDER_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] OrderCreateEditVM orderCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Order order = await databaseContext.Orders.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (order == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            order.IsActive = false;
            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
