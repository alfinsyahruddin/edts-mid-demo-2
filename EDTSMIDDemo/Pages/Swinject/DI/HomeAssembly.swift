//
//  HomeAssembly.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import Foundation
import Swinject
import SwinjectAutoregistration


class HomeAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(SwinjectPageViewModel.self, initializer: SwinjectPageViewModel.init)
        container.autoregister(SwinjectPage.self, initializer: SwinjectPage.init)
    }
    
}
