﻿using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PMAB_PIAB_RESTAPI.Models;
using PMAB_PIAB_RESTAPI.Models.Contexts;
using PMAB_PIAB_RESTAPI.Models.Entities;

namespace PMAB_PIAB_RESTAPI.Controllers
{
    public class PageContentController : Controller
    {
        [Route(URLs.PAGECONTENT)]
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            DatabaseContext context = new();
            List<PageContentVM> list = await context.PageContents
                .Select(item => new PageContentVM()
                {
                    Id = item.Id,
                    Title = item.Title,
                    Content = item.Content
                }).ToListAsync();
            return Json(list);
        }
        [Route(URLs.PAGECONTENT_ID)]
        [HttpGet]
        public async Task<IActionResult> GetByTitle(string id)
        {
            DatabaseContext context = new();
            PageContentVM list = await context.PageContents
                .Where(item => item.Title == id)
                .Select(item => new PageContentVM()
                {
                    Id = item.Id,
                    Title = item.Title,
                    Content = item.Content
                }).FirstOrDefaultAsync();
            return Json(list);
        }
        [Route(URLs.PAGECONTENTEDIT_ID)]
        [HttpGet]
        public async Task<IActionResult> GetPageContent(int id)
        {
            DatabaseContext context = new();
            PageContentCreateEditVM list = await context.PageContents
                .Where(item => item.Id == id)
                .Select(item => new PageContentCreateEditVM()
                {
                    Id = item.Id,
                    Title = item.Title,
                    Content = item.Content
                }).FirstOrDefaultAsync();
            return Json(list);
        }
        [Route(URLs.PAGECONTENT)]
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] PageContentCreateEditVM PageContentCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            databaseContext.PageContents.Add(new()
            {
                Title = PageContentCreateEditVM.Title,
                Content = PageContentCreateEditVM.Content
            });

            await databaseContext.SaveChangesAsync();
            return Ok();
        }


        [Route(URLs.PAGECONTENT_ID)]
        [HttpPut]
        public async Task<IActionResult> Edit(int id, [FromBody] PageContentCreateEditVM PageContentCreateEditVM)
        {
            DatabaseContext databaseContext = new();
            PageContent PageContent = await databaseContext.PageContents.Where(item => item.Id == id).FirstOrDefaultAsync();
            if (PageContent == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            PageContent.Title = PageContentCreateEditVM.Title;
            PageContent.Content = PageContentCreateEditVM.Content;


            await databaseContext.SaveChangesAsync();
            return Ok();
        }
        [Route(URLs.PAGECONTENT_ID)]
        [HttpDelete]
        public async Task<IActionResult> Delete(int id)
        {
            DatabaseContext databaseContext = new();
            PageContent PageContent = await databaseContext.PageContents.Where(item => item.Id == id).FirstOrDefaultAsync();
            if (PageContent == null)
            {
                return BadRequest("Nie ma obiektu o podanym id {id}");
            }
            databaseContext.PageContents.Remove(PageContent);

            await databaseContext.SaveChangesAsync();
            return Ok();
        }
    }
}
