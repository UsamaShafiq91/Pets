//
//  CarouselUIModel.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation

struct CarouselRowUIModel: Decodable, Identifiable {
    
    let id = UUID()
    let petId: Int
    let imageUrl: URL
}

struct CarouselUIModel: Decodable {

    let items: [CarouselRowUIModel]
    let action: Action
}
