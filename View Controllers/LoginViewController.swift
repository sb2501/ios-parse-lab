//
//  LoginViewController.swift
//  chat-client-parse
//
//  Created by user132893 on 2/21/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        if(!(usernameField.text?.isEmpty)! && !(passwordField.text?.isEmpty)!)
        {
            let newUser = PFUser()
            
            newUser.username = usernameField.text
            newUser.password = passwordField.text
            
            
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if success{
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                }else{
                    print(error?.localizedDescription ?? " ")
                    
                }
            }
        }
        else{
            let alertController = UIAlertController(title: "Username and Password Required", message: "Please enter a username and password.", preferredStyle: .alert)
            
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
        
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        
        if(!(usernameField.text?.isEmpty)! && !(passwordField.text?.isEmpty)!)
        {
            
        
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
                
                if error != nil{
                    
                }
                else{
                    
                    self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    
                }
               
            }
        }
        else{
            let alertController = UIAlertController(title: "Username and Password Required", message: "Please enter a username and password.", preferredStyle: .alert)
            
            
            // create an OK action
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle response here.
            }
            // add the OK action to the alert controller
            alertController.addAction(OKAction)
            
            present(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
