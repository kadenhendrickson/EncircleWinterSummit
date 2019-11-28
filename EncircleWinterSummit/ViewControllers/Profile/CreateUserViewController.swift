//
//  CreateUserViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/26/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController, UITextFieldDelegate{
 
    var defaultText: String?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexualOrientationTextField: UITextField!
    @IBOutlet weak var genderIdentityTextField: UITextField!
    @IBOutlet weak var pronounSelectorButton: UIButton!
    @IBOutlet weak var trackPreferenceSelectorButton: UIButton!
    @IBOutlet var trackPreferenceButtons: [UIButton]!
    @IBOutlet var pronounButtons: [UIButton]!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        ageTextField.delegate = self
        sexualOrientationTextField.delegate = self
        genderIdentityTextField.delegate = self
        // Do any additional setup after loading the view.
        signUpButton.backgroundColor = .white
        signUpButton.tintColor = .none
        signUpButton.setTitle("Sign Up!", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: FontNames.futuraBook, size: 14)
    }
    
    
    @IBAction func trackPreferenceSelectorButtonTapped(_ sender: UIButton) {
        trackPreferenceButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                if(button.titleLabel?.text != sender.titleLabel?.text) {
                    button.isHidden = !button.isHidden
                    self.loadViewIfNeeded()
                }
            }
        }
    }
    
    @IBAction func trackButtonTapped(_ sender: UIButton) {
        trackPreferenceSelectorButton.setTitle(sender.titleLabel?.text, for: .normal)
        trackPreferenceButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = true
            }
        }
    }
    
    @IBAction func pronounSelectorButtonTapped(_ sender: UIButton) {
        pronounButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                if(button.titleLabel?.text != sender.titleLabel?.text){
                    button.isHidden = !button.isHidden
                    self.loadViewIfNeeded()
                }
            }
        }
    }
    
    @IBAction func pronounButtonTapped(_ sender: UIButton) {
        pronounSelectorButton.setTitle(sender.titleLabel?.text, for: .normal)
        pronounButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.loadViewIfNeeded()
            }
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
        let lastName = lastNameTextField.text, !lastName.isEmpty,
            let email = emailTextField.text,
            let age = ageTextField.text, !age.isEmpty,
            let sexualOrientation = sexualOrientationTextField.text, !sexualOrientation.isEmpty,
            let genderIdentity = genderIdentityTextField.text, !genderIdentity.isEmpty,
            let pronounString = pronounSelectorButton.titleLabel?.text, pronounString != "Pronouns",
            let trackPreferenceString = trackPreferenceSelectorButton.titleLabel?.text, trackPreferenceString != "Track Preference" else {alertUser(withMessage: "Please fill out all of the fields!"); return}
        
        let pronoun = determinePronouns(pronounString)
        let track = determineTrackPreference(trackPreferenceString)
        
        UserController.shared.createUser(with: firstName, lastName: lastName, pronouns: pronoun, genderIdentity: genderIdentity, sexualOrientation: sexualOrientation, trackPreference: track, email: email, age: age)
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "baseTabBar")
        UIApplication.shared.windows[0].rootViewController = viewController
    }
    
    @IBAction func resignKeyboard(_ sender: Any) {
        resignTextFields()
    }
    //helper methods
    func determinePronouns(_ sender: String) -> Pronoun {
        switch sender {
            case "He/Him":
                return .he
            case "She/Her":
                return .she
            case "They/Them":
                return .they
            case "Other":
                return .other
            default:
                print("How is this possible?!")
                return .he
        }
    }
    
    func determineTrackPreference(_ sender: String) -> Track {
        switch sender {
        case "Youth Track":
            return .youth
        case "Young Adult Track":
            return .youngAdult
        case "Adult Track":
            return .adult
        case "Parent/Ally Track":
            return .parent
        case "Educator Track":
            return .educator
        default:
            print("HOW IS THIS POSSIBLE")
            return .youth
       
        }
    }
    
    func resignTextFields(){
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        sexualOrientationTextField.resignFirstResponder()
        genderIdentityTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        defaultText = textField.text
        textField.text = ""
        if(textField.isEqual(genderIdentityTextField)){
            UIView.animate(withDuration: 0.2) {
            self.view.frame = CGRect(x: 0, y: -50, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }
        if(textField.isEqual(sexualOrientationTextField)){
            UIView.animate(withDuration: 0.2) {
            self.view.frame = CGRect(x: 0, y: -40, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }
    }
  func textFieldDidEndEditing(_ textField: UITextField) {
    if(textField.text?.isEmpty ?? true) {
            textField.text = defaultText
        }
    
    if(textField.isEqual(genderIdentityTextField)){
        UIView.animate(withDuration: 0.2) {
        self.view.frame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: self.view.frame.size.height)
        }
    }
    
    if(textField.isEqual(sexualOrientationTextField)){
               UIView.animate(withDuration: 0.2) {
               self.view.frame = CGRect(x: 0, y: 40, width: self.view.frame.size.width, height: self.view.frame.size.height)
               }
           }
    
    }
    
    func alertUser(withMessage message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
}
