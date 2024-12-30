//
//  Day3.swift
//  helloWorld
//
//  Created by Akhilesh Amle on 04/12/24.
//

import Foundation

struct Day3 {
    /// process the input
    /// consider only the occurances pf mul(<number>,<nuber>) in the input string
    /// get left number, get right number
    /// multliply them
    /// store all the result
    /// sum all at the end
    func part1(input: String) {
        let input = input
        let pattern = #"mul\((\d+),(\d+)\)"#

        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
            
            for match in matches {
                print("Match ranges: \(match.numberOfRanges)") // Should output at least 3 ranges per match
            }
            
            let sumAll = matches.compactMap { mulItem -> Int in
                let leftNumber = String(String(input)[Range(mulItem.range(at: 1), in: String(input))!]).toInt
                let rightNumber = String(String(input)[Range(mulItem.range(at: 2), in: String(input))!]).toInt
                
                return leftNumber! * rightNumber!
            }.reduce(0, +)
            print("sumAll: \(sumAll)")
        } catch {
            print("Regex error: \(error)")
        }
    }
}

struct Day3Tests {
    func test_getValidMultiplicationString() -> Bool {
        false
    }
}

extension String {
    var toInt: Int? {
        Int(self)
    }
}

// MARK: - dump
/*
 /*
 let result = matches.compactMap { mulItem -> Int? in
     let leftNumber = String(String(input)[Range(mulItem.range(at: 1), in: String(input))!]).toInt
     let RightNumber = String(String(input)[Range(mulItem.range(at: 2), in: String(input))!]).toInt
     return leftNumber! * RightNumber!
 }.reduce(0, +)
 print(result)
 */

/*
let inputList = input.split(separator: "\n")
for input in inputList {
 print(input)
 do {
     let regex = try NSRegularExpression(pattern: pattern)
     let mulRegexList = regex.matches(in: String(input), range: NSRange(String(input).startIndex..., in: String(input)))
     print("--- mulRegexList ---")
     print(mulRegexList)
     for match in mulRegexList {
         print("Match ranges: \(match.numberOfRanges)")
     }
     let mulList = mulRegexList.map {
         String(String(input)[Range($0.range, in: String(input))!])
     }
     print("--- mulList ---")
     print(mulList)
     
     let mulSumResult = mulRegexList.compactMap { mulItem -> Int? in
         guard mulItem.numberOfRanges == 3 else { return nil }
         guard let leftNumber = String(String(input)[Range(mulItem.range(at: 1), in: String(input))!]).toInt,
               let RightNumber = String(String(input)[Range(mulItem.range(at: 2), in: String(input))!]).toInt
         else { return nil }
         return leftNumber * RightNumber
     }
     print("--- mulSumResult ---")
     print(mulSumResult)
 } catch {
     print("--- error ---")
     print(error.localizedDescription)
 }
}
*/
*/
