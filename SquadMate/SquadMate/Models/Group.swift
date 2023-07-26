import Foundation

struct Group: Identifiable{
    var id: UUID = UUID()
    var interest: String
    var name: String
    var maxNumberOfMembers: Int
    var event: Event
    var creator: User
    var members: [User]
}
