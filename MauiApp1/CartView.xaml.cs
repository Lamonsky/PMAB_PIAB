using MauiApp1.ViewModel;

namespace MauiApp1;

public partial class CartView : ContentPage
{
	public CartView()
	{
		InitializeComponent();
        BindingContext = new CartViewModel();
    }
}