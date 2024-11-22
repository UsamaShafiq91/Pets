//
//  RatingComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation
import SwiftUI

struct RatingComponent: UIComponent {
    
    var id = UUID()
    
    let ratingModel: RatingUIModel
    
    func render() -> AnyView {
        HStack {
            ForEach(0..<5) { i in
                Image(systemName: i < ratingModel.rating ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.yellow)
            }
        }
        .padding()
        .toAnyView()
    }
    
    
}
