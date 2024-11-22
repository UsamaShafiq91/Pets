//
//  PetDetailViewModel.swift
//  Pets
//
//  Created by UsamaShafiq on 21/11/2024.
//

import Foundation

class PetDetailViewModel: ObservableObject {
    
    let service: Service
    
    @Published var components: [UIComponent] = []
    
    init() {
        self.service = LocalService()
    }
    
    func load(petId: Int) {
        guard let screenModel = service.load(resource: "\(petId)") else { return }
        
        components = screenModel.buildComponents()
    }
}
