using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PMAB_PIAB_RESTAPI.Models;
using PMAB_PIAB_RESTAPI.Models.Contexts;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class CartDetailController : Controller
    {
        [Route(URLs.CARTDETAIL)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext context = new();
            List<CartDetailVM> list = await context.CartDetails
                .Select(item => new CartDetailVM()
                {
                    Id = item.Id,
                    ShoppingCard = item.ShoppingCard.UserId,
                    Items = item.Items.Name,
                    ItemId = item.Items.Id,
                    Quantity = item.Quantity,
                    UnitPrice = item.UnitPrice
                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.CARTDETAIL_ID)]
        [HttpGet]
        public async Task<IActionResult> GetByEmail(int id)
        {
            DatabaseContext context = new();
            List<CartDetailVM> list = await context.CartDetails
                .Where(item => item.ShoppingCardId == id)
                .Select(item => new CartDetailVM()
                {
                    Id = item.Id,
                    ShoppingCard = item.ShoppingCard.UserId,
                    Items = item.Items.Name + " " + item.Items.Price,
                    ItemId = item.Items.Id,
                    Quantity = item.Quantity,
                    UnitPrice = item.UnitPrice
                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.CARTDETAIL)]
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CartDetailCreateEditVM cartDetailCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.CartDetails.Add(new()
            {
                ShoppingCardId = cartDetailCreateEditVM.ShoppingCardId,
                ItemsId = cartDetailCreateEditVM.ItemsId,
                Quantity = cartDetailCreateEditVM.Quantity,
                UnitPrice = cartDetailCreateEditVM.UnitPrice
            });
            
            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.CARTDETAIL_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] CartDetailCreateEditVM cartDetailCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            CartDetail cartDetail = await databaseContext.CartDetails.Where(item => item.Id == id).FirstOrDefaultAsync();
            if(cartDetail == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }

            cartDetail.ShoppingCardId = cartDetailCreateEditVM.ShoppingCardId;
            cartDetail.ItemsId = cartDetailCreateEditVM.ItemsId;
            cartDetail.Quantity = cartDetailCreateEditVM.Quantity;
            cartDetail.UnitPrice = cartDetailCreateEditVM.UnitPrice;


            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.CARTDETAIL_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            DatabaseContext databaseContext = new();
            CartDetail cartDetail = await databaseContext.CartDetails.Where(item => item.Id == id).FirstOrDefaultAsync();
            if (cartDetail == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            databaseContext.CartDetails.Remove(cartDetail);

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
