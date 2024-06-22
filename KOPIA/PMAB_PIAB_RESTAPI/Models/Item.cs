using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models;

public partial class Item
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [StringLength(255)]
    public string? Name { get; set; }

    public string? Description { get; set; }

    [Column("CategoryID")]
    public int? CategoryId { get; set; }

    [Column(TypeName = "decimal(10, 2)")]
    public decimal? Price { get; set; }

    [Column("ImageURL")]
    public string? ImageUrl { get; set; }

    public bool? IsActive { get; set; }

    [InverseProperty("Items")]
    public virtual ICollection<CartDetail> CartDetails { get; set; } = new List<CartDetail>();

    [ForeignKey("CategoryId")]
    [InverseProperty("Items")]
    public virtual Category? Category { get; set; }

    [InverseProperty("Items")]
    public virtual ICollection<Stock> Stocks { get; set; } = new List<Stock>();
}
