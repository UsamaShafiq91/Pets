//
//  ScreenModel.swift
//  Pets
//
//  Created by UsamaShafiq on 20/11/2024.
//

import Foundation


struct ScreenModel: Decodable {
    let pageTitle: String
    let components: [Component]
}

struct Component: Decodable {
    let type: ComponentType?
    let data: [String: Any]
    
    enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
}

enum ComponentType: String, Decodable {
    case featuredImage
    case carousel
    case textRow
    case rating
    case list
}

extension ScreenModel {
    
    func buildComponents() -> [UIComponent] {
        var components: [UIComponent] = []
        
        for component in self.components {
            switch component.type {
            case .featuredImage:
                if let featuredImageModel: FeaturedImageUIModel = component.data.decode() {
                    components.append(FeaturedImageComponent(featuredImageModel: featuredImageModel))
                }
                
            case .carousel:
                if let carouselModel: CarouselUIModel = component.data.decode() {
                    components.append(CarouselComponent(carouselModel: carouselModel))
                }
                
            case .textRow:
                if let textModel: TextUIModel = component.data.decode() {
                    components.append(TextComponent(textModel: textModel))
                }
                
            case .rating:
                if let ratingModel: RatingUIModel = component.data.decode() {
                    components.append(RatingComponent(ratingModel: ratingModel))
                }
                
            case .list:
                if let listModel: ListUIModel = component.data.decode() {
                    components.append(ListComponent(listModel: listModel))
                }
                
            case .none:
                components.append(EmptyComponent())
            }
        }
        
        return components
    }
}
