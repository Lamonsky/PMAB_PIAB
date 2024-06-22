using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace PMAB_PIAB_RESTAPI.Models;

[Table("Image_urls")]
public partial class ImageUrl
{
    [Key]
    [Column("ID")]
    public int Id { get; set; }

    [Column("URL")]
    public string? Url { get; set; }
}
