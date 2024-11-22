//
//  FeaturedImageComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    
    let featuredImageModel: FeaturedImageUIModel
    
    var id = UUID()
    
    func render() -> AnyView {
        AsyncImage(url: featuredImageModel.imageUrl,
                   content: { image in
            image
                .resizable()
                .scaledToFill()
        }, placeholder: {
            ProgressView()
        })
        .toAnyView()
    }
    
    
}
