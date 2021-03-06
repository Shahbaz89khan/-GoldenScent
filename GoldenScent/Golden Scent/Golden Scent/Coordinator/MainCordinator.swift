//
//  MainCordinator.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 05/03/2021.
//

import UIKit
class MainCordinator: Coordinator {

    var navigationController: UINavigationController

    init(navController : UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewModel = ProductsListViewModel(repository: ProductsRepository(fileName: "data.json"))
        let viewController = storyBoard.instantiateViewController(identifier: "ProductsListViewController") {
            ProductsListViewController(coder: $0, andViewModel: viewModel)
        }
       
        viewController.coordinator  = self
        self.navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func openProductDetail(){
       
    }
    
}
