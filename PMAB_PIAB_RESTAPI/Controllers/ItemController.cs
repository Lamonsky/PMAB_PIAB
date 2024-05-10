using Data.CreateEditVMs;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class ItemController : Controller
    {
        [Route(URLs.ITEM)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<ItemVM> list = await database.Items
                .Select(item => new ItemVM
                {
                    Id = item.Id,
                    Name = item.Name,
                    Description = item.Description,
                    Category = item.Category.Name,
                    Price = item.Price,
                    ImageUrl = item.ImageUrl,
                    IsActive = item.IsActive

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.ITEM_CATEGORY_ID)]
        [HttpGet]
        public async Task<IActionResult> Index(int id)
        {
            DatabaseContext database = new();
            List<ItemVM> list = await database.Items
                .Where(item => item.CategoryId == id)
                .Select(item => new ItemVM
                {
                    Id = item.Id,
                    Name = item.Name,
                    Description = item.Description,
                    Category = item.Category.Name,
                    Price = item.Price,
                    ImageUrl = item.ImageUrl,
                    IsActive = item.IsActive

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.ITEM)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] ItemCreateEditVM item)
        {
            DatabaseContext databaseContext = new();
            databaseContext.Items.Add(new()
            {
                Name = item.Name,
                IsActive = item.IsActive
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.ITEM_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] ItemCreateEditVM itemCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Item item = await databaseContext.Items.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (item == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            item.Name = itemCreateEditVM.Name;
            item.IsActive = itemCreateEditVM.IsActive;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.ITEM_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] ItemCreateEditVM itemCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Item item = await databaseContext.Items.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if (item == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            item.IsActive = false;
            await databaseContext.SaveChangesAsync();
            return Ok();
        }













    }
}
