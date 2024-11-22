//
//  PetDetailScreen.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import SwiftUI

struct PetDetailScreen: View {
    
    @StateObject private var vm = PetDetailViewModel()
    
    let petId: Int
    
    var body: some View {
        ScrollView {
            ForEach(vm.components, id: \.id) { component in
                component.render()
            }
        }
        .navigationTitle("Pet Detail")
        .task {
            vm.load(petId: petId)
        }
    }
}

#Preview {
    PetDetailScreen(petId: 1)
}
