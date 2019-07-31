//
//  AddCardViewController.swift
//  Future Invest
//
//  Created by Gerasim Israyelyan on 7/31/19.
//  Copyright © 2019 Gerasim Israyelyan. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cardNameTextField: TextField!
    @IBOutlet weak var cardNumberTextField: TextField!
    @IBOutlet weak var dateTextField: TextField!
    @IBOutlet weak var CVVTextField: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        cardNameTextField.delegate = self
        cardNumberTextField.delegate = self
        dateTextField.delegate = self
        CVVTextField.delegate = self

    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            dateTextField.isFirstResponder || CVVTextField.isFirstResponder {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0,
            dateTextField.isFirstResponder || CVVTextField.isFirstResponder {
            self.view.frame.origin.y = 0
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            textField.resignFirstResponder()
            cardNumberTextField.becomeFirstResponder()
        case 1:
            textField.resignFirstResponder()
            dateTextField.becomeFirstResponder()
        case 2:
            textField.resignFirstResponder()
            CVVTextField.becomeFirstResponder()
        case 3:
            textField.resignFirstResponder()
        default:
            break
        }
        
        return true
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
