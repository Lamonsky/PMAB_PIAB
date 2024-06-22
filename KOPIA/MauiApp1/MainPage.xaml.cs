using MauiApp1.ViewModel;

namespace MauiApp1
{
    public partial class MainPage : ContentPage
    {

        public MainPage()
        {
            Preferences.Clear();
            InitializeComponent();
            BindingContext = new MainPageViewModel();
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();

            if (BindingContext is MainPageViewModel vm)
            {
                vm.Load();
            }
        }

    }

}
