//
//  Movie.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import Foundation

struct Movie: Identifiable, Hashable {
    var id: String
    var name: String
    var duration: String
    var status: String
    var videoID: String
    var cinemaName: [String]
    var tag: String
}
