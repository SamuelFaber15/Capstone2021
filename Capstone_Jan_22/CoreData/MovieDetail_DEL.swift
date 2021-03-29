////
////  MovieDetail.swift
////  Capstone_Jan_22
////
////  Created by Ashleigh Koener on 3/24/21.
////
//


// KEEP THIS ALL DELETED
//import SwiftUI
//
//struct MovieDetail: View {
//
//    let movie: Movie
//    @State private var movieName: String = ""
//    let coreDM: CoreDataManager
//
//
//    var body: some View {
//        VStack{
//            TextField(movie.title ?? "", text: $movieName)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Button("Update") {
//                if !movieName.isEmpty {
//                    movie.title = movieName
//                }
//            }
//        }
//    }
//}
//
//struct MovieDetail_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let movie = Movie()
//        let coreDM = CoreDataManager()
//
//        MovieDetail(movie: movie, coreDM: CoreDataManager())
//    }
//}
