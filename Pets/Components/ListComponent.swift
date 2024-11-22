//
//  ListComponent.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation
import SwiftUI

struct RowComponent: View {
    
    let rowModel: ListRowUIModel
    
    var body: some View {
        HStack {
            AsyncImage(url: rowModel.imageUrl, 
                       content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            },
                       placeholder: {
                ProgressView()
            })
            
            VStack(alignment: .leading) {
                Text(rowModel.title)
                Text(rowModel.subTitle ?? "")
                    .font(.subheadline)
                
                Text(rowModel.description ?? "")
            }
        }
    }
}

struct ListComponent: UIComponent {
    var id = UUID()
    
    let listModel: ListUIModel
    
    func render() -> AnyView {
        ForEach(listModel.rows, id: \.id) { row in
            Navigator.perform(action: listModel.action,
                              payload: row,
                              content: {
                RowComponent(rowModel: row)
            })
        }
        .toAnyView()
    }
}
