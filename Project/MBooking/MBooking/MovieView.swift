//
//  MovieView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var model = Model()
    @State var movie: Movie
    @State private var showSeat = false
    @Binding var selection: String
    @State var dateSelection = "กรุณาเลือกวันที่"
    @State var hourSelection = "กรุณาเลือกเวลา"
    let dateAndHour = ["26 พ.ค. 66 (ศุกร์)": ["12.00 น.", "14.00 น.", "16.00 น.", "18.00 น.", "20.00 น."], "27 พ.ค. 66 (เสาร์)": ["10.00 น.", "12.00 น.", "14.00 น.", "16.00 น.", "18.00 น.", "20.00 น."], "28 พ.ค. 66 (อาทิตย์)": ["10.00 น.", "12.00 น.", "14.00 น.", "16.00 น.", "18.00 น.", "20.00 น."], "29 พ.ค. 66 (จันทร์)": ["10.00 น.", "12.00 น.", "14.00 น.", "16.00 น.", "18.00 น.", "20.00 น."], "30 พ.ค. 66 (อังคาร)": ["10.00 น.", "12.00 น.", "14.00 น.", "16.00 น.", "18.00 น.", "20.00 น."]]
    
    init(movie: Movie, selection: Binding<String>) {
        self.movie = movie
        self._selection = selection
        model.getSeat()
    }
    
    var body: some View {
        ZStack { // Open ZStack
            LinearGradient(gradient: Gradient(colors: [
                Color.init(red: 238/255, green: 174/255, blue: 202/255),
                Color.init(red: 202/255, green: 235/255, blue: 255/255)]),
                           startPoint: .top, endPoint: .trailing)
            VStack(alignment: .leading) { // Open VStack1
                HStack(alignment: .top) { // Open HStack1
                    Image(movie.name)
                        .resizable()
                        .frame(width: 150, height: 195)
                        .cornerRadius(20)
                    VStack(alignment: .leading) { // Open VStack2
                        Text(movie.tag)
                            .padding(.bottom, 1)
                        HStack { // Open HStack
                            Image(systemName: "clock")
                            Text(movie.duration)
                        } // Close HStack
                    } // Close VStack2
                    .padding(.top, 10)
                } // Close HStack1
                .offset(x: 18)
                VideoView(videoID: movie.videoID)
                    .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3)
                    .padding(.horizontal, 20)
                if movie.status == "on-going" {
                    HStack { // Open HStack2
                        Text("โรงหนัง: ")
                            .font(.custom("Futura", size: 20))
                            .fontWeight(.bold)
                        Picker("กรุณาเลือกโรงหนัง", selection: $selection) { // Open Picker
                            ForEach(["กรุณาเลือกโรงหนัง"] + movie.cinemaName, id: \.self) { // Open ForEach
                                Text($0)
                            } // Close ForEach
                        } // Close Picker
                        .pickerStyle(.menu)
                        .offset(x: -15)
                    } // Close HStack2
                    .offset(x: 20)
                    .padding(.top, 10)
                    if selection != "กรุณาเลือกโรงหนัง" {
                        HStack { // Open HStack3
                            VStack(alignment: .leading) { // Open VStack2
                                HStack { // Open HStack4
                                    Text("วันที่: ")
                                        .font(.custom("Futura", size: 20))
                                        .fontWeight(.bold)
                                    Picker("", selection: $dateSelection) { // Open Picker
                                        ForEach(["กรุณาเลือกวันที่"] + Array(dateAndHour.keys).sorted(by: <), id: \.self) { // Open ForEach
                                            Text($0)
                                        } // Close ForEach
                                    } // Close Picker
                                    .pickerStyle(.menu)
                                    .offset(x: -15)
                                } // Close HStack4
                                HStack { // Open HStack5
                                    Text("เวลา: ")
                                        .font(.custom("Futura", size: 20))
                                        .fontWeight(.bold)
                                    Picker("", selection: $hourSelection) { // Open Picker
                                        ForEach(["กรุณาเลือกเวลา"] + (dateAndHour[dateSelection] ?? [] ), id: \.self) { // Open ForEach
                                            Text($0)
                                        } // Close ForEach
                                    } // Close Picker
                                    .pickerStyle(.menu)
                                    .offset(x: -15)
                                } // Close HStack5
                            } // Close VStack2
                            Spacer()
                            Button(action: {
                                self.showSeat = true
                            }) {
                                Text("เลือกที่นั่ง")
                                    .font(.custom("Futura", size: 16))
                                    .frame(width: 120, height: 60)
                                    .fontWeight(.bold)
                                    .background(.pink)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                            }
                            .fullScreenCover(isPresented: $showSeat) {
                                SeatView(seatList: model.seatList, name: movie.name, cinema: selection, date: dateSelection, hour: hourSelection)
                            }
                            .offset(x: (dateSelection != "กรุณาเลือกวันที่" && hourSelection != "กรุณาเลือกเวลา") ? 0 : 100)
                            .animation(.spring(), value: (dateSelection != "กรุณาเลือกวันที่" && hourSelection != "กรุณาเลือกเวลา"))
                        } // Close HStack3
                        .offset(x: 20)
                    }
                }
                else {
                    VStack(alignment: .center) {
                        Text("เร็วๆ นี้")
                            .font(.custom("Futura", size: 28))
                            .fontWeight(.bold)
                            .padding(.top, 50)
                            .offset(x: 154)
                    }
                }
                Spacer()
            } // Close VStack1
            .padding(.top, 110)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { // Open toolbar
                ToolbarItem(placement: .principal) { // Open ToolbarItem
                    Text(movie.name)
                        .font(.custom("Futura", size: 20))
                        .fontWeight(.bold)
                } // Close ToolbarItem
            } // Close toolbar
            .onAppear {
                model.getSeat()
            }
        } // Close ZStack
        .edgesIgnoringSafeArea(.all)
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: Movie(id: "VqOWMBvYkX0lG8kmbDiy", name: "เร็ว...แรงทะลุนรก 10", duration: "141 นาที", status: "on-going", videoID: "5GfBK30k24c", cinemaName: ["ไอคอน เซเนคอนิค", "เวสต์เกต ซีนีเพล็กซ์"], tag: "แอ็คชัน, อาชญากรรม"), selection: .constant("ไอคอน เซเนคอนิค"))
    }
}
