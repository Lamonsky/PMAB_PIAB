using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;
using Data;
using Data.CreateEditVMs;
using Data.SelectVMs;
using MauiApp1.Helpers;
using Microsoft.Maui.Controls;

namespace MauiApp1.ViewModel
{
    [QueryProperty(nameof(CategoryId), "id")]
    public class ItemsViewModel : INotifyPropertyChanged
    {
        private int categoryId;
        public int CategoryId
        {
            get => categoryId;
            set
            {
                if (categoryId != value)
                {
                    categoryId = value;
                    OnPropertyChanged();
                    LoadItems(); // Load items whenever CategoryId is set
                }
            }
        }

        private ItemVM chosenItem;
        public ItemVM ChosenItem
        {
            get => chosenItem;
            set
            {
                if (chosenItem != value)
                {
                    chosenItem = value;
                    OnPropertyChanged();
                }
            }
        }

        private ObservableCollection<ItemVM> list;
        public ObservableCollection<ItemVM> List
        {
            get => list;
            set
            {
                if (list != value)
                {
                    list = value;
                    OnPropertyChanged();
                }
            }
        }

        private bool isRefreshing;
        public bool IsRefreshing
        {
            get => isRefreshing;
            set
            {
                if (isRefreshing != value)
                {
                    isRefreshing = value;
                    OnPropertyChanged();
                }
            }
        }

        public ICommand LoadCommand { get; }
        public ICommand GoBackCommand { get; }
        public ICommand AddToCartCommand { get; }
        public ICommand ItemTappedCommand { get; }

        public ItemsViewModel()
        {
            LoadCommand = new Command(LoadItems);
            GoBackCommand = new Command(GoBack);
            AddToCartCommand = new Command(AddToCart);
            ItemTappedCommand = new Command<ItemVM>(OnItemTapped);
        }

        private void OnItemTapped(ItemVM item)
        {
            ChosenItem = item;
            AddToCart();
        }

        private async void AddToCart()
        {
            string email = Preferences.Get("email", "");
            if (!string.IsNullOrEmpty(email) && ChosenItem != null)
            {
                var vm = new CartDetailCreateEditVM
                {
                    ShoppingCardId = (await RequestHelper.SendRequestAsync<object, ShoppingCartVM>(
                        URLs.SHOPPINGCART_ID.Replace("{id}", email), HttpMethod.Get, null, null)).Id,
                    ItemsId = ChosenItem.Id,
                    Quantity = 1,
                    UnitPrice = ChosenItem.Price
                };
                StockCreateEditVM stockvm = await RequestHelper.SendRequestAsync<object, StockCreateEditVM>(URLs.STOCK_ID.Replace("{id}", ChosenItem.Id.ToString()), HttpMethod.Get, null, null);
                stockvm.Quantity -= 1;
                await RequestHelper.SendRequestAsync<StockCreateEditVM>(URLs.STOCK_ID.Replace("{id}", stockvm.Id.ToString()), HttpMethod.Put, stockvm, null);
                await RequestHelper.SendRequestAsync<CartDetailCreateEditVM>(URLs.CARTDETAIL, HttpMethod.Post, vm, null);
                GoBack();
            }
        }

        private async void LoadItems()
        {
            if (CategoryId > 0)
            {
                IsRefreshing = true;
                var items = await RequestHelper.SendRequestAsync<object, ObservableCollection<ItemVM>>(
                    URLs.ITEM_CATEGORY_ID.Replace("{id}", CategoryId.ToString()), HttpMethod.Get, null, null);
                if (items != null)
                {
                    List = items;
                }
                IsRefreshing = false;
            }
        }

        private async void GoBack()
        {
            await Shell.Current.GoToAsync("..");
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
