using System;
using System.IO;

class Program
{
    static void Main()
    {
        string inputFilePath = "Z:/11A/ADAT_B/versenyzo.txt";
        string outputFilePath = "Z:/11A/ADAT_B/versenyzo2.txt";

        try
        {
            string[] lines = File.ReadAllLines(inputFilePath);

            using (StreamWriter outputFile = new StreamWriter(outputFilePath))
            {
                foreach (string line in lines)
                {
                    string[] data = line.Split('\t');
                    string formattedData = string.Join(", ", Array.ConvertAll(data, item => $"'{item}'"));
                    outputFile.WriteLine($"({formattedData})");
                }
            }

            Console.WriteLine("Conversion successful!");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"An error occurred: {ex.Message}");
        }
        Console.ReadKey();
    }
}
