﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data.CreateEditVMs
{
    public class StockCreateEditVM
    {
        public int Id { get; set; }

        public int? ItemsId { get; set; }

        public int? Quantity { get; set; }
    }
}
