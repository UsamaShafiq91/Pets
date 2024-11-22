//
//  LocalService.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import Foundation

protocol Service {
    
    func load(resource: String) -> ScreenModel?
}

struct LocalService: Service {
    
    func load(resource: String) -> ScreenModel? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "json") else {
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            return try decoder.decode(ScreenModel.self, from: data)
            
        }
        catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
