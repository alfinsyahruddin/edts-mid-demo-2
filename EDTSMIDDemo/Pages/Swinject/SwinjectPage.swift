//
//  SwinjectPage.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import SwiftUI

struct SwinjectPage: View {
    let viewModel: SwinjectPageViewModel
    
    init(viewModel: SwinjectPageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(viewModel.title)
    }
}

class SwinjectPageViewModel {
    var title = "Swinject Page"
}
