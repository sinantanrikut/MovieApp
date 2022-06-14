//
//  watchListVC.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 14.06.2022.
//  Copyright © 2022 Sinan Tanrıkut. All rights reserved..
//

import UIKit
import Firebase
import FirebaseDatabase


class watchListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    private(set) public var movies = [moviesModel]()
    var moviedetail:moviesModel!
    var ref: DatabaseReference!
    

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchObject()
        table.dataSource = self
        table.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: WATCH_LIST_ID, for: indexPath) as? watchlistCell{
            let moviem = movies[indexPath.row]
            cell.configure(viewModel: moviem)
            return cell
        } else{
        return watchlistCell()
        }
    }
    
    
    
    
    func fetchObject(){
        
   
      
        let refDB = Database.database().reference(withPath: "Watchlist")
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        refDB.child(uid).observeSingleEvent(of: .value) { snapshot in
            self.movies.removeAll()
            for child in snapshot.children.allObjects as! [DataSnapshot] {
                print(child)
                let Obj = child.value as? [String:Any]
                let title = Obj?["title"] ?? ""
                let overview = Obj?["overview"] ?? ""
                let rating = Obj?["rating"]  ?? ""
                let posterURL = Obj?["posterURL"]  ?? ""
           
            
                        
                let wlm = moviesModel(title: title as! String , overview: overview as! String, rating: rating as! String , posterURL: posterURL as! String)
                    self.movies.append(wlm)
                    print(self.movies)
                  
                }
                self.table.reloadData()
            
            }
        }
        
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = movies[indexPath.row]
        self.moviedetail = viewModel.self
      //  moviedetail = viewModel.self
        performSegue(withIdentifier: WATCH_TO_DETAIL, sender: nil)
        
    }
        
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let DetailVC = segue.destination as? MovieDetailVC{
          
            
            DetailVC.moviedetail = moviedetail.self
          //  print(sender as? Category != nil)
        }
        
    }
    }
    
    
    
    

