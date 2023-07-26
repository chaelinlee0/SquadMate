//
//  DataStore.swift
//  SquadMate
//
//  Created by Naol Basaye on 4/17/23.
//

import Foundation


class DataStore: ObservableObject {
    @Published var currentUser: User? = nil
    @Published var users: [User] = []
    @Published var events: [Event] = []
    @Published var groups: [Group] = []
    
    init () {
        self.users = [
            User(name: "Alice", password: "a", email: "a", createdEventCodes: ["alice1", "alice2"]),
            User(name: "Bob", password: "password123", email: "bob@example.com", createdEventCodes: []),
            User(name: "Charlie", password: "secret_password", email: "charlie@example.com", createdEventCodes: []),
            User(name: "David", password: "my_password_456", email: "david@example.com", createdEventCodes: []),
            User(name: "Emily", password: "abc123", email: "emily@example.com", createdEventCodes: ["emily1"]),
            User(name: "Frank", password: "password456", email: "frank@example.com", createdEventCodes: []),
            User(name: "Grace", password: "my_secret_password", email: "grace@example.com", createdEventCodes: []),
            User(name: "Henry", password: "password789", email: "henry@example.com", createdEventCodes: []),
            User(name: "Isabel", password: "qwerty123", email: "isabel@example.com", createdEventCodes: []),
            User(name: "Jack", password: "my_password_abc", email: "jack@example.com", createdEventCodes: ["jack1", "jack2"])
        ]
        self.events = [
            Event(eventName: "Conference on Artificial Intelligence", members: [users[0], users[1], users[2], users[5], users[7], users[9]], interests: ["Machine Learning", "Natural Language Processing", "Computer Vision"], eventCode: "alice1"),
            Event(eventName: "Blockchain Technology Summit", members: [users[3], users[4], users[5], users[6], users[7]], interests: ["Cryptocurrency", "Decentralized Applications", "Smart Contracts"], eventCode: "emily1"),
            Event(eventName: "Data Science Symposium", members: [users[8], users[9]], interests: ["Data Mining", "Statistical Analysis", "Big Data"], eventCode: "jack2")
        ]
        self.groups = [
            Group(interest: "Natural Language Processing", name: "AI Innovators", maxNumberOfMembers: 10, event: events[0], creator: users[0], members: [users[0], users[1], users[2]]),
            Group(interest: "Smart Contracts", name: "Blockchain Experts", maxNumberOfMembers: 15, event: events[1], creator: users[3], members: [users[3], users[4], users[5], users[6], users[7]]),
            Group(interest: "Statistical Analysis", name: "Data Science Enthusiasts", maxNumberOfMembers: 8, event: events[2], creator: users[8], members: [users[8], users[9]]),
            Group(interest: "Computer Vision", name: "AI Researchers", maxNumberOfMembers: 12, event: events[0], creator: users[2], members: [users[2], users[5], users[7], users[9]])
        ]
    }
    
    func joinEvent(eventCode: String) {
        guard let currentUser = currentUser else {
            return
        }
        
        if let eventIndex = events.firstIndex(where: { $0.eventCode == eventCode }) {
            if !events[eventIndex].members.contains(where: { $0.id == currentUser.id }) {
                events[eventIndex].members.append(currentUser)
            }
        }
    }
    
    
    func addInterest(event: Event, newInterest: String) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            if !events[index].interests.contains(newInterest) {
                events[index].interests.append(newInterest)
            }
        }
    }
    
    func joinGroup(group: Group) {
        if let index = groups.firstIndex(where: { $0.id == group.id }) {
            groups[index].members.append(currentUser!)
        }
    }
    
    func leaveGroup(group: Group) {
        if let index = groups.firstIndex(where: { $0.id == group.id }) {
            if let userIndex = groups[index].members.firstIndex(where: { $0.id == currentUser?.id}) {
                groups[index].members.remove(at: userIndex)
            }
        }
    }
    
    func createGroup(event: Event, interest:String, groupName: String, maxNumberOfMembers: Int) {
        groups.append(
            Group(interest: interest, name: groupName, maxNumberOfMembers: maxNumberOfMembers, event: event, creator: currentUser!, members: [currentUser!])
        )
    }
    
}
