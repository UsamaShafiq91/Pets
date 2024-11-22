//
//  UIComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var id: UUID { get }
    
    func render() -> AnyView
}
