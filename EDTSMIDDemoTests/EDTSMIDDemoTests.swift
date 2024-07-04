//
//  EDTSMIDDemoTests.swift
//  EDTSMIDDemoTests
//
//  Created by M Alfin Syahruddin on 29/06/24.
//

import XCTest
import Mockable
@testable import EDTSMIDDemo

class ProductRepositoryTests: XCTestCase {
 
    func test_productRepository_requestTotalProducts() async throws {
        // Arrange
        let service = MockProductServiceProtocol()
        let repository = ProductRepository(service: service)
        
//        let mockProducts = ["iPhone 16 pro", "Macbook Pro", "Vision Pro"]
        
//        given(service)
//            .requestProducts().willReturn(mockProducts)
        
        // Act
        let total = repository.requestTotalProducts()
        
        // Assert
        XCTAssertEqual(total, 3)
    }
    
}
