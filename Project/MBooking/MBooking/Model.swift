//
//  Model.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import Foundation
import Firebase

class Model: ObservableObject {
    @Published var movieList = [Movie]()
    @Published var cinemaList = [Cinema]()
    @Published var ticketList = [Ticket]()
    @Published var seatList = [Seat]()
    
    func addTicket(movie: String, cinema: String, date: String, hour: String, seatID: [String]) {
        let db = Firestore.firestore()
        for seat in seatID {
            db.collection("Ticket").addDocument(data: ["movie": movie, "cinema": cinema, "date": date, "hour": hour, "seat": seat])
        }
    }
    
    func updateSeat(seatID: [String]) {
        let db = Firestore.firestore()
        for seat in seatID {
            db.collection("Seat").document(seat).setData(["status": "booked"])
        }
    }
    
    func getMovie() {
        let db = Firestore.firestore()
        db.collection("Movie").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.movieList = snapshot.documents.map { data in
                            return Movie(id: data.documentID, name: data["name"] as? String ?? "", duration: data["duration"] as? String ?? "", status: data["status"] as? String ?? "", videoID: data["videoID"] as? String ?? "", cinemaName: data["cinema"] as? [String] ?? [], tag: data["tag"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
    func getCinema() {
        let db = Firestore.firestore()
        db.collection("Cinema").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.cinemaList = snapshot.documents.map { data in
                            return Cinema(id: data.documentID, name: data["name"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
    func getTicket() {
        let db = Firestore.firestore()
        db.collection("Ticket").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.ticketList = snapshot.documents.map { data in
                            return Ticket(id: data.documentID, movie: data["movie"] as? String ?? "", cinema: data["cinema"] as? String ?? "", date: data["date"] as? String ?? "", hour: data["hour"] as? String ?? "", seat: data["seat"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
    func getSeat() {
        let db = Firestore.firestore()
        db.collection("Seat").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.seatList = snapshot.documents.map { data in
                            return Seat(id: data.documentID, status: data["status"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
}
