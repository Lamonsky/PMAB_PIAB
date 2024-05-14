using ClientPortal.Helpers;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Data;
using Data.SelectVMs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace MobileApp.ViewModels
{
    public partial class MainPageViewModel : ObservableObject
    {
        private Command _loadCommand;
        public Command LoadCommand
        {
            get
            {
                if(_loadCommand == null)
                {
                    _loadCommand = new Command(() => { load();  });
                }
                return _loadCommand;
            }
        }
        private List<CategoryVM> _List;
        public List<CategoryVM> List
        {
            get
            {
                return _List;
            }
            set
            {
                _List = value;
            }
        }

        public MainPageViewModel() {
            load();
        }

        
        private async void load()
        {
            List = await RequestHelper.SendRequestAsync<object, List<CategoryVM>>(URLs.CATEGORY, HttpMethod.Get, null, null);
        }



    }
}
