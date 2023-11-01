//
//  SingleTicketView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/5/2566 BE.
//

import SwiftUI

struct SingleTicketView: View {
    @State var ticket: Ticket
    
    var body: some View {
        VStack { // Open VStack1
            VStack { // Open VStack2
                Image(ticket.movie)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
            } // Close VStack2
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 400, height: 350, alignment: .top)
            .mask(
                Image(ticket.movie)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            )
            Image("Barcode")
            Text(ticket.movie)
                .font(.custom("Futura", size: 24))
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text(ticket.cinema)
                .font(.custom("Futura", size: 20))
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("วันที่: \(ticket.date)")
                .font(.custom("Futura", size: 20))
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("เวลา: \(ticket.hour)")
                .font(.custom("Futura", size: 20))
                .fontWeight(.bold)
                .padding(.bottom, 1)
            Text("หมายเลขที่นั่ง: \(ticket.seat)")
                .font(.custom("Futura", size: 20))
                .fontWeight(.bold)
        } // Close VStack1
        .cornerRadius(20)
    }
}

struct SingleTicketView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTicketView(ticket: Ticket(id: "FN6Q2pVHIuI3M4gknw1p", movie: "เร็ว...แรงทะลุนรก 10", cinema: "ไอคอน เซเนคอนิค", date: "18.00 น.", hour: "30 พ.ค. 66 (อังคาร)", seat: "32"))
    }
}
