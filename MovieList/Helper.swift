//
//  Helper.swift
//  MovieList
//
//  Created by ceksi on 13.09.2023.
//

import Foundation


class MovieStore: ObservableObject {
    @Published var movies: [Movie] = []
    
    //array a eleman ekler
    func addMovie(_ movie: Movie) {
        movies.append(movie)
    }
    
    // arrayden id ye göre eleman siler 
    func deleteMovie(_ movie: Movie) {
        movies.removeAll { $0.id == movie.id}
    }
    
    
}

func getCurrentYear() -> Int {
    let calender = Calendar.current
    let currentYear = calender.component(.year, from: Date())
    return currentYear
}
