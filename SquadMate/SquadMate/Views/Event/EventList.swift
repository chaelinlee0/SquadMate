import SwiftUI

struct EventList: View {
    @EnvironmentObject var dataStore: DataStore
    var events: [Event]
    
    var body: some View {
        NavigationStack {
            List(events) { event in
                NavigationLink(destination:GroupList()) {
                    Text(event.eventName)
                }
            }
            .navigationTitle("Event List")
        }
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(events: DataStore().events)
    }
}
