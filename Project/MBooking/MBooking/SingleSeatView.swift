//
//  SingleSeatView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/5/2566 BE.
//

import SwiftUI

struct SingleSeatView: View {
    @State var checkClick = false
    @State var color: Color = .gray
    @Binding var checkTap: Bool
    @State var selectSeat: String
    @State var isBooked: Bool
    @Binding var seatClick: [String]
    
    var body: some View {
        Button(action: {
            self.checkClick.toggle();
            if checkClick == false {
                self.color = .gray
                seatClick.removeAll(where: { $0 == selectSeat })
                if seatClick.count == 0 {
                    withAnimation(.spring()) {
                        self.checkTap = false
                    }
                }
            }
            else {
                self.color = .green
                seatClick.append(selectSeat)
                withAnimation(.spring()) {
                    self.checkTap = true
                }
            }
        }) {
            Image(systemName: "chair.lounge.fill")
                .font(.system(size: 22))
                .foregroundColor(color)
        }
        .disabled(isBooked)
        .onAppear {
            if isBooked == true {
                color = .red
            }
        }
    }
}

struct SingleSeatView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSeatView(checkTap: .constant(false), selectSeat: "11", isBooked: false, seatClick: .constant([]))
    }
}
