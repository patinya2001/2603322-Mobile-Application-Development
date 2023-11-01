//
//  MovieListView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var model = Model()
    @State var selection = "กรุณาเลือกโรงหนัง"
    let cinema = ["กรุณาเลือกโรงหนัง", "ไอคอน เซเนคอนิค", "พารากอน ซีนีเพล็กซ์", "พรอมานาด ซีนีเพล็กซ์", "เมกา ซีนีเพล็กซ์", "เวสต์เกต ซีนีเพล็กซ์"]
    
    var body: some View {
        NavigationStack {
            ZStack { // Open ZStack
                LinearGradient(gradient: Gradient(colors: [
                    Color.init(red: 238/255, green: 174/255, blue: 202/255),
                    Color.init(red: 202/255, green: 235/255, blue: 255/255)]),
                               startPoint: .top, endPoint: .trailing)
                VStack(alignment: .leading) { // Open VStack1
                    HStack { // Open HStack
                        Text("โรงหนัง: ")
                            .font(.custom("Futura", size: 24))
                            .fontWeight(.bold)
                        Picker("", selection: $selection) { // Open Picker
                            ForEach(cinema, id: \.self) { // Open ForEach
                                Text($0)
                            } // Close ForEach
                        } // Close Picker
                        .pickerStyle(.menu)
                    } // Close HStack
                    .offset(x: 20)
                    .offset(y: 10)
                    .padding(.top, 100)
                    .padding(.bottom, 20)
                    VStack { // Open VStack2
                        MovieScrollView(title: "กำลังฉาย", status: "on-going", selection: $selection)
                        MovieScrollView(title: "โปรแกรมหน้า", status: "coming soon", selection: $selection)
                            .padding(.top, 22)
                    } // Close VStack2
                } // Close VStack1
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar { // Open toolbar
                    ToolbarItem(placement: .principal) { // Open ToolbarItem
                        Text("รายการหนัง")
                            .font(.custom("Futura", size: 30))
                            .fontWeight(.bold)
                    } // Close ToolbarItem
                } // Close toolbar
            } // Close ZStack
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
