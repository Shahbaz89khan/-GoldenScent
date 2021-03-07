//
//  ProductsListViewModel.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 05/03/2021.
//

import UIKit
class ProductsListViewModel {
    
    private let repository : ProductsRepository
    
    var reloadTableView: (()->())?
    
    var showError : ((String) ->())?
    
    var rows:  [Rows]?
    
    
    init(repository : ProductsRepository) {
        self.repository = repository
    }
    
    /// - Returns: list of products.
    func fetchProducts()  {
        if let response : BaseResponse = self.repository.loadProducts() {
            rows = response.rows
            self.reloadTableView?()
        } else {
            self.showError?("Some Error occurred")
            
        }
        
    }
    
    func getTotalSections() -> Int {
        return rows?.count ?? 0
    }
    
    func getHeightForRow(_ row : Int) -> CGFloat {
        let row = rows?[row]
        if let height =  row?.height {
            return CGFloat((height as NSString).floatValue)
        }
        return 0
    }
    
    // To get margins for all cells
    func getBottomConstraintForCell(_ row : Int) -> CGFloat {
        let row = rows?[row]
        var constant : CGFloat = 0.0
        if let margin = row?.rowMarginBottom {
            constant = CGFloat((margin as NSString).floatValue)
        }
        return constant
    }
    
    func getLeadingConstraintForCell(_ row : Int) -> CGFloat {
        let row = rows?[row]
        var constant : CGFloat = 0.0
        if let margin = row?.rowMarginLeft {
            constant = CGFloat((margin as NSString).floatValue)
        }
        return constant
    }
    
    func getTrailingConstraintForCell(_ row : Int) -> CGFloat {
        let row = rows?[row]
        var constant : CGFloat = 0.0
        if let margin = row?.rowMarginRight {
            constant = CGFloat((margin as NSString).floatValue)
        }
        return constant
    }
    
    
    // To make the list for all rows
    func makeItemForColumns(_ row : Int) -> [ProductItemListViewModel] {
        var itemsArray : [ProductItemListViewModel] = []
        guard let  column = rows?[row].columns?[0] else {
            return itemsArray
        }
        let type = column.getColumnType()
        
        switch type {
        case .slider:
            let sliders = column.slides
            for slide in sliders! {
                let imageUrlString = slide.src?.removingWhitespaces() ?? ""
                let item = ProductItemListViewModel(text: nil, imageURL: URL.init(string: imageUrlString), textFont: nil, textBackground: nil, textAlignment: nil, textFontSize: nil, fontColor: nil)
                itemsArray.append(item)
            }
        case .image:
            let column = rows?[row].columns
            for col in column! {
                let url : URL = URL.init(string: col.src?.removingWhitespaces() ?? "")!
                let item = ProductItemListViewModel(text: nil, imageURL: url , textFont: nil, textBackground: nil, textAlignment: nil, textFontSize: nil, fontColor: nil)
                itemsArray.append(item)
            }
            
        case .text:
            let column = rows?[row].columns
            for col in column! {
                let size : CGFloat = CGFloat((col.font! as NSString).floatValue)
                let font = UIFont.init(name: col.font ?? "" , size:size )!
                let item = ProductItemListViewModel(text: col.content, imageURL: nil, textFont: font, textBackground: UIColor.init(hex: col.background?.color ?? "#ffffff" ), textAlignment: nil, textFontSize: nil, fontColor: UIColor.init(hex: col.fontColor ?? "#ffffff"))
                itemsArray.append(item)
            }
        default:
            break
        }
        
        
        return itemsArray
        
    }
    
}
