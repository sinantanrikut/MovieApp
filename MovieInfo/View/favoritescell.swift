//
//  favoritescell.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 15.06.2022.
//  Copyright © 2022 Sinan Tanrıkut. All rights reserved.
//

import UIKit

class favoritescell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    
    
    func configure(viewModel: moviesModel) {
        movieTitle.text = viewModel.title
        let url = URL(string: viewModel.posterURL)
        movieImage.kf.setImage(with: url!)
    }


}
