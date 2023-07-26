//
//  Login.swift
//  SquadMate
//
//  Created by 宋乐雪 on 4/5/23.
//

import Foundation
import SwiftUI

struct LoginView: View {
    @EnvironmentObject var dataStore: DataStore
    
    @State var errorMessage: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var showAlert = false
    @State var loginSuccesful: Bool = false
    @State private var navigateToHome: Bool = false
    @State var registerSheetOpen: Bool = false
    @State var registerName: String = ""
    @State var registerEmail: String = ""
    @State var registerPassword: String = ""
    @State var registerConfirmPassword: String = ""
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                VStack {
                    VStack {
                        HStack {
                            Text("Welcome Mate")
                            Image(systemName: "smiley")
                                .foregroundColor(.accentColor)
                        }
                        Text("Login! the Sqad is waiting")
                    }
                    .padding()
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .onChange(of: email) { _ in
                            errorMessage = ""
                        }
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: password) { _ in
                            errorMessage = ""
                        }
                    
                    Text(errorMessage.isEmpty ? "" : "\(errorMessage)")
                        .foregroundColor(Color.red)
                        .padding()
                    
                    NavigationLink(destination: HomeScreen().navigationBarBackButtonHidden(true), isActive: $navigateToHome) {
                        Button("Log in") {
                            login()
                            if loginSuccesful {
                                navigateToHome = true
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
                
                
                Spacer()
                HStack{
                    Text("Haven't had an account?")
                    Button("Register") {
                        registerSheetOpen.toggle()
                    }
                }
            }
            .padding()
            .sheet(isPresented: $registerSheetOpen) {
                VStack {
                    Spacer()
                    TextField("Name", text: $registerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: registerName) { _ in
                            errorMessage = ""
                        }
                        .disableAutocorrection(true)
                    
                    TextField("Email", text: $registerEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .onChange(of: registerEmail) { _ in
                            errorMessage = ""
                        }
                    
                    SecureField("Password", text: $registerPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .onChange(of: registerPassword) { _ in
                            errorMessage = ""
                        }
                    
                    SecureField("Confirm Password", text: $registerConfirmPassword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .onChange(of: registerConfirmPassword) { _ in
                            errorMessage = ""
                        }
                    
                    Text(errorMessage.isEmpty ? "" : "\(errorMessage)")
                        .foregroundColor(Color.red)
                    
                    Button("Register") {
                        register()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Spacer()
                    HStack{
                        Text("Already have an account?")
                        Button("Login") {
                            registerSheetOpen.toggle()
                        }
                    }
                }
                .padding()
            }
        }
        
    }
    
    func login() {
        if let userIndex = dataStore.users.firstIndex(where: { ($0.email == email) && ($0.password == password) }) {
            dataStore.currentUser = dataStore.users[userIndex]
            loginSuccesful = true
        }
        else {
            errorMessage = "Email/Password doesnot match"
        }
        print(errorMessage)
    }
    
    func register() {
        if ((registerEmail != "") && (registerName != "")) {
            if (registerPassword != "") {
                if (registerPassword == registerConfirmPassword) {
                    dataStore.users.append(
                        User(name: registerName, password: registerPassword, email: registerEmail, createdEventCodes: [])
                    )
                    registerSheetOpen.toggle()
                }
                else {
                    errorMessage = "Passwords do not match"
                }
            }
            else {
                errorMessage = "Invalid password"
            }
        }
        else {
            errorMessage = "Email or Name invalid"
        }
        print(errorMessage)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
