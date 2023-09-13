//
//  Model.swift
//  MovieList
//
//  Created by ceksi on 12.09.2023.
//

import Foundation

struct Movie : Identifiable {
    
    let id =  UUID()
    let movieName: String
    let movieDescription: String
    let imdbScore: Int
    let movieDate: Int
   
  
}



