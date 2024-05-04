using Data.CreateEditVMs;
using Data.SelectVMs;
using Data;
using Microsoft.AspNetCore.Mvc;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class StockController : Controller
    {
        [Route(URLs.STOCK)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext database = new();
            List<StockVM> list = await database.Stocks
                .Select(item => new StockVM
                {
                    Id = item.Id,
                    Item = item.Items.Name + " " + item.Items.Price,
                    Quantity = item.Quantity

                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.STOCK)]
        [HttpPost]

        public async Task<IActionResult> Create([FromBody] StockCreateEditVM stockCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.Stocks.Add(new()
            {
                ItemsId = stockCreateEditVM.ItemsId,
                Quantity = stockCreateEditVM.Quantity
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.STOCK_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] StockCreateEditVM stockCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            Stock stock = await databaseContext.Stocks.Where(item => item.Id == id).FirstOrDefaultAsync();
            if (stock == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            stock.ItemsId = stockCreateEditVM.ItemsId;
            stock.Quantity = stockCreateEditVM.Quantity;

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
