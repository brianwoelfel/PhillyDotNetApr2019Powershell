using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Join1();
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

        public static void MyHashtable()
        {
            Hashtable hash = new Hashtable() { { "a", "1" }, { "b", "2" } };
            hash["c"] = "3";
            foreach (DictionaryEntry s in hash)
            {
                Console.WriteLine("key " + s.Key + " = " + s.Value);
            }
        }

        public static void MyArray()
        {
            string[] myArr = { "a", "b", "c" };
            myArr.ToList().ForEach(x => Console.WriteLine(x));
        }

        public static void DictionaryToString()
        {
            Dictionary<string, string> myDict = new Dictionary<string, string>(){ { "a", "1" }, { "b", "2" }, { "c", "3" } };
            myDict.Keys.OrderBy(x => x).ToList().ForEach(x => Console.WriteLine($"{x}={myDict[x]}"));
        }

        public static void IsNullOrWhitespaceHelper()
        {
            string x = "";
            if (!String.IsNullOrWhiteSpace(x))
            {
            }
        }

        public static void WhereObject1()
        {
            int[] arr = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            arr.Where(x => x > 8).ToList().ForEach(x => Console.WriteLine(x));
        }

        public static void Join1()
        {
            Console.WriteLine(string.Join(',', new string[] { "a", "b", "c" }));
            "a,b,c".Split(',');

            Regex.Split("a,b;c:d!e", "[,;:!]").ToList().ForEach(x => Console.WriteLine(x));

            Console.WriteLine(string.Join(',', Regex.Split("a,b;c:d!e", "[,;:!]")));

        }
    }
}
