//
//  EventHome.swift
//  SquadMate
//
//  Created by Naol Basaye on 4/20/23.
//

import SwiftUI

struct EventHome: View {
    @EnvironmentObject var dataStore: DataStore
    
    var event: Event
    
    @State var createInterestSheetOpen: Bool = false
    @State var newInterest: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                List(event.interests, id:\.self) { interest in
                    NavigationLink(destination: GroupList(interest: interest, event: event)) {
                        VStack{
                            Text(interest)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button("Create Interest") {
                        createInterestSheetOpen.toggle()
                    }
                }
            }
            .sheet(isPresented: $createInterestSheetOpen) {
                VStack {
                    Text("Create new interest ")
                    TextField("Event name", text: $newInterest)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                    HStack {
                        Button("Create interest") {
                            dataStore.addInterest(event: event, newInterest: newInterest)
                            createInterestSheetOpen = false
                        }
                        .padding()
                        .disabled(newInterest.isEmpty)
                        Button("Cancel") {
                            createInterestSheetOpen = false}
                        .padding()
                        .foregroundColor(.red)
                    }
                }
                .padding()
            }
        }
    }
}

struct EventHome_Previews: PreviewProvider {
    static var previews: some View {
        EventHome(event: DataStore().events[0])
    }
}
