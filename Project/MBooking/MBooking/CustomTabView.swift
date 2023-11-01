//
//  CustomTabView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        VStack { // Open VStack1
            HStack { // Open HStack
                ForEach(Tab.allCases, id: \.rawValue) { tab in // Open ForEach
                    Button { // Open Button
                        withAnimation(.easeInOut) { // Open withAnimation
                            currentTab = tab
                        } // Close withAnimation
                    } label: {
                        VStack { // Open VStack2
                            Image(systemName: tab.image)
                                .renderingMode(.template)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .font(.title2)
                            Text(tab.name)
                                .font(.custom("Futura", size: 16))
                                .foregroundColor(.white)
                        } // Close VStack2
                        .offset(y: currentTab == tab ? -8 : 0)
                    } // Close Buttom
                } // Close ForEach
            } // Close HStack
            .frame(maxWidth: .infinity)
        } // Close VStack1
        .frame(height: 20)
        .padding(.top, 26)
        .background(.ultraThinMaterial)
        .background(LinearGradient(colors: [Color.pink, Color.blue, Color.green], startPoint: .leading, endPoint: .trailing))
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(currentTab: .constant(.home))
    }
}
