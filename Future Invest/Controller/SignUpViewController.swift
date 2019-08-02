//
//  SignUpViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 8/1/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailLabel: TextField!
    @IBOutlet weak var passwordLabel: TextField!
    @IBOutlet weak var confirmPasswordLabel: TextField!
    
    let queryService = QueryService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
        emailLabel.delegate = self
        passwordLabel.delegate = self
        confirmPasswordLabel.delegate = self
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        switch textField.tag {
        case 0:
            emailLabel.becomeFirstResponder()
        case 1:
            passwordLabel.becomeFirstResponder()
        case 2:
            confirmPasswordLabel.becomeFirstResponder()
        default:
            break
        }
        
        return true
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        emailLabel.updateBorderColor()
        passwordLabel.updateBorderColor()
        confirmPasswordLabel.updateBorderColor()
        
        guard !emailLabel.text!.isEmpty && !passwordLabel.text!.isEmpty && !confirmPasswordLabel.text!.isEmpty else { return }
        
        if confirmPasswordLabel.text != passwordLabel.text {
            let alertController = UIAlertController(title: "Password and confirm password does not match", message: nil, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        queryService.postRequest(email: emailLabel.text!, password: passwordLabel.text!, method: .register, completion: { response in
            if (200..<300).contains(response.response!.statusCode) {
                self.performSegue(withIdentifier: "signUp", sender: nil)
            } else if response.response!.statusCode == 400 {
                let alertController = UIAlertController(title: "This email already exists", message: nil, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
        })
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UITextField {
    func updateBorderColor() {
        if self.text!.isEmpty {
            self.layer.borderColor = UIColor.red.cgColor
//            self.layer.borderWidth = 0.5
//            self.layer.cornerRadius = 5
        } else {
            self.layer.borderWidth = 0
        }
        
    }
    
}
