﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using PMAB_PIAB_RESTAPI.Models;

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

    public virtual DbSet<CartDetail> CartDetails { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Item> Items { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderStatus> OrderStatuses { get; set; }

    public virtual DbSet<PaymentMethod> PaymentMethods { get; set; }

    public virtual DbSet<Shoppingcard> Shoppingcards { get; set; }

    public virtual DbSet<Stock> Stocks { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;User ID=pmab_piabrestapiuser;Password=restapi123;Database=PMAB_PIAB;TrustServerCertificate=True;Integrated Security=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<CartDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__CartDeta__3214EC275A6D518D");

            entity.HasOne(d => d.Items).WithMany(p => p.CartDetails).HasConstraintName("FK__CartDetai__Items__49C3F6B7");

            entity.HasOne(d => d.ShoppingCard).WithMany(p => p.CartDetails).HasConstraintName("FK__CartDetai__Shopp__48CFD27E");
        });

        modelBuilder.Entity<Category>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Category__3214EC275E7F20D0");
        });

        modelBuilder.Entity<Item>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Items__3214EC27A5D2146A");

            entity.HasOne(d => d.Category).WithMany(p => p.Items).HasConstraintName("FK__Items__CategoryI__398D8EEE");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Orders__3214EC279C13DD90");

            entity.HasOne(d => d.OrderStatus).WithMany(p => p.Orders).HasConstraintName("FK__Orders__OrderSta__4316F928");

            entity.HasOne(d => d.PaymentMethod).WithMany(p => p.Orders).HasConstraintName("FK__Orders__PaymentM__440B1D61");
        });

        modelBuilder.Entity<OrderStatus>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__OrderSta__3214EC271D6B3207");
        });

        modelBuilder.Entity<PaymentMethod>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__PaymentM__3214EC2791F58E00");
        });

        modelBuilder.Entity<Shoppingcard>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Shopping__3214EC277998DA52");
        });

        modelBuilder.Entity<Stock>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Stock__3214EC27F87AF36D");

            entity.HasOne(d => d.Items).WithMany(p => p.Stocks).HasConstraintName("FK__Stock__ItemsID__3C69FB99");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
