//
//  HomePage.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import SwiftUI
import Modularization

struct HomePage: View {
    @State private var route: [NavigationRoute] = []
    
    var body: some View {
        NavigationStack(path: $route) {
            VStack {
                ForEach(self.menus, id: \.name) { menu in
                    Button(action: {
                        route.append(menu.route)
                    }, label: {
                        MenuRow(menu: menu)
                    })
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("EDTS MID - Demo App")
            .navigationDestination(for: NavigationRoute.self) { route in
                Group {
                    switch route {
                    case .combine:
                        CombinePage()
                        
                    case .swiftConcurrency:
                        SwiftConcurrencyPage()
                        
                    case .instrumentsAllocations:
                        InstrumentsAllocationsPage()
                        
                    case .instrumentsTimeProfiler:
                        InstrumentsTimeProfilerPage()
                        
                    case .modularization:
                        ModularizationPage()
                        
                    case .swinject:
                        SwinjectPage(viewModel: SwinjectPageViewModel())
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    private let menus: [Menu] = [
        .init(name: "Combine", color: .red, route: .combine),
        .init(name: "Swift Concurrency", color: .orange, route: .swiftConcurrency),
        .init(name: "Xcode Instruments - Allocations", color: .yellow, route: .instrumentsAllocations),
        .init(name: "Xcode Instruments - Time Profiler", color: .green, route: .instrumentsTimeProfiler),
        .init(name: "Modularization", color: .blue, route: .modularization),
        .init(name: "Swinject", color: .purple, route: .swinject),
    ]
}

#Preview {
    HomePage()
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

