//
//  ProductsTableViewCell.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 06/03/2021.
//

import UIKit

protocol ProductTableViewCellProtocol: class {
    func didClickOnItem()
}

class ProductsTableViewCell: UITableViewCell {

    var itemsArray : [ProductItemListViewModel] = [ProductItemListViewModel]()
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate : ProductTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ProductsTableViewCell : UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsArray.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: "ProductItemCollectionViewCell", for: indexPath)as! ProductItemCollectionViewCell
        cell.viewModel = itemsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if let delegate = delegate {
            delegate.didClickOnItem()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var width = self.collectionView.frame.size.width
        width = width / 3
        return CGSize(width: width, height: self.collectionView.frame.size.height)
    }
    
    
}
