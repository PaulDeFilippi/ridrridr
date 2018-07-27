//
//  LoginVC.swift
//  ridrridr
//
//  Created by Paul Defilippi on 10/23/17.
//  Copyright © 2017 Paul DeFilippi. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailField: RoundedCornerTextField!
    @IBOutlet weak var passwordField: RoundedCornerTextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var authButton: RoundedShadowButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
        view.bindToKeyboard()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleScreenTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func cancelBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func authButtonPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            authButton.animateButton(shouldLoad: true, with: nil)
            self.view.endEditing(true)
        }
        // login a currently existing user
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    if let user = user {
                        if self.segmentedControl.selectedSegmentIndex == 0 {
                            let userData = ["provider": user] as [String: Any]
                            DataService.instance.createFirebaseDBUser(uid: user.user.providerID, userData: userData, isDriver: false)
                        } else {
                            let userData = ["provider": user.user.providerID, "userIsDriver": true, "isPickupModenabled": false, "driverIsOnTrip": false] as [String: Any]
                            DataService.instance.createFirebaseDBUser(uid: user.user.uid, userData: userData, isDriver: true)
                        }
                    }
                    print("Email user authenticated successfully with Firebase")
                    self.dismiss(animated: true, completion: nil)
                } else {
                    if let errorCode = AuthErrorCode(rawValue: error!._code) {
                        switch errorCode {
                        case .wrongPassword:
                            print("Whoops! That was the wrong password!")
                        default:
                            print("An unexpected error occured. Please try again.")
                        }
                    }
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            if let errorCode = AuthErrorCode(rawValue: error!._code) {
                                switch errorCode {
                                case .invalidEmail:
                                    print("this is an invalid email. Please try again.")
                                default:
                                    print("An unexpected error occured. Please try again.")
                                }
                                
                            }
                        } else {
                            if let user = user {
                                if self.segmentedControl.selectedSegmentIndex == 0 {
                                    let userData = ["provider": user.user.providerID] as[String: Any]
                                    DataService.instance.createFirebaseDBUser(uid: user.user.uid, userData: userData, isDriver: false)
                                } else {
                                    let userData = ["provider": user.user.providerID, "userIsDriver": true, "isPickupModeEnabled": false, "driverIsOnTrip": false] as [String: Any]
                                    DataService.instance.createFirebaseDBUser(uid: user.user.uid, userData: userData, isDriver: true)
                                }
                            }
                            print("Successfully created a new user with Firebase")
                            self.dismiss(animated: true, completion: nil)
                        }
                    })
                }
            })
            
        }
    }
}
