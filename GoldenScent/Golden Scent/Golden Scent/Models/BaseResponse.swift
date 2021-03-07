//
//  BaseResponse.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 04/03/2021.
//


struct BaseResponse: Codable {
    var rows : [Rows]?
    enum CodingKeys: String, CodingKey {
        case rows
    }
    
    init(rows : [Rows]) {
        self.rows = rows 
    }
}
