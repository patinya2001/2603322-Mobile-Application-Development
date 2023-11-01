//
//  SplashView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            LoginView()
        }
        else {
            ZStack { // Open ZStack
                LinearGradient(gradient: Gradient(colors: [
                    Color.init(red: 238/255, green: 174/255, blue: 202/255),
                    Color.init(red: 202/255, green: 235/255, blue: 255/255)]),
                               startPoint: .top, endPoint: .trailing)
                VStack(alignment: .center) { // Open VStack
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                } // Close VStack
                .onAppear { // Open onAppear
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        self.isActive = true
                    }
                } // Close onAppear
            } // Close ZStack
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
