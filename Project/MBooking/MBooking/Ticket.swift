//
//  Ticket.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 24/5/2566 BE.
//

import Foundation

struct Ticket: Identifiable, Hashable {
    var id: String
    var movie: String
    var cinema: String
    var date: String
    var hour: String
    var seat: String
}
