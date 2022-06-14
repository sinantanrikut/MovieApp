//
//  MovieDetailVC.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 14.06.2022.
//  Copyright © 2022 Sinan Tanrıkut. All rights reserved.
//

import UIKit
import Kingfisher
class MovieDetailVC: UIViewController {
    @IBOutlet weak var imagebox: UIImageView!
    var moviedetail:moviesModel!
    @IBOutlet weak var titlelbl: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var overviewtitle: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        titlelbl.text = moviedetail.title 
        
        overviewtitle.text = moviedetail.overview
        rating.text = moviedetail.rating
        print(rating)
        let url = URL(string: moviedetail.posterURL)
        imagebox.kf.setImage(with: url!)
        // Do any additional setup after loading the view.
    }
    


}
