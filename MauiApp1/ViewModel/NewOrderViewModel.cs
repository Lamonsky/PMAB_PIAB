using Data;
using Data.CreateEditVMs;
using MauiApp1.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MauiApp1.ViewModel
{
    public class NewOrderViewModel
    {
        protected OrderCreateEditVM item;
        public int Id { 
            get 
            { 
                return item.Id; 
            } 
        }
        public string UserID
        {
            get
            {
                return item.UserId;
            }
            set
            {
                if (item.UserId != value)
                {
                    item.UserId = value;
                }
            }
        }
        public DateTime? CreateDate
        {
            get
            {
                return item.CreateDate;
            }
            set
            {
                if (item.CreateDate != value)
                {
                    item.CreateDate = value;
                }
            }
        }

        public int? OrderStatusId
        {
            get
            {
                return item.OrderStatusId;
            }
            set
            {
                if (item.OrderStatusId != value)
                {
                    item.OrderStatusId = value;
                }
            }
        }

        public bool? IsActive
        {
            get
            {
                return item.IsActive;
            }
            set
            {
                if (item.IsActive != value)
                {
                    item.IsActive = value;
                }
            }
        }

        public string? Name
        {
            get
            {
                return item.Name;
            }
            set
            {
                if (item.Name != value)
                {
                    item.Name = value;
                }
            }
        }

        public string? Email
        {
            get
            {
                return item.Email;
            }
            set
            {
                if (item.Email != value)
                {
                    item.Email = value;
                }
            }
        }

        public string? MobileNumber
        {
            get
            {
                return item.MobileNumber;
            }
            set
            {
                if (item.MobileNumber != value)
                {
                    item.MobileNumber = value;
                }
            }
        }

        public string? Address
        {
            get
            {
                return item.Address;
            }
            set
            {
                if (item.Address != value)
                {
                    item.Address = value;
                }
            }
        }

        public int? PaymentMethodId
        {
            get
            {
                return item.PaymentMethodId;
            }
            set
            {
                if (item.PaymentMethodId != value)
                {
                    item.PaymentMethodId = value;
                }
            }
        }

        public bool? IsPaid
        {
            get
            {
                return item.IsPaid;
            }
            set
            {
                if (item.IsPaid != value)
                {
                    item.IsPaid = value;
                }
            }
        }


        private ICommand _GoBackCommand;
        public ICommand GoBackCommand
        {

            get
            {
                return _GoBackCommand;
            }
            set
            {
                if (_GoBackCommand == null)
                {
                    _GoBackCommand = new Command(GoBack);
                }
            }

        }
        private ICommand _CreateOrderCommand;
        public ICommand CreateOrderCommand
        {

            get
            {
                return _CreateOrderCommand;
            }
            set
            {
                if (_CreateOrderCommand == null)
                {
                    _CreateOrderCommand = new Command(CreateOrder);
                }
            }

        }

        private async void CreateOrder()
        {
            string email = Preferences.Get("email", "");
            if (email != "")
            {
                item.UserId = email;
                item.CreateDate = DateTime.Now;
                item.OrderStatusId = 1;
                item.IsActive = true;
                item.IsPaid = false;
                await RequestHelper.SendRequestAsync<OrderCreateEditVM>(URLs.ORDER, HttpMethod.Post, item, null);
                Shell.Current.GoToAsync("../..");
            }
            

        }

        private async void GoBack()
        {
            await Shell.Current.GoToAsync("..");
        }

        public NewOrderViewModel()
        {
            item = new OrderCreateEditVM();
            GoBackCommand = new Command(GoBack);
            CreateOrderCommand = new Command(CreateOrder);
        }
    }
}
