namespace MauiApp1
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            Routing.RegisterRoute("ItemsView", typeof(ItemsView));

            MainPage = new AppShell();
        }
    }
}
