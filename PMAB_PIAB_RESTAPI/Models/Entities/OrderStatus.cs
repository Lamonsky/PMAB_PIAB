using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models.Entities;

[Table("OrderStatus")]
public partial class OrderStatus
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [StringLength(255)]
    public string? StatusName { get; set; }

    public bool? IsActive { get; set; }

    [InverseProperty("OrderStatus")]
    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
