using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models;

[Table("Category")]
public partial class Category
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [StringLength(255)]
    public string? Name { get; set; }

    public bool? IsActive { get; set; }

    [Column("ImageURL")]
    public string? ImageUrl { get; set; }

    [InverseProperty("Category")]
    public virtual ICollection<Item> Items { get; set; } = new List<Item>();
}
