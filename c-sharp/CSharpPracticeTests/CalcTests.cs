using Microsoft.VisualStudio.TestTools.UnitTesting;
using CSharpPractice;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpPractice.Tests
{
    [TestClass()]
    public class CalcTests
    {
        Calc calc = new Calc();
        int expected;
        int actual;

        [TestMethod()]
        public void AddNumTest()
        {
            actual = calc.AddNum(5, 5);
            expected = 10;
            Assert.AreEqual(expected, actual);
        }

        [TestMethod()]
        public void SubNumTest()
        {
            actual = calc.SubNum(10, 5);
            expected = 5;
            Assert.AreEqual(expected, actual);
        }
    }
}