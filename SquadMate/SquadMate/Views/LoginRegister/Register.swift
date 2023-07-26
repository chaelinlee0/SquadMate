//
//  Register.swift
//  SquadMate
//
//  Created by 宋乐雪 on 4/5/23.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var body: some View {
        NavigationView{
            VStack(alignment:.center) {
                Spacer().frame(height: 130)
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Spacer().frame(height: 50)
                
                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Register").padding()
                        .foregroundColor(.white)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                }
                Spacer()
                HStack{
                    Text("Already have an account?").font(Font.custom("HelveticaNeue-Bold", size: 16))
                    NavigationLink(destination: LoginView()) {
                        Text("Log in").font(Font.custom("HelveticaNeue-Bold", size: 16))
                        
                    }
                }
            }
            .navigationBarTitle(Text("Register")
                .foregroundColor(.blue),
                displayMode: .inline)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
