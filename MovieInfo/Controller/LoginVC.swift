//
//  LoginVC.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 13.06.2022.
//  Copyright © 2022 Alfian Losari. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var mailtextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
           Auth.auth().signIn(withEmail: mailtextfield.text!, password: passwordtextfield.text!, completion:
                      
                      {
                      
                      user,error in
                          
                          
                       if error != nil {

                 
                           
                          }
                          
                       else {
                           self.performSegue(withIdentifier: LOGIN_TO_HOME, sender: self)


                          }
                          
                  })
    }
    
    @IBAction func signinClicked(_ sender: Any) {
        performSegue(withIdentifier: LOGIN_TO_REGISTER, sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == LOGIN_TO_HOME{
            let HomeVC = segue.destination
            HomeVC.modalPresentationStyle = .fullScreen
        }}
    
}
