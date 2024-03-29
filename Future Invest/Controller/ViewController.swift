//
//  ViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 7/31/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {
    
    let queryService = QueryService()

    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var passwordTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        emailTextField.delegate =  self
        passwordTextField.delegate = self
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case 1:
            textField.resignFirstResponder()

        default:
            break
        }
        
        return true 
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "llogin", sender: nil)

//        emailTextField.updateBorderColor()
//        passwordTextField.updateBorderColor()
//        guard !emailTextField.text!.isEmpty,
//            !passwordTextField.text!.isEmpty else { return }
//
//        queryService.postRequest(email: emailTextField.text!, password: passwordTextField.text!, method: .login, completion: { response in
//
//            if (200..<300).contains(response.response!.statusCode) {
//                self.performSegue(withIdentifier: "llogin", sender: nil)
//            } else if (400..<500).contains(response.response!.statusCode) {
//                let alertController = UIAlertController(title: "Account does not exist", message: nil, preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
//                self.present(alertController, animated: true, completion: nil)
//                return
//            }
//
//        })

    }
    
}


