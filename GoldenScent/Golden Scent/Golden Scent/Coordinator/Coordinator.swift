//
//  Coordinator.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 05/03/2021.
//

import UIKit

protocol Coordinator {
     var navigationController : UINavigationController {get set}
    func start()
}
