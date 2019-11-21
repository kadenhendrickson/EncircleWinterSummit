//
//  ProfileViewController.swift
//  EncircleWinterSummit
//
//  Created by Kaden Hendrickson on 11/11/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var genderIdentityTextField: UITextField!
    @IBOutlet weak var sexualOrientationTextField: UITextField!
    @IBOutlet weak var trackPreferencesButton: UIButton!
    @IBOutlet weak var editFIrstNameButton: UIButton!
    @IBOutlet weak var editLastNameButton: UIButton!
    @IBOutlet weak var editGenderButton: UIButton!
    @IBOutlet weak var editSexualOrientationButton: UIButton!
    
    @IBOutlet weak var preferredPronounButton: UIButton!
    @IBOutlet var pronounButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialViews()
        self.view.backgroundColor = .black

        // Do any additional setup after loading the view.
    }
    
    @IBAction func preferredPronounButtonTapped(_ sender: UIButton) {
        print("FUCK")
        pronounButtons.forEach { (button) in
            if(button.titleLabel?.text != self.preferredPronounButton.titleLabel?.text){
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = !button.isHidden
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    
    @IBAction func pronounButtonClicked(_ sender: UIButton) {
        preferredPronounButton.setTitle(sender.titleLabel?.text, for: .normal)
        pronounButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = true
            }
        }
    }
    
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        switch sender {
        case editFIrstNameButton:
            edit(textField: firstNameTextField)
        case editLastNameButton:
            edit(textField: lastNameTextField)
        case editGenderButton:
            edit(textField: genderIdentityTextField)
        case sexualOrientationTextField:
            edit(textField: sexualOrientationTextField)
        default:
            print("huh")
        }
    }
    
    /*
     Helper Methods
     */
    func setupInitialViews(){
        guard let user = UserController.shared.currentUser else {return}
        firstNameTextField.text = user.firstName
        formatInitialTextField(textField: firstNameTextField)
        lastNameTextField.text = user.lastName
        formatInitialTextField(textField: lastNameTextField)
        preferredPronounButton.setTitle(user.pronouns.rawValue, for: .normal)
        preferredPronounButton.setTitleColor(.white, for: .normal)
        genderIdentityTextField.text = user.genderIdentity
        formatInitialTextField(textField: genderIdentityTextField)
        sexualOrientationTextField.text = user.sexualOrientation
        formatInitialTextField(textField: sexualOrientationTextField)
        trackPreferencesButton.setTitle(user.trackPreference.rawValue, for: .normal)
        
        
    }
    func formatInitialTextField(textField: UITextField){
        textField.textColor = .white
        textField.isEnabled = false
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.font = UIFont(name: FontNames.futuraBook, size: 16)
    }
    func edit(textField: UITextField){
        textField.isEnabled = !textField.isEnabled
        if(textField.isEnabled){
            textField.borderStyle = .line
            textField.backgroundColor = .systemGray
        } else {
            formatInitialTextField(textField: textField)
        }
       
        print("\(textField) is enabled: \(textField.isEnabled)")
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
