//
//  MovieListApp.swift
//  MovieList
//
//  Created by ceksi on 12.09.2023.
//

import SwiftUI

@main
struct MovieListApp: App {
    
    @StateObject private var movieStore = MovieStore()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MovieListView(movieStore: movieStore)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: AddMovieView(movieStore: movieStore)) {
                                Text("Ekle")
                            }
                        }
                        
                    }
            }
        }
    }
}
