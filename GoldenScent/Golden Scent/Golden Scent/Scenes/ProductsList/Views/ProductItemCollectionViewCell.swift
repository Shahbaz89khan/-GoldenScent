//
//  ProductItemCollectionViewCell.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 06/03/2021.
//

import UIKit
import Kingfisher
class ProductItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var viewModel : ProductItemListViewModel! {
        didSet {
      if  let viewModel = viewModel {
        
        if viewModel.text == nil {
            textLabel.isHidden = true
        }
        else {
            textLabel.isHidden = false
            textLabel.text = viewModel.text
        }
        
        if viewModel.imageURL == nil {
            imageView.isHidden = true
        } else {
            imageView.isHidden = false 

            imageView.kf.setImage(with: viewModel.imageURL)
           // let data = try? Data(contentsOf: viewModel.imageURL!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            //imageView.image = UIImage(data: data!)
        }
        if viewModel.textBackground != nil {
            self.backgroundColor = viewModel.textBackground
        }
        if viewModel.textFont != nil {
            self.backgroundColor = viewModel.fontColor
        }
        }
        }
    }
}
