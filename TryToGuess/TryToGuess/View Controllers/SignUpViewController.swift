//
//  SignUpViewController.swift
//  TryToGuess
//
//  Created by Евгений Таран on 1/23/18.
//  Copyright © 2018 Zhenya Taran. All rights reserved.
//

import Foundation
import UIKit
import Quickblox

class SignUpViewController: UIViewController {
   
    
    @IBOutlet weak var login: UITextField?
    @IBOutlet weak var password: UITextField?
    
    @IBAction func chechLogInButton(_ sender: UIButton) {
        signUP()
    }
    
    func signUP() {
        let user = QBUUser()
        user.login = login?.text
        user.password = password?.text

        QBRequest.signUp(user, successBlock: { (response, user) in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "SignUpPressed", sender: self)
            }
        }) { (response) in
            self.alert()
        }
    }
    func alert() {
        let alertField = UIAlertController(title: "Alert", message: "Invalid login or password.", preferredStyle: .alert  )
        alertField.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alertField, animated: true, completion: nil)
    }
    
}

