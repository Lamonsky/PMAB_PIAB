using MauiApp1.ViewModel;

namespace MauiApp1;

public partial class OrdersView : ContentPage
{
	public OrdersView()
	{
		InitializeComponent();
        BindingContext = new OrdersViewModel();

    }
}