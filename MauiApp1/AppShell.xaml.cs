namespace MauiApp1
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();

            Routing.RegisterRoute(nameof(ItemsView), typeof(ItemsView));
            Routing.RegisterRoute(nameof(LoginView), typeof(LoginView));
            Routing.RegisterRoute(nameof(CartView), typeof(CartView));
            Routing.RegisterRoute(nameof(OrdersView), typeof(OrdersView));
            Routing.RegisterRoute(nameof(NewOrderView), typeof(NewOrderView));
        }
    }
}
