//
//  MovieListView.swift
//  MovieList
//
//  Created by ceksi on 12.09.2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var movieStore: MovieStore
    //movie store çağrılır
    @State private var isDeleteAlertPresented = false
    @State private var movieToDelete: Movie? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movieStore.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        HStack {
                            Text(movie.movieName)
                            Spacer()
                        }
                    }
                }
                .onDelete(perform: deleteMovie)
                            }
           
        }
        .navigationTitle("Filmler")
        .alert(isPresented: $isDeleteAlertPresented) {
            Alert(
                title: Text("Film Silme"),
                message: Text("Bu Filmi silmek istediğinize emin misiniz?"),
                primaryButton: .destructive(Text("Sil"), action: confirmDelete),
                secondaryButton: .cancel()
            )
        }
    }



    func deleteMovie(at offsets: IndexSet) {
       
       
        if let index = offsets.first, movieStore.movies.indices.contains(index) {
            
            print("offset first: \(index) ")
            
            let movie = movieStore.movies[index]
            
            print("bulunan film: \(movie)")
            
            
            movieToDelete = movie
            isDeleteAlertPresented.toggle()
        }
    }
    
    func confirmDelete() {
            if let sirin = movieToDelete {
                movieStore.deleteMovie(sirin)
                movieToDelete = nil
               
            }
        }
    
}
