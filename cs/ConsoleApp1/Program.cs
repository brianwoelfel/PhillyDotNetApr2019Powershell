using System;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            StringEval();
        }

        static void StringEval()
        {
            Console.WriteLine("#### STRING EVALUATION ####");
            string a = "Hello"; // Define some variables
            string b = "World";
            int c = 10;

            //Console.WriteLine('Test 1: $A $B $C'); // Single quotes don't expand variables
            Console.WriteLine($"Test 2: {a} {b} {c}"); // Double quotes support variable expansion
            Console.WriteLine($"Test 3: {a} {b} {(c + 5)}"); // Within double quotes use $() to evaluate code
            // Start multiline string with @" and end "@ on it's own line
            Console.WriteLine($@"
            Test 4: multiline string with evaluation,
               and use backtick to escape dollar sign
            a={a} b={b}
            ");
        }

        public static void Array()
        {
            string[] myArray = { "a", "b", "c" };

        }

        public static void Hashtable()
        {
            //Hashtable<string, string> hash = { { "a", "1" }, { "b", "2" } };
            //hash["c"] = "3";
            //hash
        }
    }
}
