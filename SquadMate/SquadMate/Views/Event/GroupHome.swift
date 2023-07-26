
import SwiftUI

struct GroupHome: View {
    @EnvironmentObject var dataStore: DataStore
    @State private var navigateToHome: Bool = false
    
    var group: Group
    var userInGroup: Bool {
        if let currentUser = dataStore.currentUser {
            return group.members.contains(where: { $0.id == currentUser.id })
        }
        return false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment:.leading) {
                    Text("Interest \(group.interest)")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding([.bottom, .top], 10)
                    Text("\(group.event.eventName) event")
                    
                    Text("Created by \(group.creator.name)")
                    Text("\(group.members.count)/\(group.maxNumberOfMembers) members")
                    
                }
                Spacer()
                VStack {
                    Text("Members")
                        .font(.headline)
                    ForEach(group.members) { member in
                        Text(member.name)
                    }
                }
                Spacer()
                VStack {
                    Button(userInGroup ? "Leave group" : "Join group") {
                        if userInGroup {
                            dataStore.leaveGroup(group: group)
                        } else {
                            dataStore.joinGroup(group: group)
                        }
                    }
                    .padding()
                    .foregroundColor(userInGroup ? .red : .accentColor)
                }
            }
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {
                    navigateToHome = true
                }, label: {
                    Image(systemName: "house")
                })
            }
        }
        .navigationBarTitle(group.name)
        .background(
            NavigationLink(
                destination:
                    HomeScreen().navigationBarBackButtonHidden(true),
                isActive:
                    $navigateToHome,
                label: {}
            )
            .hidden()
        )
    }
}

struct GroupHome_Previews: PreviewProvider {
    static var previews: some View {
        GroupHome(group: DataStore().groups[0])
    }
}
