using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models.Entities;

[Table("PageContent")]
public partial class PageContent
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public string Content { get; set; } = null!;
}
