using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models;

[Table("Stock")]
public partial class Stock
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [Column("ItemsID")]
    public int? ItemsId { get; set; }

    public int? Quantity { get; set; }

    [ForeignKey("ItemsId")]
    [InverseProperty("Stocks")]
    public virtual Item? Items { get; set; }
}
