//
//  CombinePage.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import SwiftUI
import Combine

struct CombinePage: View {
    @StateObject var viewModel = CombinePageViewModel()
    
    var body: some View {
        VStack {
            Text("`price`: \(viewModel.price)")
            Text("`balance`: \(viewModel.balance)")
            Text("`canBuy`: \(viewModel.canBuy)")
            
            Spacer().frame(height: 16)

            Button("Add `balance` +5000") {
                viewModel.addBalance(5000)
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Combine")
    }
}

// Imperative
class CombinePageViewModel: ObservableObject {
    let price = 5000
    var balance = 0
    var canBuy: Bool { balance >= price }
    
    func addBalance(_ value: Int) {
        balance += 5000
        print("balance: \(balance)")
    }
}

// Combine
//class CombinePageViewModel: ObservableObject {
//    let price = CurrentValueSubject<Int, Never>(5000)
//    let balance = CurrentValueSubject<Int, Never>(0)
//    var canBuy: Bool = false
//    var subscriptions: [AnyCancellable] = []
//    
//    init() {
//        balance
//            .combineLatest(price)
//            .map { $0 >= $1 }
//            .sink(receiveValue: { [weak self] value in
//                self?.canBuy = value
//                self?.objectWillChange.send()
//            })
//            .store(in: &subscriptions)
//    }
//    
//    func addBalance(_ value: Int) {
//        balance.send(balance.value + 5000)
//        print("balance: \(balance)")
//    }
//}

// Combine + SwiftUI
//class CombinePageViewModel: ObservableObject {
//    @Published var price = 5000
//    @Published var balance = 0
//    var canBuy: Bool { balance >= price }
//    
//    func addBalance(_ value: Int) {
//        balance += 5000
//        print("balance: \(balance)")
//    }
//}

#Preview {
    CombinePage()
}
