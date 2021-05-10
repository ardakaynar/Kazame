//
//  RegisterViewController.swift
//  Kazame
//
//  Created by Arda Kaynar on 11.05.2021.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCorrectTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func registerButton(_ sender: Any) {
        // Retrieving the info from the text fields
        let username = usernameTextField.text
        let password = passwordTextField.text
        let passwordCorrect = passwordCorrectTextField.text
                
                // Defining the user object
        let user = PFUser()
        user.username = username
        user.password = password
        
        if password != passwordCorrect {
            self.alert(message: "Password don't match", title: "Password")
            return
        }
        
                
                // We won't set the email for this example;
                // Just for simplicity
                
                // Signing up using the Parse API
        user.signUpInBackground {
            (success, error) -> Void in
            if let error = error as NSError? {
                let errorString = error.userInfo["error"] as? NSString
                self.alert(message: errorString!, title: "Error")
                        
            } else {
                self.alert(message: "Registered successfully", title: "Registering")
            }
        }
    }
    
    

}
