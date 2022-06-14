//
//  registerVC.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 13.06.2022.
//  Copyright © 2022 Alfian Losari. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class registerVC: UIViewController {

    @IBOutlet weak var passwordtextField: UITextField!
    @IBOutlet weak var mailtextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: mailtextField.text! ,password: passwordtextField.text!, completion: { user, error in
                        
                        if error != nil
                        
                        {
                            // Create new Alert
                            let dialogMessage = UIAlertController(title: "Hata ", message: "Kayıt başarılı bir şekilde oluşturuldu.", preferredStyle: .alert)
                            
                            // Create OK button with action handler
                            let ok = UIAlertAction(title: "Tamam", style: .default, handler: { (action) -> Void in
                               // print("Ok button tapped")
                             })
                            
                            //Add OK button to a dialog message
                            dialogMessage.addAction(ok)
                            // Present Alert to
                            self.present(dialogMessage, animated: true, completion: nil)
                           
                        }
                            
                        else
                        {
                            // Create new Alert
                            let dialogMessage = UIAlertController(title: "İşlem Başarılı", message: "Kayıt başarılı bir şekilde oluşturuldu.", preferredStyle: .alert)
                            
                            // Create OK button with action handler
                            let ok = UIAlertAction(title: "Tamam", style: .default, handler: { (action) -> Void in
                               // print("Ok button tapped")
                             })
                            
                            //Add OK button to a dialog message
                            dialogMessage.addAction(ok)
                            // Present Alert to
                            self.present(dialogMessage, animated: true, completion: nil)
                          
                           

                        }
        })
    }
    
    

}
