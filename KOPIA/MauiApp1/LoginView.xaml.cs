using MauiApp1.ViewModel;

namespace MauiApp1;

public partial class LoginView : ContentPage
{
    public LoginView()
    {
        InitializeComponent();
        BindingContext = new LoginViewModel();
    }
}