//
//  Rows.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 04/03/2021.
//

struct Rows: Decodable {
    var rowMarginBottom: String?
    var rowMarginLeft : String?
    var rowMarginRight : String?
    var height : String?
    var columns : [Columns]?
    
    private enum CodingKeys: String, CodingKey {
        case rowMarginBottom = "row-margin-bottom"
        case rowMarginLeft = "row-margin-left"
        case rowMarginRight = "row-margin-right"
        case height
        case columns
    }
}
