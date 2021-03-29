////
////  GoalsContentView.swift
////  Capstone_Jan_22
////
////  Created by Ashleigh Koener on 3/24/21.
////
//
import SwiftUI

struct GoalsView_Tut: View {
    
    let coreDM: CoreDataManager
    @State private var movieTitle: String = ""
    //NOT A GOOD IDEA TO USE STATE TO POPULATE DATA FrOM THRID PARTY CALL ^^
    @State private var movies: [Movie] = [Movie]()
    
    private func populateMovies() {
        movies = coreDM.getAllMovies()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter title", text: $movieTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save") {
                    coreDM.saveMovie(title: movieTitle)
                    populateMovies()
                }
                
//                List(movies, id: \.self) {movie in
//                    Text(movie.title ?? "")
//                }
                
                List{
                    
                    ForEach(movies, id: \.self) {movie in
                        Text(movie.title ?? "")
                    }.onDelete(perform: { indexSet in
                        indexSet.forEach { index in
                            let movie = movies[index]
                            //delete it using Core Data Manager
                            coreDM.deleteMovie(movie: movie)
                            populateMovies()
                        }
                    })
                }
                Spacer()
            }.padding()
            .navigationTitle("Movies")
            
            .onAppear(perform: {
                movies = coreDM.getAllMovies()
            })
        }
    }
}

struct GoalsView_Tut_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView_Tut(coreDM: CoreDataManager())
    }
}
