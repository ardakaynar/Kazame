//
//  ViewController.swift
//  Kazame
//
//  Created by Arda Kaynar on 8.05.2021.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
       
        if !PFUser().isAuthenticated {
            self.performSegue(withIdentifier: "loginView", sender: self)
        } else {
            let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
            guard let homeViewController = homeStoryboard.instantiateInitialViewController() else{
                return
            }
            homeViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(homeViewController, animated: false, completion: {
                
            })
            
        }
    }
    
    
    
   
}

