//
//  Day1.swift
//  aoc-2024
//
//  Created by Akhilesh Amle on 01/12/24.
//

import Foundation

struct Day1 {
    let sampleInput = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    
    let sampleInput2 = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """
    
    private func getList1AndList2(_ input: String) -> ([Int], [Int]) {
        let problemInput = input.split(separator: "\n")
        // print(problemInput)
        var list1: [Int] = []
        var list2: [Int] = []
        for input in problemInput {
            let items = input.split(separator: "   ")
            // print(items)
            guard let first = items.first, let firstNumber = Int(first),
                  let second = items.last, let secondNumber = Int(second)
            else { continue }
            
            list1.append(firstNumber)
            list2.append(secondNumber)
        }
        print(list1)
        print(list2)
        return (list1, list2)
    }
    
    // process input
    // Separate List 1
    // Separate List 2
    // guard both counts equal
    // get each index, sum, and maintain
    // get distance between the left and right element
    // sum all
    func day01(_ input: String) {
        let list1AndList2 = getList1AndList2(day01Input)
        let list1 = list1AndList2.0.sorted()
        let list2 = list1AndList2.1.sorted()
        print(list1)
        print(list2)
        guard list1.count == list2.count else { return }
        var allSum: [Int] = []
        for index in 0...list1.count-1 {
            // allSum.append(list1[index] - list2[index])
            let maxNum = max(list1[index], list2[index])
            let minNum = min(list1[index], list2[index])
            allSum.append(maxNum - minNum)
        }
        print(allSum.reduce(0, +))
    }
    
    /// get list1 and list2
    /// list all unique locationIDs in list1
    /// for each locationID in list1, how many times the same locationID apprers in list2?
    /// for each locationID, result = locatioID x number of occurances in list2
    /// The sum of all results in the output
    func part2(_ input: String) {
        let list1AndList2 = getList1AndList2(input)
        let list1 = list1AndList2.0
        let list2 = list1AndList2.1
        print("---part2---")
        print(list1)
        print(list2)
        var sum: [Int] = []
        for locationID in list1 {
            let numberOfO = list2.count(where: { $0 == locationID })
            print(locationID)
            print(numberOfO)
            sum.append(locationID * numberOfO)
        }
        print(sum.reduce(0, +))
    }
}
