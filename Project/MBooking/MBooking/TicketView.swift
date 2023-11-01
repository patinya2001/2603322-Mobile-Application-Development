//
//  TicketView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct TicketView: View {
    @ObservedObject var model = Model()
    
    init() {
        model.getTicket()
    }
    
    var body: some View {
        ZStack { // Open ZStack
            LinearGradient(gradient: Gradient(colors: [
                Color.init(red: 238/255, green: 174/255, blue: 202/255),
                Color.init(red: 202/255, green: 235/255, blue: 255/255)]),
                           startPoint: .top, endPoint: .trailing)
                    if model.ticketList != [] {
                        VStack { // Open VStack1
                            Text("ตั๋วหนังของคุณ")
                                .font(.custom("Futura", size: 28))
                                .fontWeight(.black)
                            ScrollView(.horizontal, showsIndicators: false) { // Open ScrollView
                                HStack { // Open HStack
                                    ForEach(model.ticketList, id: \.self) { tickets in // Open ForEach
                                        SingleTicketView(ticket: tickets)
                                    } // Close ForEach
                                } // Close HStack
                            } // Close ScrollView
                        } // Close VStack1
                        .offset(y: -5)
                    }
                    else {
                        VStack { // Open VStack2
                            Text("ไม่พบตั๋วหนังของคุณ")
                                .font(.custom("Futura", size: 28))
                                .fontWeight(.black)
                        } // Close VStack2
                    }
        } // Close ZStack
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            model.getTicket()
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        TicketView()
    }
}
