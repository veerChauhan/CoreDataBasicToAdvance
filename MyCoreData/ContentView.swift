//
//  ContentView.swift
//  MyCoreData
//
//  Created by Ravi Ranjan on 28/04/22.
//

import SwiftUI

struct ContentView: View {
    let coreDataManager: CoreDataManager
    @State  private var movieName: String = ""
    @State private var movies:[Movie]  = [Movie]()

    private func populateMovies() {
        movies = coreDataManager.getAllMovies()
    }
    var body: some View {
        VStack {
            TextField("Enter movie Name", text: $movieName)
                .textFieldStyle(.roundedBorder)
            Button("Save") {
                coreDataManager.saveMovie(title: movieName)
                populateMovies()
            }
            
            
            List {
                ForEach (movies, id: \.self) {
                    movie in
                    Text(movie.title ?? "")
                }.onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        coreDataManager.deleteMoview(movie: movie)
                        populateMovies()
                    }
                    
                }
            }
            Spacer()
        }.padding()
            .onAppear {
                populateMovies()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
