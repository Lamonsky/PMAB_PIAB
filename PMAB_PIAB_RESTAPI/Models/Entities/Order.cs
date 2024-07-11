using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models.Entities;

public partial class Order
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [StringLength(255)]
    public string? UserId { get; set; }

    [Column(TypeName = "datetime")]
    public DateTime? CreateDate { get; set; }

    [Column("OrderStatusID")]
    public int? OrderStatusId { get; set; }

    public bool? IsActive { get; set; }

    [StringLength(255)]
    public string? Name { get; set; }

    [StringLength(255)]
    public string? Email { get; set; }

    [StringLength(255)]
    public string? MobileNumber { get; set; }

    public string? Address { get; set; }

    [Column("PaymentMethodID")]
    public int? PaymentMethodId { get; set; }

    public bool? IsPaid { get; set; }

    [ForeignKey("OrderStatusId")]
    [InverseProperty("Orders")]
    public virtual OrderStatus? OrderStatus { get; set; }

    [ForeignKey("PaymentMethodId")]
    [InverseProperty("Orders")]
    public virtual PaymentMethod? PaymentMethod { get; set; }
}
