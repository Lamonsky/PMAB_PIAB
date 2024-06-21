using MauiApp1.ViewModel;

namespace MauiApp1;

public partial class ItemsView : ContentPage
{
	public ItemsView()
	{
		InitializeComponent();
		BindingContext = new ItemsViewModel();
	}
}