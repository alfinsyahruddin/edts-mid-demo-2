//
//  InstrumentsAllocationsPage.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 30/06/24.
//

import SwiftUI

struct InstrumentsAllocationsPage: View {
    let viewModel = InstrumentsAllocationsPageViewModel()
    
    var body: some View {
       Text("Instruments Allocations")
    }
}

class InstrumentsAllocationsPageViewModel: ObservableObject, SomeDelegate {
    var delegate: SomeDelegate? = nil
    
    let data: [Int] = {
        var result: [Int] = []
        for n in 0..<10_000_000 {
            result.append(n)
        }
        return result
    }()
    
    init() {
        self.delegate = self
    }
}

protocol SomeDelegate: AnyObject {
    
}
