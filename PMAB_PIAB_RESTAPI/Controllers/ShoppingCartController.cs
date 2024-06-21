using Data.CreateEditVMs;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class ShoppingCartController : Controller
    {
        [Route(URLs.SHOPPINGCART)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<ShoppingCartVM> list = await database.Shoppingcards
                .Select(item => new ShoppingCartVM
                {
                    Id = item.Id,
                    User = item.UserId,
                    IsActive = item.IsActive.ToString(),

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.SHOPPINGCART_ID)]
        [HttpGet]
        public async Task<IActionResult> GetByEmail(string id)
        {
            DatabaseContext database = new();
            ShoppingCartVM list = await database.Shoppingcards
                .Where(item => item.UserId == id)
                .Select(item => new ShoppingCartVM
                {
                    Id = item.Id,
                    User = item.UserId,
                    IsActive = item.IsActive.ToString(),

                }).FirstOrDefaultAsync();
            return Json(list);
        }
        [Route(URLs.SHOPPINGCART)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] ShoppingCartCreateEditVM shoppingCartCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.Shoppingcards.Add(new()
            {
                UserId = shoppingCartCreateEditVM.UserId,
                IsActive = shoppingCartCreateEditVM.IsActive
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.SHOPPINGCART_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] ShoppingCartCreateEditVM shoppingCartCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Shoppingcard shoppingcard = await databaseContext.Shoppingcards.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (shoppingcard == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            shoppingcard.UserId = shoppingCartCreateEditVM.UserId;
            shoppingcard.IsActive = shoppingCartCreateEditVM.IsActive;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.SHOPPINGCART_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] ShoppingCartCreateEditVM shoppingCartCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Shoppingcard shoppingcard = await databaseContext.Shoppingcards.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (shoppingcard == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            shoppingcard.IsActive = false;
            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
