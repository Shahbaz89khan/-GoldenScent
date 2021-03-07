//
//  ProductItemListViewModel.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 06/03/2021.
//

import UIKit

class ProductItemListViewModel {
    var text: String?
    var imageURL: URL?
    var textFont: UIFont?
    var textBackground: UIColor?
    var textAlignment: String?
    var textFontSize: Int?
    var fontColor: UIColor?
    
    init(text: String?, imageURL: URL?, textFont: UIFont?, textBackground: UIColor?, textAlignment: String?, textFontSize: Int? , fontColor: UIColor? ) {
        self.text = text
        self.imageURL = imageURL
        self.textFont = textFont
        self.textBackground = textBackground
        self.textAlignment = textAlignment
        self.textFontSize = textFontSize
        self.fontColor = fontColor
    }
}
