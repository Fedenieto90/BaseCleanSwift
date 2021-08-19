//
//  UIViewController+Extended.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 19/08/2021.
//

import UIKit
import Swinject
import MBProgressHUD

extension UIViewController {
    
    func showAlert(title:String? = "Error",
                   message: String? = "Something went wrong",
                   buttonTitle: String? = "Ok") {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showProgress() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func hideProgress() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
}

extension UIViewController {
    
    var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    var container: Container {
        appDelegate.container
    }
    
}
