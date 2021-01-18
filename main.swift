//
// file: main.swift
// author: Michael Brockus
// gmail: <michaelbrockus@gmail.com>
//
import Foundation

// Complete the compareTriplets function below.
func compareTriplets(a: [Int], b: [Int]) -> [Int] {
    var countAlice = 0;
    var countBob = 0;

    for iter in 0...2 {
        if (a[iter] > b[iter]) {
            countAlice += 1
        } // end if
        else if (a[iter] < b[iter]) {
            countBob += 1
        } // end else if

    } // end for
    return [countAlice, countBob]
} // end of function compareTriplets

//
// main is where program execution starts
func main()
{
    let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
    FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
    let fileHandle = FileHandle(forWritingAtPath: stdout)!

    guard let aTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let a: [Int] = aTemp.split(separator: " ").map {
        if let aItem = Int($0) {
            return aItem
        } else { fatalError("Bad input") }
    }

    guard a.count == 3 else { fatalError("Bad input") }

    guard let bTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
    let b: [Int] = bTemp.split(separator: " ").map {
        if let bItem = Int($0) {
            return bItem
        } else { fatalError("Bad input") }
    }

    guard b.count == 3 else { fatalError("Bad input") }

    let result = compareTriplets(a: a, b: b)

    fileHandle.write(result.map{ String($0) }.joined(separator: " ").data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
} // end of function main

main()
