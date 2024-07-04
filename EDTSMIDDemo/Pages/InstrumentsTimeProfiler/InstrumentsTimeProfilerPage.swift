//
//  InstrumentsTimeProfilerPage.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 30/06/24.
//

import SwiftUI

struct InstrumentsTimeProfilerPage: View {
    @State private var value: Double = 0

    var body: some View {
        VStack {
            Slider(value: $value, in: 0...1)
                .onChange(of: value) {
                    self.heavyProcess()
                }
            
            Text("Value: \(value)")
        }
    }
    
    private func heavyProcess() {
        var result: Float = 0
        for i in 0..<1000_000_000 {
            result += Float(i)
        }
        print(result)
    }
}

#Preview {
    InstrumentsTimeProfilerPage()
}
