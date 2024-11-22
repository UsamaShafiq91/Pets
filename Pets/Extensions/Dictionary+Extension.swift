//
//  Dictionary+Extension.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import Foundation

extension Dictionary {
    
    func decode<T:Decodable>() -> T? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        
        let decoder = JSONDecoder()
        
        return try? decoder.decode(T.self, from: data)
    }
}
