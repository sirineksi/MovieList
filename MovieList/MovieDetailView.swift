//
//  MovieDetailView.swift
//  MovieList
//
//  Created by ceksi on 12.09.2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack {
            Text("Film Adı: \(movie.movieName)")
            Text("Film Açıklaması: \(movie.movieDescription)" )
            Text("Imdb Paunı: \(movie.imdbScore)")
            Text("Yapım Yılı: \(movie.movieDate)")
        }
        .navigationTitle(movie.movieName)
    }
}


