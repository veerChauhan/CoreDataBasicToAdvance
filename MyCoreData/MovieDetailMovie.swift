//
//  MovieDetailMovie.swift
//  MyCoreData
//
//  Created by Ravi Ranjan on 28/04/22.
//

import SwiftUI

struct MovieDetailMovie: View {
    let movie: Movie
    let coreDataManager: CoreDataManager
    @Binding var needsRefresh: Bool
    @State private var movieName: String = ""
    var body: some View {
        VStack {
            TextField(movie.title ?? "", text: $movieName)
                .textFieldStyle(.roundedBorder)
            Button("Update"){
                if !movieName.isEmpty {
                    movie.title = movieName
                    coreDataManager.updateMovie()
                    needsRefresh.toggle()
                }
            }
            
        }.padding()
            
    }
}

struct MovieDetailMovie_Previews: PreviewProvider {
    static var previews: some View {
        let coreDatamanager = CoreDataManager()
        let movie = Movie(context: coreDatamanager.persistanceContainer.viewContext)
        MovieDetailMovie(movie: movie, coreDataManager: coreDatamanager, needsRefresh: .constant(false))
    }
}
