//
//  CarouselComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    
    let carouselModel: CarouselUIModel
    
    var id = UUID()
    
    func render() -> AnyView {
        ScrollView(.horizontal) {
            HStack {
                ForEach(carouselModel.items, id: \.id) { item in
                    Navigator.perform(action: carouselModel.action, 
                                      payload: item,
                                      content: {
                        AsyncImage(url: item.imageUrl,
                                   content: { image in
                            image.resizable()
                                .frame(width: 200, height: 200)
                            
                        }, placeholder: {
                            ProgressView()
                        })
                    })
                    
                }
            }
            
        }
        .toAnyView()
    }
    
    
    
}
