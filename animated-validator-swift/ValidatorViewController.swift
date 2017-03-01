//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    var doneArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        emailTextField.delegate = self
        emailConfirmationTextField.delegate = self
        phoneTextField.delegate = self
        passwordTextField.delegate = self
        passwordConfirmTextField.delegate = self
        self.submitButton.isEnabled = false
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            if emailTextField.text?.isEmpty == false {
                if emailTextField.text!.contains(".") && emailTextField.text!.contains("@"){
                    resetAnimation(emailTextField)
                    checkFields()
                } else {
                    alertAnimation(emailTextField)
                }
            }
        case emailConfirmationTextField:
            if emailConfirmationTextField.text?.isEmpty == false {
                if emailConfirmationTextField.text == emailTextField.text {
                    resetAnimation(emailConfirmationTextField)
                    checkFields()
                } else {
                    alertAnimation(emailConfirmationTextField)
                }
            }
        case phoneTextField:
            if phoneTextField.text?.isEmpty == false {
                if phoneTextField.text!.characters.count >= 7 && Int(phoneTextField.text!) != nil {
                    resetAnimation(phoneTextField)
                    checkFields()
                } else {
                    alertAnimation(phoneTextField)
                }
            }
        case passwordTextField:
            if passwordTextField.text?.isEmpty == false {
                if passwordTextField.text!.characters.count >= 6 {
                    resetAnimation(passwordTextField)
                    checkFields()
                } else {
                    alertAnimation(passwordTextField)
                }
            }
        case passwordConfirmTextField:
            if passwordConfirmTextField.text?.isEmpty == false {
                if passwordConfirmTextField.text == passwordTextField.text {
                    resetAnimation(passwordConfirmTextField)
                    checkFields()
                } else {
                    alertAnimation(passwordConfirmTextField)
                }
                
            }
            
        default:
            print ("That is not a text field")
        }
        
    }
    
    
}




extension ValidatorViewController {
    func alertAnimation(_ textfield: UITextField) {
        UITextField.animate(withDuration: 0.5, delay: 0.0, options: [.autoreverse , .curveEaseInOut, .repeat, .allowUserInteraction], animations:
            {textfield.backgroundColor = UIColor.red
                textfield.transform = CGAffineTransform(scaleX: 1.1 , y: 1.1) },
                            completion: nil)
    }
    
    func resetAnimation(_ textfield: UITextField) {
        doneArray.append("true")
        self.emailTextField.layer.removeAllAnimations()
        UITextField.animate(withDuration: 1.0, delay: 0.0, options: .curveLinear,
                            animations: {textfield.transform = CGAffineTransform(scaleX: 1, y: 1)
                                textfield.backgroundColor = UIColor.white},
                            completion: nil)
    }
    func checkFields() {
        if doneArray.count >= 5 {
            submitButton.isEnabled = true
        }
        print(doneArray)
        print("done")
    }
    
}
