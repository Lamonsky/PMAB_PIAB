using MauiApp1.Helpers;
using MauiApp1.Models;
using System.Windows.Input;

namespace MauiApp1.ViewModel
{
    public class LoginViewModel
    {
        protected LoginRequest item;
        public string EMail
        {
            get
            {
                return item.EMail;
            }
            set
            {
                item.EMail = value;
            }
        }
        public string Password
        {
            get
            {
                return item.Password;
            }
            set
            {
                item.Password = value;
            }
        }

        private ICommand _GoBackCommand;
        public ICommand GoBackCommand
        {

            get
            {
                return _GoBackCommand;
            }
            set
            {
                if (_GoBackCommand == null)
                {
                    _GoBackCommand = new Command(GoBack);
                }
            }

        }
        private ICommand _LoginCommand;
        public ICommand LoginCommand
        {

            get
            {
                return _LoginCommand;
            }
            set
            {
                if (_LoginCommand == null)
                {
                    _LoginCommand = new Command(Login);
                }
            }

        }

        private async void Login()
        {
            LoginResponse loginresponse = await RequestHelper.SendRequestAsync<object, LoginResponse>("/login", HttpMethod.Post, item, null);
            if(loginresponse.AccessToken != "")
            {
                Preferences.Set("email", item.EMail);
                GoBack();
            }
        }

        private async void GoBack()
        {
            await Shell.Current.GoToAsync("..");
        }

        public LoginViewModel()
        {
            item = new LoginRequest();
            GoBackCommand = new Command(GoBack);
            LoginCommand = new Command(Login);
        }
    }
}
