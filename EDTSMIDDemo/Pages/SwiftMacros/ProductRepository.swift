//
//  ProductRepository.swift
//  EDTSMIDDemo
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import Foundation

public class ProductRepository {
    var service: ProductServiceProtocol
    
    public init(service: ProductServiceProtocol) {
        self.service = service
    }
    
    public func requestTotalProducts() -> Int {
        let products = self.service.requestProducts()
        return products.count
    }
}
