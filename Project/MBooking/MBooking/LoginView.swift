//
//  LoginView.swift
//  MBooking
//
//  Created by ปฏิญญา จารุอริยานนท์ on 22/5/2566 BE.
//

import SwiftUI

struct LoginView: View {
    @State private var is_authenticated = false
    @State var userName : String = ""
    @State var password : String = ""
    @State var error : String = ""
    
    var body: some View {
        if is_authenticated {
            MainView()
        }
        else {
            ZStack { // Open ZStack
                LinearGradient(gradient: Gradient(colors: [
                    Color.init(red: 238/255, green: 174/255, blue: 202/255),
                    Color.init(red: 202/255, green: 235/255, blue: 255/255)]),
                               startPoint: .top, endPoint: .trailing)
                VStack { // Open VStack
                    Text("กรุณาเข้าสู่ระบบ")
                        .padding(.bottom, 26)
                        .font(.custom("Futura", size: 30))
                        .fontWeight(.black)
                    TextField("ชื่อผู้ใช้", text: $userName)
                        .textInputAutocapitalization(.never)
                        .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color.white)
                        .cornerRadius(10)
                        .offset(y: -5)
                    SecureField("รหัสผ่าน", text: $password)
                        .padding(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .background(Color.white)
                        .cornerRadius(10)
                        .keyboardType(.asciiCapable)
                    Text(error)
                        .font(.custom("Futura", size: 14))
                        .foregroundColor(.red)
                        .padding(.top, 10)
                    Button(action : { // Open Button
                        if userName == "admin" && password == "admin" {
                            self.is_authenticated = true
                        }
                        else {
                            error = "* ชื่อผู้ใช้หรือรหัสผ่านผิดพลาด"
                        }
                    }) {
                        Text("เข้าสู่ระบบ")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.top, 20)
                    } // Close Button
                } // Close VStack
                .padding(.horizontal, 40)
            } // Close ZStack
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
