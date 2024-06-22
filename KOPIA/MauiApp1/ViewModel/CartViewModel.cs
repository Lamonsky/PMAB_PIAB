using Data;
using Data.SelectVMs;
using MauiApp1.Helpers;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace MauiApp1.ViewModel
{
    public class CartViewModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        private CartDetailVM _chosenCart;
        public CartDetailVM ChosenCart
        {
            get => _chosenCart;
            set
            {
                if (value != _chosenCart)
                {
                    _chosenCart = value;
                    OnPropertyChanged();
                }
            }
        }

        private ShoppingCartVM _shoppingCart;
        public ShoppingCartVM ShoppingCartVM
        {
            get => _shoppingCart;
            set
            {
                if (value != _shoppingCart)
                {
                    _shoppingCart = value;
                    OnPropertyChanged();
                }
            }
        }

        private ObservableCollection<CartDetailVM> _list;
        public ObservableCollection<CartDetailVM> List
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
        public ICommand ItemTappedCommand { get; }
        public ICommand GoBackCommand { get; }

        public CartViewModel()
        {
            Load();
            DeleteCommand = new Command<CartDetailVM>(async (item) => await Delete(item));
            ItemTappedCommand = new Command<CartDetailVM>(OnItemTapped);
            GoBackCommand = new Command(async () => await GoBack());
        }

        private async Task Delete(CartDetailVM item)
        {
            if (item != null)
            {
                List.Remove(item);
                await RequestHelper.SendRequestAsync(URLs.CARTDETAIL_ID.Replace("{id}", item.Id.ToString()), HttpMethod.Delete, null);
            }
        }

        private async void OnItemTapped(CartDetailVM vm)
        {
            ChosenCart = vm;
            await Delete(vm);
        }

        private async Task GoBack()
        {
            await Shell.Current.GoToAsync("..");
        }

        private async void Load()
        {
            string email = Preferences.Get("email", "");
            if (!string.IsNullOrEmpty(email))
            {
                ShoppingCartVM = await RequestHelper.SendRequestAsync<object, ShoppingCartVM>(URLs.SHOPPINGCART_ID.Replace("{id}", email), HttpMethod.Get, null, null);
                List = new ObservableCollection<CartDetailVM>(await RequestHelper.SendRequestAsync<object, List<CartDetailVM>>(URLs.CARTDETAIL_ID.Replace("{id}", ShoppingCartVM.Id.ToString()), HttpMethod.Get, null, null));
            }
        }

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
