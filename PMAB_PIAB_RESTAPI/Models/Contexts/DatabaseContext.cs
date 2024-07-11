using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using PMAB_PIAB_RESTAPI.Models.Entities;

namespace PMAB_PIAB_RESTAPI.Models.Contexts;

public partial class DatabaseContext : DbContext
{
    public DatabaseContext()
    {
    }

    public DatabaseContext(DbContextOptions<DatabaseContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AspNetRole> AspNetRoles { get; set; }

    public virtual DbSet<AspNetRoleClaim> AspNetRoleClaims { get; set; }

    public virtual DbSet<AspNetUser> AspNetUsers { get; set; }

    public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUserToken> AspNetUserTokens { get; set; }

    public virtual DbSet<CartDetail> CartDetails { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Item> Items { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderStatus> OrderStatuses { get; set; }

    public virtual DbSet<PageContent> PageContents { get; set; }

    public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }

    public virtual DbSet<Shoppingcard> Shoppingcards { get; set; }

    public virtual DbSet<Stock> Stocks { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;User ID=pmab_piabrestapiuser;Password=restapi123;Database=PMAB_PIAB;TrustServerCertificate=True;Integrated Security=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AspNetRole>(entity =>
        {
            entity.HasIndex(e => e.NormalizedName, "RoleNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedName] IS NOT NULL)");
        });

        modelBuilder.Entity<AspNetUser>(entity =>
        {
            entity.HasIndex(e => e.NormalizedUserName, "UserNameIndex")
                .IsUnique()
                .HasFilter("([NormalizedUserName] IS NOT NULL)");

            entity.HasMany(d => d.Roles).WithMany(p => p.Users)
                .UsingEntity<Dictionary<string, object>>(
                    "AspNetUserRole",
                    r => r.HasOne<AspNetRole>().WithMany().HasForeignKey("RoleId"),
                    l => l.HasOne<AspNetUser>().WithMany().HasForeignKey("UserId"),
                    j =>
                    {
                        j.HasKey("UserId", "RoleId");
                        j.ToTable("AspNetUserRoles");
                        j.HasIndex(new[] { "RoleId" }, "IX_AspNetUserRoles_RoleId");
                    });
        });

        modelBuilder.Entity<CartDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__CartDeta__3214EC27942E63C2");

            entity.HasOne(d => d.Items).WithMany(p => p.CartDetails).HasConstraintName("FK__CartDetai__Items__59FA5E80");

            entity.HasOne(d => d.ShoppingCard).WithMany(p => p.CartDetails).HasConstraintName("FK__CartDetai__Shopp__5AEE82B9");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Category__3214EC27A60B3858");
        });

        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Items__3214EC277BC9E90E");

            entity.HasOne(d => d.Category).WithMany(p => p.Items).HasConstraintName("FK__Items__CategoryI__5BE2A6F2");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Orders__3214EC272C41B846");

            entity.HasOne(d => d.OrderStatus).WithMany(p => p.Orders).HasConstraintName("FK__Orders__OrderSta__5CD6CB2B");

            entity.HasOne(d => d.PaymentMethod).WithMany(p => p.Orders).HasConstraintName("FK__Orders__PaymentM__5DCAEF64");
        });

        modelBuilder.Entity<OrderStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__OrderSta__3214EC27643D1C84");
        });

        modelBuilder.Entity<PaymentMethod>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PaymentM__3214EC27F603A070");
        });

        modelBuilder.Entity<Shoppingcard>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Shopping__3214EC27E95F6042");
        });

        modelBuilder.Entity<Stock>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Stock__3214EC27D97CA2EF");

            entity.HasOne(d => d.Items).WithMany(p => p.Stocks).HasConstraintName("FK__Stock__ItemsID__5EBF139D");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
