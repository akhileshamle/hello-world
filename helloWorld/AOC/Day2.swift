//
//  Day2.swift
//  helloWorld
//
//  Created by Akhilesh Amle on 03/12/24.
//

import Foundation

struct Day2 {
    let sampleInput = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """
    
    enum LevelState {
        case increasing
        case decreasing
    }
    
    /// How many reports are safe?
    /// All levels are either increasing or decreasing.
    /// Any two adjacent levels differ by at least one and atmost three.
    /// For each report determine of the levels are safe or not, each level can have a different of atmost three
    func part1(_ input: String) {
        let reports = input.split(separator: "\n")
        // let levels = reports.first?.split(separator: " ")
        print(reports)
        // print(levels)
        var safeCount = 0
        for report in reports {
            let levels = report.split(separator: " ")
            var levelState: LevelState?
            var index = 0
            var previousLevel: Int?
            
            for level in levels {
                let currentLevel = Int(String(level))!
                
                // check if there's a change in increment ~ decrement
                if previousLevel == nil {
                    // first element
                } else {
                    if levelState == nil {
                        if previousLevel == currentLevel {
                            // unsafe
                            break
                        }
                        // set level
                        levelState = previousLevel! < currentLevel ? .increasing : .decreasing
                    } else {
                        if previousLevel == currentLevel {
                            // unsafe
                            break
                        }
                        let currentLevelState: LevelState = previousLevel! < currentLevel ? .increasing : .decreasing
                        if currentLevelState != levelState {
                            // unsafe - incerement / decrement mismatch
                            break
                        }
                    }
                }

                // so far safe
                if levelState == .increasing {
                    let difference = currentLevel - previousLevel!
                    if difference > 3 {
                        // unsafe
                        break
                    }
                }
                
                if levelState == .decreasing {
                    let difference = previousLevel! - currentLevel
                    if difference > 3 {
                        // unsafe
                        break
                    }
                }
                
                previousLevel = Int(String(level))!
                
                // if last item - all safe
                if index == levels.count - 1 {
                    // level safe
                    safeCount += 1
                    print("safe report: \(report)")
                }
                index += 1
            }
        }
        print("safe count: \(safeCount)")
    }
    
    func part2(_ input: String) {
        let reports = input.split(separator: "\n")
        // let levels = reports.first?.split(separator: " ")
        print(reports)
        // print(levels)
        var safeCount = 0
        for report in reports {
            let levels = report.split(separator: " ")
            var levelState: LevelState?
            var index = 0
            var previousLevel: Int?
            
            for level in levels {
                let currentLevel = Int(String(level))!
                var toleranceCount = 0
                
                // check if there's a change in increment ~ decrement
                if previousLevel == nil {
                    // first element
                } else {
                    if levelState == nil {
                        if previousLevel == currentLevel {
                            if toleranceCount == 0 {
                                toleranceCount += 1
                            } else {
                                // unsafe
                                break
                            }
                        }
                        // set level
                        levelState = previousLevel! < currentLevel ? .increasing : .decreasing
                    } else {
                        if previousLevel == currentLevel {
                            if toleranceCount == 0 {
                                toleranceCount += 1
                            } else {
                                // unsafe
                                break
                            }
                        }
                        let currentLevelState: LevelState = previousLevel! < currentLevel ? .increasing : .decreasing
                        if currentLevelState != levelState {
                            if toleranceCount == 0 {
                                toleranceCount += 1
                            } else {
                                // unsafe - incerement / decrement mismatch
                                break
                            }
                        }
                    }
                }

                // so far safe
                if levelState == .increasing {
                    let difference = currentLevel - previousLevel!
                    if difference > 3 {
                        // unsafe
                        break
                    }
                }
                
                if levelState == .decreasing {
                    let difference = previousLevel! - currentLevel
                    if difference > 3 {
                        // unsafe
                        break
                    }
                }
                
                previousLevel = Int(String(level))!
                
                // if last item - all safe
                if index == levels.count - 1 {
                    // level safe
                    safeCount += 1
                    print("safe report: \(report)")
                }
                index += 1
            }
        }
        print("safe count: \(safeCount)")
    }
}
