using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models.Entities;

[Table("CartDetail")]
public partial class CartDetail
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [Column("ShoppingCardID")]
    public int? ShoppingCardId { get; set; }

    [Column("ItemsID")]
    public int? ItemsId { get; set; }

    public int? Quantity { get; set; }

    [Column(TypeName = "decimal(10, 2)")]
    public decimal? UnitPrice { get; set; }

    [ForeignKey("ItemsId")]
    [InverseProperty("CartDetails")]
    public virtual Item? Items { get; set; }

    [ForeignKey("ShoppingCardId")]
    [InverseProperty("CartDetails")]
    public virtual Shoppingcard? ShoppingCard { get; set; }
}
