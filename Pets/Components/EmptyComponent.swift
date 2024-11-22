//
//  EmptyComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation
import SwiftUI

struct EmptyComponent: UIComponent {
    
    var id = UUID()
    
    func render() -> AnyView {
        EmptyView()
            .toAnyView()
    }
}
