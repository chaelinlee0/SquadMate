//
//  GroupList.swift
//  SquadMate
//
//  Created by Naol Basaye on 4/20/23.
//

import SwiftUI

struct GroupList: View {
    @EnvironmentObject var dataStore: DataStore
    
    var interest: String
    var event: Event
    
    @State var createGroupSheetOpen: Bool = false
    @State var newGroupName: String = ""
    @State var maxNumberOfUser: Int = 1
    
    var body: some View {
        VStack {
            let groups: [Group] = dataStore.groups.filter { group in
                (group.event.id == event.id) && (group.interest == interest)
            }
            
            List(groups) { group in
                NavigationLink(destination: GroupHome(group: group)) {
                    VStack(alignment: .leading){
                        Text(group.interest)
                        Text(group.name)
                        Text("\(group.members.count)/\(group.maxNumberOfMembers)")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                Button("Create Group") {
                    createGroupSheetOpen.toggle()
                }
            }
        }
        .sheet(isPresented: $createGroupSheetOpen) {
            VStack {
                HStack {
                    Text("Group name")
                    TextField("Group name", text: $newGroupName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                }
                HStack {
                    Text("# Members")
                    TextField("Max number of members", value: $maxNumberOfUser, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                }
                HStack {
                    Button("Create group") {
                        dataStore.createGroup(event: event, interest: interest, groupName: newGroupName, maxNumberOfMembers: maxNumberOfUser)
                        createGroupSheetOpen = false
                    }
                    .disabled(newGroupName.isEmpty || maxNumberOfUser < 1)
                    .padding()
                    
                    Button("Cancel") {
                        createGroupSheetOpen = false}
                    .padding()
                    .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
}

struct GroupList_Previews: PreviewProvider {
    static var previews: some View {
        GroupList(
            interest: DataStore().events[0].interests[0],
            event: DataStore().events[0]
        )
    }
}
