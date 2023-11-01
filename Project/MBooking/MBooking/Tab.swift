//
//  Tab.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import Foundation

enum Tab: String, CaseIterable {
    case home = "Home"
    case ticket = "Ticket"
    
    var name: String {
        switch self {
        case .home:
            return "หน้าแรก"
        case .ticket:
            return "ตั๋วหนัง"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .ticket:
            return "ticket"
        }
    }
}
