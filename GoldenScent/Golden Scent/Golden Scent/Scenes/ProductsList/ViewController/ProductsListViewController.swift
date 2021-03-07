//
//  ProductsListViewController.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 05/03/2021.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    var viewModel: ProductsListViewModel
    var coordinator: MainCordinator?
    @IBOutlet private weak var tableView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        
    }
    
    required init?(coder: NSCoder, andViewModel viewModel : ProductsListViewModel) {
        self.viewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViewModel() {
        
        
        viewModel.reloadTableView =  {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
        
        viewModel.showError = { [weak self] (obj) in
            DispatchQueue.main.async {
                self?.showAlertView(title: "Alert", message: obj)
            }
        }
        
        viewModel.fetchProducts()
        
    }
    
    
}


extension ProductsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.getTotalSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = viewModel.getHeightForRow(indexPath.section)
        if height == 0 {
            return 150
        }
        return height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ProductsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as! ProductsTableViewCell
        cell.itemsArray = viewModel.makeItemForColumns (indexPath.section)
        cell.delegate = self
        cell.collectionView.reloadData()
        cell.bottomConstraint.constant = viewModel.getBottomConstraintForCell(indexPath.section)
        cell.leadingConstraint.constant = viewModel.getLeadingConstraintForCell(indexPath.section)
        cell.trailinigConstraint.constant = viewModel.getTrailingConstraintForCell(indexPath.section)
        
        return cell
    }
}

extension ProductsListViewController: ProductTableViewCellProtocol{
    func didClickOnItem() {
        coordinator?.start()
    }
}
