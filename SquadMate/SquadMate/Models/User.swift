//
//  User.swift
//  SquadMate
//
//  Created by Naol Basaye on 4/17/23.
//

import Foundation

struct User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var password: String // TODO: change this when using the new login with Firebase
    var email: String // Unique
    var createdEventCodes: [String]
}
