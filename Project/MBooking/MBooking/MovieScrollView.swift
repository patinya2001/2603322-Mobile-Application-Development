//
//  MovieScrollView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct MovieScrollView: View {
    @State var title: String
    @State var status: String
    @Binding var selection: String
    @ObservedObject var model = Model()
    
    init(title: String, status: String, selection: Binding<String>) {
        self._selection = selection
        self.title = title
        self.status = status
        model.getMovie()
    }
    
    var body: some View {
        VStack(alignment: .leading) { // Open VStack
            Text(title)
                .font(.custom("Futura", size: 28))
                .fontWeight(.black)
                .padding(.horizontal, 20)
            ScrollView(.horizontal, showsIndicators: false) { // Open ScrollView
                HStack { // Open HStack
                    ForEach(model.movieList, id: \.self) { movies in // Open ForEach
                        if movies.status == status {
                            if selection == "กรุณาเลือกโรงหนัง" {
                                NavigationLink(destination: MovieView(movie: movies, selection: $selection)) {
                                    Image(movies.name)
                                        .resizable()
                                        .frame(width: 150, height: 195)
                                        .cornerRadius(20)
                                        .padding(.trailing, 5)
                                }
                            }
                            else if movies.cinemaName.contains(selection) {
                                NavigationLink(destination: MovieView(movie: movies, selection: $selection)) {
                                    Image(movies.name)
                                        .resizable()
                                        .frame(width: 150, height: 195)
                                        .cornerRadius(20)
                                        .padding(.trailing, 5)
                                }
                            }
                        }
                    } // Close ForEach
                } // Close HStack
                .offset(x: 15)
                .padding(.trailing, 25)
            } // Close ScrollView
        } // Close VStack
    }
}

struct MovieScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MovieScrollView(title: "กำลังฉาย", status: "on-going", selection: .constant("กรุณาเลือกโรงหนัง"))
    }
}
