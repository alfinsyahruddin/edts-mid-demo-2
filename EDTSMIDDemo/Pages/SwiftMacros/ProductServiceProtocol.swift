//
//  ProductServiceProtocol.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 09/07/24.
//

import Foundation
import Mockable

//@Mockable
public protocol ProductServiceProtocol {
    func requestProducts() -> [String]
}

public class MockProductServiceProtocol: ProductServiceProtocol {
    public var onRequestProducts: (() -> [String])? = nil
    
    public func requestProducts() -> [String] {
        self.onRequestProducts?() ?? []
    }
}
