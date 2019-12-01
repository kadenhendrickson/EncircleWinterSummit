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
    @IBOutlet weak var editFIrstNameButton: UIButton!
    @IBOutlet weak var editLastNameButton: UIButton!
    @IBOutlet weak var editGenderButton: UIButton!
    @IBOutlet weak var editSexualOrientationButton: UIButton!
    @IBOutlet weak var underPronounView: UIView!
    
    @IBOutlet weak var preferredPronounButton: UIButton!
    @IBOutlet var pronounButtons: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialViews()
        self.view.backgroundColor = .black

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(true)
          tabBarController?.tabBar.barTintColor = .black
      }
    
    @IBAction func resignKeyboards(_ sender: Any) {
        resignAllTextFields()
    }
    @IBAction func preferredPronounButtonTapped(_ sender: UIButton) {
        underPronounView.isHidden = !underPronounView.isHidden
        print("FUCK")
        pronounButtons.forEach { (button) in
             UIView.animate(withDuration: 0.3) {
                if(button.titleLabel?.text != self.preferredPronounButton.titleLabel?.text){
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
                self.underPronounView.isHidden = false

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
        case editSexualOrientationButton:
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
//        preferredPronounButton.setTitleColor(.white, for: .normal)
//        preferredPronounButton.titleLabel?.font = UIFont(name: FontNames.futuraBook, size: 16)
        preferredPronounButton.contentHorizontalAlignment = .left
        genderIdentityTextField.text = user.genderIdentity
        formatInitialTextField(textField: genderIdentityTextField)
        sexualOrientationTextField.text = user.sexualOrientation
        formatInitialTextField(textField: sexualOrientationTextField)
        
        
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
    
    func resignAllTextFields(){
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        genderIdentityTextField.resignFirstResponder()
        sexualOrientationTextField.resignFirstResponder()
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
