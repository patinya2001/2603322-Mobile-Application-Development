//
//  MBookingApp.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI
import Firebase

@main
struct MBookingApp: App {
     
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
