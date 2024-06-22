using Data;
using Data.SelectVMs;
using MauiApp1.Helpers;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MauiApp1.ViewModel
{
    public class OrdersViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private OrderVM _chosenOrder;
        public OrderVM ChosenOrder
        {
            get => _chosenOrder;
            set
            {
                if (value != _chosenOrder)
                {
                    _chosenOrder = value;
                    OnPropertyChanged();
                }
            }
        }

        private ObservableCollection<OrderVM> _list;
        public ObservableCollection<OrderVM> List
        {
            get => _list;
            set
            {
                if (_list != value)
                {
                    _list = value;
                    OnPropertyChanged();
                }
            }
        }

        public ICommand DeleteCommand { get; }
        public ICommand GoBackCommand { get; }
        public ICommand PaidCommand { get; }
        public ICommand NewOrderCommand { get; }

        public OrdersViewModel()
        {
            Load();

            DeleteCommand = new Command(async () => await Delete());
            GoBackCommand = new Command(async () => await GoBack());
            PaidCommand = new Command(async () => await Paid());
            NewOrderCommand = new Command(async () => await NewOrder());
        }

        private async Task Delete()
        {
            if (ChosenOrder != null)
            {
                List.Remove(ChosenOrder);
                await RequestHelper.SendRequestAsync(URLs.ORDER_ID.Replace("{id}", ChosenOrder.Id.ToString()), HttpMethod.Delete, null);
            }
        }

        private async Task GoBack()
        {
            await Shell.Current.GoToAsync("..");
        }

        private async Task Paid()
        {
            if (ChosenOrder != null)
            {
                await RequestHelper.SendRequestAsync(URLs.ORDER_ID_PAID.Replace("{id}", ChosenOrder.Id.ToString()), HttpMethod.Put, null);
                GoBack();
            }
        }

        private async Task NewOrder()
        {
            await Shell.Current.GoToAsync(nameof(NewOrderView));
        }

        private async void Load()
        {
            string email = Preferences.Get("email", "");
            if (!string.IsNullOrEmpty(email))
            {
                List = new ObservableCollection<OrderVM>(await RequestHelper.SendRequestAsync<object, List<OrderVM>>(URLs.ORDER_ID.Replace("{id}", email), HttpMethod.Get, null, null));
            }
        }

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
