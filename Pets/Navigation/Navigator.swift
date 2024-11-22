//
//  Navigator.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation
import SwiftUI

struct SheetView<V: View>: View {
    
    @State private var isPresented: Bool = false
    let content: () -> V
    let destination: AnyView
    
    var body: some View {
        content()
            .onTapGesture {
                isPresented = true
            }
            .sheet(isPresented: $isPresented, content: {
                destination
            })
    }
}

class Navigator {
    
    static func perform<V: View>(action: Action, payload: Any? = nil,content: @escaping () -> V) -> AnyView {
        var destination: AnyView!
        
        switch action.destination {
        case .petDetail:
            if let payload = payload as? CarouselRowUIModel {
                destination = PetDetailScreen(petId: payload.petId)
                    .toAnyView()
            }
            else if let payload = payload as? ListRowUIModel {
                destination = PetDetailScreen(petId: payload.id)
                    .toAnyView()
            }
            else {
                destination = EmptyView().toAnyView()
            }
        }
        
        switch action.type {
        case .sheet:
            return SheetView(content: {
                content()
            }, destination: destination)
            .toAnyView()
            
        case .push:
            return NavigationLink(destination: destination, label: {
                content()
            })
            .toAnyView()
        }
    }
}
