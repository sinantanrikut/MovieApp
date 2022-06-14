//
//  Moviemodel.swift
//  MovieInfo
//
//  Created by Sinan Tanrıkut on 14.06.2022.
//  Copyright © 2022 Sinan Tanrıkut. All rights reserved.
//

import Foundation
// Places entity
struct moviesModel{
    private(set) public var title:String
    private(set) public var overview:String
    private(set) public var posterURL:String
    private(set) public var rating:String


    
    init(title:String, overview:String, rating:String, posterURL:String){
        self.title = title
        self.overview = overview
        self.posterURL = posterURL
        self.rating = rating

    }
}
