using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class URLs
    {
        public const string CARTDETAIL = "/getcartdetaillist";
        public const string CARTDETAIL_ID = "/getcartdetailitem/{id}";
        public const string CATEGORY = "/getcategorylist";
        public const string CATEGORY_ID = "/getcategoryitem/{id}";
        public const string ITEM = "/getitemlist";
        public const string ITEM_ID = "/getitem/{id}";
        public const string ITEM_CATEGORY_ID = "/getitem_category_{id}";
        public const string ORDER = "/getorderlist";
        public const string ORDER_ID_PAID = "/getorderitem/{id}/paid";
        public const string ORDER_ID = "/getorderitem/{id}";
        public const string ORDERSTATUS = "/getorderstatuslist";
        public const string ORDERSTATUS_ID = "/getorderstatusitem/{id}";
        public const string PAYMENTMETHOD = "/getpaymentmethodlist";
        public const string PAYMENTMETHOD_ID = "/getpaymentmethoditem/{id}";
        public const string SHOPPINGCART = "/getshoppingcartlist";
        public const string SHOPPINGCART_ID = "/getshoppingcartitem/{id}";
        public const string STOCK = "/getstocklist";
        public const string STOCK_ID = "/getstockitem/{id}";
        public const string PAGECONTENT = "/pagecontent";
        public const string PAGECONTENT_ID = "/pagecontent/{id}";
        public const string PAGECONTENTEDIT_ID = "/pagecontentedit/{id}";
    }
}
