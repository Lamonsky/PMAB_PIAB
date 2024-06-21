using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;
using System.Windows.Input;
using Data;
using Data.SelectVMs;
using MauiApp1.Helpers;
using Microsoft.Maui.ApplicationModel.Communication;
using Microsoft.Maui.Controls;

namespace MauiApp1.ViewModel
{
    public class MainPageViewModel : INotifyPropertyChanged
    {
        private string _email = "";
        public string Email
        {
            get => _email;
            set
            {
                if (_email != value)
                {
                    _email = value;
                    OnPropertyChanged();
                    OnPropertyChanged(nameof(IsEmailEmpty));
                }
            }
        }

        private InvertBool _isEmailEmpty;
        public InvertBool IsEmailEmpty
        {
            get => _isEmailEmpty;
            set
            {
                if (_isEmailEmpty != value)
                {
                    _isEmailEmpty = value;
                    OnPropertyChanged();
                }
            }
        }


        private CategoryVM _chosenCategory;
        public CategoryVM ChosenCategory
        {
            get => _chosenCategory;
            set
            {
                if (_chosenCategory != value)
                {
                    _chosenCategory = value;
                    OnPropertyChanged();
                }
            }
        }

        private ObservableCollection<CategoryVM> _list;
        public ObservableCollection<CategoryVM> List
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

        public ICommand LoadCommand { get; }
        public ICommand ViewItemsCommand { get; }
        public ICommand ItemTappedCommand { get; }
        public ICommand GoToLoginCommand { get; }
        public ICommand LogoutCommand { get; }
        public ICommand ViewCartCommand { get; }
        public ICommand ViewOrdersCommand { get; }

        public MainPageViewModel()
        {
            LoadCommand = new Command(async () => await Load());
            ViewItemsCommand = new Command(async () => await ViewItems());
            ItemTappedCommand = new Command<CategoryVM>(category => OnItemTapped(category));
            GoToLoginCommand = new Command(async () => await GoToLogin());
            LogoutCommand = new Command(async () => await Logout());
            ViewCartCommand = new Command(async () => await GoToCart());
            ViewOrdersCommand = new Command(async () => await GoToOrders());

            Load();
        }

        public async Task Load()
        {
            List = await RequestHelper.SendRequestAsync<object, ObservableCollection<CategoryVM>>(URLs.CATEGORY, HttpMethod.Get, null, null);
            Email = Preferences.Get("email", "");
            if (Email == "")
            {
                IsEmailEmpty = true;
            }
            else
            {
                IsEmailEmpty = false;
            }
        }

        private async Task ViewItems()
        {
            if (ChosenCategory != null)
            {
                await Shell.Current.GoToAsync($"{nameof(ItemsView)}?id={ChosenCategory.Id}");
            }
        }

        private async Task GoToLogin()
        {
            await Shell.Current.GoToAsync(nameof(LoginView));
        }

        private async Task GoToCart()
        {
            await Shell.Current.GoToAsync(nameof(CartView));
        }

        private async Task GoToOrders()
        {
            await Shell.Current.GoToAsync(nameof(OrdersView));
        }

        private async Task Logout()
        {
            Preferences.Clear();
            await Load();
        }

        private void OnItemTapped(CategoryVM category)
        {
            ChosenCategory = category;
            ViewItems();
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
