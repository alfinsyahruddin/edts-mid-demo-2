//
//  Menu.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import SwiftUI


struct MenuRow: View {
    var menu: Menu
    
    var body: some View {
        HStack {
            Text(menu.name)
            Spacer()
        }
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(menu.color)
        .cornerRadius(12)
    }
}

struct Menu {
    var name: String
    var color: Color
    var route: NavigationRoute
}

enum NavigationRoute {
    case combine
    case swiftConcurrency
    case instrumentsAllocations
    case instrumentsTimeProfiler
    case modularization
    case swinject
}

