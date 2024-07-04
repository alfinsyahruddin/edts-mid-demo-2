//
//  SwiftConcurrencyPage.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import SwiftUI

struct SwiftConcurrencyPage: View {
    @StateObject var viewModel = SwiftConcurrencyPageViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Button("Get 3 Random Numbers") {
                        viewModel.get3RandomNumbers()
                    }
                    .buttonStyle(.borderedProminent)
                    
//                    Counter
//                    Button("Get Number from Counter") {
//                        viewModel.getNumbersFromCounter()
//                    }
//                    .buttonStyle(.borderedProminent)
                }
                
                Spacer()
                                
                Button("Clear") {
                    viewModel.numbers = []
                }
            }
            .padding(.horizontal)
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            List {
                ForEach(viewModel.numbers, id: \.self) { number in
                    Text("\(number)")
                }
            }
        }
        .navigationTitle("Swift Concurrency")
    }
}

#Preview {
    SwiftConcurrencyPage()
}

@MainActor class SwiftConcurrencyPageViewModel: ObservableObject {
    @Published var numbers: [Int] = []
    @Published var isLoading: Bool = false
    
//     Async / Await
    func get3RandomNumbers() {
        Task {
//            Serial
            let number1 = try await getRandomNumber()
            numbers.append(number1)
            
            let number2 = try await getRandomNumber()
            numbers.append(number2)
            
            let number3 = try await getRandomNumber()
            numbers.append(number3)
            
//            Parallel
//            async let number1 = getRandomNumber()
//            async let number2 = getRandomNumber()
//            async let number3 = getRandomNumber()
//
//            let result = try await [number1, number2, number3]
//            numbers.append(contentsOf: result)
        }
    }
    
    func getRandomNumber() async throws -> Int {
        isLoading = true
        defer { isLoading = false }
        let data = Int.random(in: 0...9)
        try await Task.sleep(for: .seconds(1))
        return data
    }
    
//     Data Races
//    func getNumbersFromCounter() {
//        Task {
//            isLoading = true
//            defer { isLoading = false }
//            
//            let counter = Counter()
//            
//            for _ in 0..<10_000 {
//                Task {
//                    counter.increment()
//                }
//            }
//            
//            try await Task.sleep(for: .seconds(0.5)) // ADD DELAY
//
//            self.numbers.append(counter.count)
//        }
//    }
    
//     Task Group
//    func getNumbersFromCounter() {
//        Task {
//            isLoading = true
//            defer { isLoading = false }
//            
//            let counter = Counter()
//            
//            await withTaskGroup(of: Void.self) { group in
//                for _ in 0..<10_000 {
//                    group.addTask {
//                        await counter.increment()
//                    }
//                }
//            }
//                
//            self.numbers.append(await counter.count)
//        }
//    }
}



class Counter {
    var count: Int = 0
    
    func increment() {
        count += 1
    }
}


