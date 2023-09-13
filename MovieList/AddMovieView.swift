//
//  AddMovieView.swift
//  MovieList
//
//  Created by ceksi on 12.09.2023.
//

import SwiftUI

struct AddMovieView: View {
    
    @ObservedObject var movieStore: MovieStore
    @State private var newMovieName = ""
    @State private var newMovieDescription = ""
    @State private var newImdbScore = 0
    @State private var newMovieDate = 0
    
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var  presentationMode
    
    
    var body: some View {
        Form {
            Section(header: Text("Film Bilgileri")) {
                TextField("Film Adı", text: $newMovieName)
                TextField("Açıklama", text: $newMovieDescription)
                Stepper("IMDb Puanı: \(newImdbScore)", value: $newImdbScore, in: 0...10)
                Stepper("Yapım Yılı: \(newMovieDate)", value: $newMovieDate, in: 1900...getCurrentYear())
            }

            Section {
                //1- addMovie methodu çağırılır button tıklanınca
                Button(action: addMovie) {
                    Text("Ekle ")
                }
                //.disabled(isFromInvalid)
                
            }
            
            
        }
        .navigationTitle("Film Ekle")
        .alert(isPresented: $isAlertPresented, content: {
            Alert(
            title: Text("Film Eklendi"),
            message: Text(alertMessage),
            dismissButton: .default(Text("Tamam")) {
                print("Tamam butonu tıklandı")
                presentationMode.wrappedValue.dismiss()
                print("Liste sayfasına döndü")
            }
            )
        })
        
    }
    
    var isFromInvalid: Bool {
        print("isfrominvalid methodu çalıştı")
        return newMovieName.isEmpty || newMovieDescription.isEmpty
    }
    
    func addMovie() {
        //2- name ve açıklama boş ise bu mesaj çalışır
        guard isFromInvalid  == false else {
            alertMessage = "Lütfen tüm alanları doldurun."
            isAlertPresented = true
            // isalertpresented alert i boş ise açar
            return
            // return altındaki hiç bir kod çalışmaz
        }
        
        
        let newMovie = Movie(movieName: newMovieName, movieDescription: newMovieDescription, imdbScore: newImdbScore, movieDate: newMovieDate)
        
        //yeni film struct a eklenir
        
        movieStore.addMovie(newMovie)
        //movie store içindeki array a eleman eklenir add movie methodu çağırılır
        
        
        alertMessage = "\(newMovie.movieName) filmi eklendi! "
        print("Film eklendi")
        isAlertPresented = true
        print("Mesaj açıldı")
        clear()
        print("Elemanlar boşaltıldı")
        
    }
    
    func clear() {
        newMovieName = ""
        newMovieDescription = ""
        newImdbScore = 0
        newMovieDate = 0
    }
}








