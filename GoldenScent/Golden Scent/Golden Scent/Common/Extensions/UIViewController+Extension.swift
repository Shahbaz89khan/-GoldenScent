//
//  UIViewController+Extension.swift
//  Golden Scent
//
//  Created by Shahbaz Khan on 05/03/2021.
//

import UIKit

extension UIViewController   {
class func instantiate<T: UIViewController>(storyboardName: String) -> T? {
    
    let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
    let identifier = String(describing: self)
    return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    
}
    
    func showAlertView(title: String, message: String) {
        DispatchQueue.main.async {
            let alertViewController = UIAlertController(title: title, message:
                message, preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OKAY", style: .default, handler: {action in
            }))
            self.present(alertViewController, animated: true, completion: nil)
        }
        
    }
}
