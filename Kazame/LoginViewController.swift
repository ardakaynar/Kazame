//
//  LoginViewController.swift
//  Kazame
//
//  Created by Arda Kaynar on 10.05.2021.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        usernameText.layer.masksToBounds = true
        usernameText.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
    }
    
    func alert(message: NSString, title: NSString) {
        let alert = UIAlertController(title: title as String, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

    }
    
    
    @IBAction func signup(_ sender: Any) {
        // Retrieving the info from the text fields
               let username = usernameText.text
               let password = passwordText.text
               
               // Defining the user object
               PFUser.logInWithUsername(inBackground: username!, password: password!, block: {(user, error) -> Void in
                   if let error = error as NSError? {
                       let errorString = error.userInfo["error"] as? NSString
                       self.alert(message: errorString!, title: "Error")
                   }
                   else {
                    
                    self.alert(message: username! as NSString, title: "Login")
                   }
               })
       
    }

}

