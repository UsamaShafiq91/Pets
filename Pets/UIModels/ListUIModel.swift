//
//  ListUIModel.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation

struct ListRowUIModel: Decodable {
    
    let id: Int
    let title: String
    let subTitle: String?
    let imageUrl: URL?
    let description: String?
}

struct ListUIModel: Decodable {
    
    let rows: [ListRowUIModel]
    let action: Action
}
