using Xunit;
using Microsoft.VisualStudio.TestPlatform.TestHost;

namespace Unit_Test
{
    public class CalculatorTests
    {
        [Fact]
        public void TestAddition()
        {
            Assert.Equal(5, Calculator.Program.Add(2, 3));
        }

        [Fact]
        public void TestSubtraction()
        {
            Assert.Equal(1, Calculator.Program.Subtract(3, 2));
        }

        [Fact]
        public void TestMultiplication()
        {
            Assert.Equal(6, Calculator.Program.Multiply(2, 3));
        }

        [Fact]
        public void TestDivision()
        {
            Assert.Equal(2, Calculator.Program.Divide(6, 3));
        }

        [Fact]
        public void TestDivisionByZero()
        {
            Assert.Throws<DivideByZeroException>(() => Calculator.Program.Divide(1, 0));
        }
    }
}
