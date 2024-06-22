using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiApp1.Helpers
{
    public class InvertBool
    {
        private bool value = false;

        public bool Value { get { return value; } }
        public bool Invert { get { return !value; } }

        public InvertBool(bool b)
        {
            value = b;
        }

        public static implicit operator InvertBool(bool b)
        {
            return new InvertBool(b);
        }

        public static implicit operator bool(InvertBool b)
        {
            return b.value;
        }
    }
}
