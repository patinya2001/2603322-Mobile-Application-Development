//
//  SeatView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/5/2566 BE.
//

import SwiftUI
import Firebase

struct SeatView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showingAlert = false
    @State private var checkTap = false
    @ObservedObject var model = Model()
    @State var seatList: [Seat]
    @State var name: String
    @State var cinema: String
    @State var date: String
    @State var hour: String
    @State var seatClick = [String]()
    
    func checkBooked(selectSeat: String) -> Bool {
        var isBooked = false
        for seat in seatList {
            if selectSeat == seat.id {
                if seat.status == "booked" {
                    isBooked = true
                    break
                }
            }
        }
        return isBooked
    }
    
    var body: some View {
        ZStack { // Open ZStack
            LinearGradient(gradient: Gradient(colors: [
                Color.init(red: 238/255, green: 174/255, blue: 202/255),
                Color.init(red: 202/255, green: 235/255, blue: 255/255)]),
                           startPoint: .top, endPoint: .trailing)
            VStack { // Open VStack1
                VStack { // Open VStack2
                    Button(action: {dismiss()}) {
                        Image(systemName: "arrow.left")
                            .font(.custom("Futura", size: 16))
                            .fontWeight(.bold)
                            .frame(width: 50, height: 50)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                    }
                    .offset(x: -145)
                    .offset(y: -35)
                    HStack { // Open HStack1
                        Image(name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140, height: 150)
                            .cornerRadius(20)
                            .offset(y: -28)
                        VStack(alignment: .leading) { // Open VStack3
                            Text(name)
                                .font(.custom("Futura", size: 20))
                            Text(cinema)
                                .font(.custom("Futura", size: 20))
                                .padding(.bottom, 1)
                            Text("วันที่: \(date)")
                                .font(.custom("Futura", size: 20))
                            Text("เวลา: \(hour)")
                                .font(.custom("Futura", size: 20))
                        } // Close VStack3
                        .offset(y: -50)
                    } // Close HStack1
                } // Close VStack2
                .offset(y: 50)
                .padding(.top, 40)
                HStack { // Open HStack2
                    Image("Front Seat")
                    Text("หน้าจอ")
                        .font(.custom("Futura", size: 16))
                    Image("Front Seat")
                } // Close HStack2
                .offset(y: -20)
                HStack { // Open HStack3
                    ForEach(0...9, id: \.self) { seat1 in // Open ForEach1
                        VStack { // Open VStack4
                            ForEach(0...4, id: \.self) { seat2 in // Open ForEach2
                                SingleSeatView(checkTap: $checkTap, selectSeat: String(seat2) + String(seat1), isBooked: checkBooked(selectSeat: String(seat2) + String(seat1)), seatClick: $seatClick)
                                    .padding(.all, 1)
                            } // Close ForEach2
                        } // Close VStack4
                    } // Close ForEach1
                } // Close HStack3
                .offset(y: -60)
                .padding(.bottom, 20)
                HStack { // Open HStack3
                    HStack { // Open HStack4
                        Image(systemName: "chair.lounge.fill")
                            .foregroundColor(.gray)
                        Text(": ว่าง")
                            .font(.custom("Futura", size: 16))
                            .offset(x: -6)
                    } // Close HStack4
                    HStack { // Open HStack5
                        Image(systemName: "chair.lounge.fill")
                            .foregroundColor(.red)
                        Text(": ไม่ว่าง")
                            .font(.custom("Futura", size: 16))
                            .offset(x: -6)
                    } // Close HStack5
                    .padding(.leading)
                    HStack { // Open HStack6
                        Image(systemName: "chair.lounge.fill")
                            .foregroundColor(.green)
                        Text(": เลือกแล้ว")
                            .font(.custom("Futura", size: 16))
                            .offset(x: -6)
                    } // Close HStack6
                    .padding(.leading)
                } // Close HStack3
                .offset(y: -60)
                HStack { // Open HStack7
                    Button(action: {
                        self.showingAlert.toggle();
                        model.updateSeat(seatID: seatClick);
                        model.addTicket(movie: name, cinema: cinema, date: date, hour: hour, seatID: seatClick)
                    }) {
                        Text("จองเลย")
                            .font(.custom("Futura", size: 24))
                            .fontWeight(.bold)
                            .frame(width: 140, height: 70)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    .alert("การจองเสร็จสิ้น", isPresented: $showingAlert) {
                        Button("โอเค", role: .cancel) {
                            dismiss()
                        }
                    }
                } // Close HStack7
                .clipped()
                .frame(width: 500, height: 150)
                .background(LinearGradient(gradient: Gradient(colors: [
                    Color.init(red: 9/255, green: 82/255, blue: 255/255),
                    Color.init(red: 211/255, green: 174/255, blue: 238/255)]),
                               startPoint: .leading, endPoint: .bottom))
                .offset(y: checkTap ? 22 : 200)
            } // Close VStack1
            .padding(.top, 20)
        } // Close ZStack
        .edgesIgnoringSafeArea(.all)
    }
}

struct SeatView_Previews: PreviewProvider {
    static var previews: some View {
        SeatView(seatList: [], name: "ทรานส์ฟอร์เมอร์ส", cinema: "ไอคอน เซเนคอนิค", date: "26 พ.ค. 66 (ศุกร์)", hour: "12.00 น.")
    }
}
