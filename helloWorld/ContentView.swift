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
        let day01 = Day1()
        print(day01.day01(day01Input))
        print(day01.part2(day01Input))
        
        let day02 = Day2()
        print(day02.part1(day02Input))
        print(day02.part2(day02Input))
    }
}

#Preview {
    ContentView()
}
