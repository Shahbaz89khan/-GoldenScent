//
//  String+Extension.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 07/03/2021.
//

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
