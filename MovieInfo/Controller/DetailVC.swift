//
//  DetailVC.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 13.06.2022.
//  Copyright © 2022 Sinan Tanrıkut. All rights reserved.
//

import UIKit
import Kingfisher
import Firebase
import FirebaseDatabase

class DetailVC: UIViewController {
    var ref: DatabaseReference!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var imagebox: UIImageView!
    @IBOutlet weak var textarea: UITextView!
    var moviedetails: MovieView!
    
    public var deneme:String?
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Do any additional setup after loading the view.
        print(moviedetails)
        
        titleLbl.text = moviedetails.title
        textarea.text = moviedetails.overview
        imagebox.kf.setImage(with: moviedetails.posterURL)
        
        
    }
   
    @IBAction func favoriteaddclicked(_ sender: Any) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
   //     guard let displayName = Auth.auth().currentUser?.displayName else {return}
        self.ref = Database.database().reference(withPath: "Favorites")
        let urlString = moviedetails.posterURL.absoluteString
        
        self.ref.child(uid).child(moviedetails.title).setValue(["title" : moviedetails.title, "overview" : moviedetails.overview, "posterURL" : urlString,  "Rating" : moviedetails.rating])
        
        // Create new Alert
        let dialogMessage = UIAlertController(title: "İşlem Başarılı", message: "başarılı bir şekilde eklendi.", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "Tamam", style: .default, handler: { (action) -> Void in
           // print("Ok button tapped")
         })
        performSegue(withIdentifier: "detailtofav", sender: nil)
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
       
        
    }
    
    @IBAction func addclicked(_ sender: Any) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
   //     guard let displayName = Auth.auth().currentUser?.displayName else {return}
        self.ref = Database.database().reference(withPath: "Watchlist")
        let urlString = moviedetails.posterURL.absoluteString
        
        self.ref.child(uid).child(moviedetails.title).setValue(["title" : moviedetails.title, "overview" : moviedetails.overview, "posterURL" : urlString,  "Rating" : moviedetails.rating])
        
        // Create new Alert
        let dialogMessage = UIAlertController(title: "İşlem Başarılı", message: " başarılı bir şekilde eklendi.", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "Tamam", style: .default, handler: { (action) -> Void in
           // print("Ok button tapped")
         })
        performSegue(withIdentifier: "movielist", sender: nil)
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
       
      
        
    }
    
}
