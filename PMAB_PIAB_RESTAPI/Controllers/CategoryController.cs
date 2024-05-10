using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PMAB_PIAB_RESTAPI.Models;
using PMAB_PIAB_RESTAPI.Models.Contexts;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class CategoryController : Controller
    {
        [Route(URLs.CATEGORY)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<CategoryVM> list = await database.Categories
                .Select(item => new CategoryVM
                {
                    Id = item.Id,
                    Name = item.Name,
                    IsActive = item.IsActive.ToString(),
                    ImageURL = item.ImageUrl

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.CATEGORY)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] CategoryCreateEditVM categoryCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.Categories.Add(new()
            {
                Name = categoryCreateEditVM.Name,
                IsActive = categoryCreateEditVM.IsActive,
                ImageUrl = categoryCreateEditVM.ImageURL,
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.CATEGORY_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] CategoryCreateEditVM categoryCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Category category = await databaseContext.Categories.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if(category == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            category.Name = categoryCreateEditVM.Name;
            category.IsActive = categoryCreateEditVM.IsActive;
            category.ImageUrl = categoryCreateEditVM.ImageURL;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.CATEGORY_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id, [FromBody] CategoryCreateEditVM categoryCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Category category = await databaseContext.Categories.Where(item => item.Id == id && item.IsActive == true).FirstOrDefaultAsync();
            if(category == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            category.IsActive = false;
            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
