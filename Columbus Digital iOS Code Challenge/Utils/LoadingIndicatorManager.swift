//
//  LoadingIndicatorManager.swift
//  Columbus Digital iOS Code Challenge
//
//  Created by Arturo González on 29/04/22.
//

import Foundation
import UIKit

class LoadingIndicatorManager {
    
    static func showAlertWithNavigationAction(viewController: UIViewController, title:String, message: String){
        var dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
                  let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             for controller in viewController.navigationController!.viewControllers as Array {
                 if controller.isKind(of: MainMenuViewController.self) {
                     viewController.navigationController!.popToViewController(controller, animated: true)
                     break
                 }
             }          })
        
         dialogMessage.addAction(ok)
         viewController.present(dialogMessage, animated: true, completion: nil)
    }
}
