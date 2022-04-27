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
    @State private var needsRefresh: Bool = false

    private func populateMovies() {
        movies = coreDataManager.getAllMovies()
    }
    var body: some View {
        NavigationView {
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
                    NavigationLink(destination: MovieDetailMovie(movie: movie,coreDataManager: coreDataManager, needsRefresh:$needsRefresh)) {
                        Text(movie.title ?? "")
                    }
                }.onDelete { indexSet in
                    indexSet.forEach { index in
                        let movie = movies[index]
                        coreDataManager.deleteMoview(movie: movie)
                        populateMovies()
                    }
                    
                }
            }.listStyle(.plain)
                .accentColor(needsRefresh ? .white : .red)
            Spacer()
        }.padding()
            .onAppear {
                populateMovies()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(coreDataManager: CoreDataManager())
    }
}
