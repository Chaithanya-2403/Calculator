using System;

namespace Calculator
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Simple Calculator");
            Console.Write("Enter first number: ");
            double num1 = Convert.ToDouble(Console.ReadLine());

            Console.Write("Enter second number: ");
            double num2 = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine($"Addition: {num1} + {num2} = {Add(num1, num2)}");
            Console.WriteLine($"Subtraction: {num1} - {num2} = {Subtract(num1, num2)}");
            Console.WriteLine($"Multiplication: {num1} * {num2} = {Multiply(num1, num2)}");
            Console.WriteLine($"Division: {num1} / {num2} = {Divide(num1, num2)}");
        }

        public static double Add(double a, double b) => a + b;
        public static double Subtract(double a, double b) => a - b;
        public static double Multiply(double a, double b) => a * b;
        public static double Divide(double a, double b) => b != 0 ? a / b : throw new DivideByZeroException("Cannot divide by zero.");
    }
}
