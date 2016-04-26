using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpPractice
{
    public class Calc : ICalculator
    {
        public int AddNum(int a, int b)
        {
            return a + b;
        }

        public int SubNum(int a, int b)
        {
            return a - b;
        }

        public int DivNum(int a, int b)
        {
            return a / b;
        }

        public int MultNum(int a, int b)
        {
            return a * b;
        }
    }
}
