//
//  Event.swift
//  SquadMate
//
//  Created by Naol Basaye on 4/20/23.
//
import Foundation

struct Event: Identifiable{
    var id: UUID = UUID()
    var eventName: String
    var members: [User] = []
    var interests: [String] = []
    var eventCode: String
}
