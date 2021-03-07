//
//  Columns.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 04/03/2021.
//

struct Columns: Codable {
    var type: String?
    var src : String?
    var content : String?
    var textAlign : String?
    var fontColor: String?
    var fontSize : String?
    var font : String?
    var background : Background?
    var slides : [Slide]?
    
    private enum CodingKeys: String, CodingKey {
        case type
        case src
        case content 
        case textAlign = "text-align"
        case fontColor = "font-color"
        case fontSize = "font-size"
        case font
        case background
        case slides
    }
    
    func getColumnType() -> ColumnType {
        if self.type?.removingWhitespaces() == "image" {
            return ColumnType.image
        }
        
       else if self.type?.removingWhitespaces() == "text" {
            return ColumnType.text
        }
       else if self.type?.removingWhitespaces() == "custom-slider" {
        return ColumnType.slider
       }
        return ColumnType.unknown
    }
    
    
    
}

enum ColumnType {
    case image
    case text
    case slider
    case unknown
}
