//
//  ProductsResporitoryTests.swift
//  Golden ScentTests
//
//  Created by Shahbaz Khan on 07/03/2021.
//

import XCTest

@testable import Golden_Scent


class ProductsRepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldReturnRecipes() {
        let sut : ProductsRepository =  ProductsRepository(fileName: "data.json")
        let response : BaseResponse! = sut.loadProducts()
        XCTAssertNotNil(response)
        
    }
    
    
    func testWrongRepositoryFile() {
        let sut : ProductsRepository =  ProductsRepository(fileName: "d3ata.json")
        let response : BaseResponse! = sut.loadProducts()
        XCTAssertNil(response)
        
    }
    
    
    
    
}
