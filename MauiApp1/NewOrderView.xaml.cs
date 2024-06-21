using MauiApp1.ViewModel;

namespace MauiApp1;

public partial class NewOrderView : ContentPage
{
	public NewOrderView()
	{
		InitializeComponent();
		BindingContext = new NewOrderViewModel();
	}
}