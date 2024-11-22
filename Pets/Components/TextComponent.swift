//
//  TextComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation
import SwiftUI

struct TextComponent: UIComponent {
    
    let textModel: TextUIModel
    
    var id = UUID()
    
    func render() -> AnyView {
        Text(textModel.text)
            .padding()
            .toAnyView()
    }
}
