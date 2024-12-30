//
//  ContentView.swift
//  helloWorld
//
//  Created by Akhilesh Amle on 17/11/24.
//

import SwiftUI

struct ContentView: View {
    let title = "hello-world"
    var body: some View {
        VStack {
            Text(title)
        }
        .padding()
        .onAppear() {
            test()
        }
    }
    
    func test() {
//        let day01 = Day1()
//        print(day01.day01(day01Input))
//        print(day01.part2(day01Input))
//        
//        let day02 = Day2()
//        print(day02.part1(day02Input))
//        print(day02.part2(day02Input))
        
        print("--- day 3 ---")
        let day3 = Day3()
        print(day3.part1(input: day3Input))
    }
}

#Preview {
    ContentView()
}

/*
 day 3 dump
 /*
 let input = day3Input //"xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
 let pattern = #"mul\((\d+),(\d+)\)"#

 do {
     let regex = try NSRegularExpression(pattern: pattern)
     let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
     
     for match in matches {
         print("Match ranges: \(match.numberOfRanges)") // Should output at least 3 ranges per match
     }
     
     let map = matches.map {
         print("Match ranges in map: \($0.numberOfRanges)") // Should output at least 3 ranges per match
         print("$0.range(at: 0): \($0.range(at: 0))")
         let zero = $0.range(at: 0)
         let zeroString = String(String(input)[Range($0.range(at: 0), in: String(input))!])
         print("zeroString: \(zeroString)")
         print("$0.range(at: 1): \($0.range(at: 1))")
         let oneString = String(String(input)[Range($0.range(at: 1), in: String(input))!]).toInt
         print("oneString: \(oneString)")
         print("$0.range(at: 2): \($0.range(at: 2))")
         let twoString = String(String(input)[Range($0.range(at: 2), in: String(input))!]).toInt
         print("twoString: \(twoString)")
         return String(String(input)[Range($0.range, in: String(input))!])
     }
 } catch {
     print("Regex error: \(error)")
 }
 */
 
 */
