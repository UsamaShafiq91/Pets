//
//  Action.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation

enum ActionType: String, Decodable {
    case sheet
    case push
}

enum Route: String, Decodable {
    case petDetail
}

struct Action: Decodable {
    
    let type: ActionType
    let destination: Route
}
