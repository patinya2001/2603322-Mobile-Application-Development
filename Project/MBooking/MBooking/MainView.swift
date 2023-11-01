//
//  MainView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct MainView: View {
    @State var currentTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack { // Open VStack
            TabView(selection: $currentTab) { // Open TabView
                MovieListView()
                    .tag(Tab.home)
                TicketView()
                    .tag(Tab.ticket)
            } // Close TabView
            CustomTabView(currentTab: $currentTab)
                .offset(y: -30)
        } // Close VStack
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
