
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using PMAB_PIAB_RESTAPI.Models.Contexts;

namespace PMAB_PIAB_RESTAPI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.

            builder.Services.AddControllers();
            // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();


            

            var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found");
            
            builder.Services.AddDbContext<IdentityContext>(options =>
                options.UseSqlServer(connectionString));

            builder.Services.AddAuthentication().AddBearerToken(IdentityConstants.BearerScheme);
            builder.Services.AddAuthorizationBuilder();
            builder.Services.AddIdentityCore<IdentityUser>()
                            .AddRoles<IdentityRole>()
                            .AddEntityFrameworkStores<IdentityContext>()
                            .AddApiEndpoints();



            var app = builder.Build();
            app.MapIdentityApi<IdentityUser>();


            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();


            app.MapControllers();

            app.Run();
        }
    }
}
