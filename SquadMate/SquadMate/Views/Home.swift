//
//  HomeScreen.swift
//  SquadMate
//
//  Created by 이채린 on 2023/04/12.
//

import SwiftUI

struct HomeScreen: View {
    @EnvironmentObject var dataStore: DataStore
    
    @State var createEventSheetOpen: Bool = false
    @State var joingEventSheetOpen: Bool = false {
        didSet {
            if !joingEventSheetOpen {
                eventCode = ""
            }
        }
    }
    @State var navigateToLogin : Bool = false
    @State var eventCode: String = ""
    
    var body: some View {
        NavigationView {
            TabView {
                // Groups tab
                VStack{
                    let userGroups: [Group] = dataStore.groups.filter { group in
                        group.members.contains(where: { member in
                            member.id == dataStore.currentUser?.id
                        })
                    }
                    
                    List(userGroups) { group in
                        NavigationLink(destination: GroupHome(group: group)) {
                            VStack(alignment: .leading){
                                Text(group.interest)
                                    .fontWeight(.bold)
                                Text(group.name)
                                Text("(\(group.members.count)/\(group.maxNumberOfMembers))")
                                    .font(.caption)
                            }
                        }
                    }
                    .navigationTitle("Your Groups")
                }
                .tabItem {
                    Label("Groups", systemImage: "person.3.fill")
                }
                
                // Events tab
                VStack {
                    let userEvents: [Event] = dataStore.events.filter { event in
                        event.members.contains(where: { member in
                            member.id == dataStore.currentUser?.id
                        })
                    }
                    
                    List(userEvents) { event in
                        NavigationLink(destination: EventHome(event: event)) {
                            VStack(alignment: .leading){
                                Text(event.eventName)
                                    .bold(true)
                                Text("\(event.members.count) members")
                            }
                        }
                    }
                    .navigationTitle("Your Events")
                }
                .tabItem {
                    Label("Events", systemImage: "calendar")
                }
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button("Join Event") {
                        joingEventSheetOpen.toggle()
                    }
                }
                ToolbarItem (placement: .navigationBarLeading) {
                    Button(action: {
                        dataStore.currentUser = nil
                        navigateToLogin = true
                    }, label: {
                        Text("Logout")
                            .foregroundColor(.red)
                    })
                }
            }
            .sheet(isPresented: $joingEventSheetOpen) {
                VStack {
                    TextField("Event code", text: $eventCode)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                    HStack {
                        Button("Join event") {
                            dataStore.joinEvent(eventCode: eventCode)
                            joingEventSheetOpen = false}
                        .padding()
                        Button("Cancel") {
                            joingEventSheetOpen = false
                        }
                        .padding()
                        .foregroundColor(.red)
                    }
                }
            }
            .background(
                NavigationLink(
                    destination:
                        LoginView().navigationBarBackButtonHidden(true),
                    isActive:
                        $navigateToLogin,
                    label: {}
                )
                .hidden()
            )
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
