//
//  ProductsRepository.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 05/03/2021.
//

import UIKit

protocol ProductsRepositoryProtocol {
    func loadProducts<T: Decodable>() -> T!
}
class ProductsRepository: ProductsRepositoryProtocol {

    // Products file name from the resources
    private var fileName : String
    
    init(fileName : String) {
        self.fileName = fileName
    }
    
    
    func loadProducts<T: Decodable>() -> T! {
        let data: Data
        guard let file = Bundle.main.url(forResource: self.fileName, withExtension: nil)
            else {
                // Return nil if the file not found
                return nil
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            // Return nil if problem wit the data in file
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            // Not properly parse
            return nil
        }
    }
    
}
