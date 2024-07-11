using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models.Entities;

[Table("Shoppingcard")]
public partial class Shoppingcard
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [StringLength(255)]
    public string? UserId { get; set; }

    public bool? IsActive { get; set; }

    [InverseProperty("ShoppingCard")]
    public virtual ICollection<CartDetail> CartDetails { get; set; } = new List<CartDetail>();
}
