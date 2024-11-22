//
//  PetListViewModel.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import Foundation

class PetListViewModel: ObservableObject {
    
    let service: Service
    
    @Published var components: [UIComponent] = []
    
    init() {
        self.service = LocalService()
    }
    
    func load() {
        guard let screenModel = service.load(resource: "pet-listing") else { return }
        
        components = screenModel.buildComponents()
    }
}
