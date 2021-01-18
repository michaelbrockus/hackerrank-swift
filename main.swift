//
// file: main.swift
// author: Michael Brockus
// gmail: <michaelbrockus@gmail.com>
//
import Foundation

//
// Complete the aVeryBigSum function below.
//
func aVeryBigSum(ar: [Int]) -> Int {
    var summary = 0
    for iter in ar {
        summary += iter
    } // end if
    return summary
} // end of function aVeryBigSum

//
// main is where program execution starts
func main()
{
    let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
    FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
    let fileHandle = FileHandle(forWritingAtPath: stdout)!

    guard let arCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let arTemp = readLine() else { fatalError("Bad input") }
    let ar: [Int] = arTemp.split(separator: " ").map {
        if let arItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return arItem
        } else { fatalError("Bad input") }
    }

    guard ar.count == arCount else { fatalError("Bad input") }

    let result = aVeryBigSum(ar: ar)

    fileHandle.write(String(result).data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
} // end of function main

main()
