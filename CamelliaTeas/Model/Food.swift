//
//  Food.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

struct Food: Model {
    let id = UUID()
    let description: String
    let teas: [Tea]
    
    static let all: [Food] = [
        Food(
            description: "Hearty foods",
            teas: Tea.all.filter { $0.foodComplement.lowercased().contains("hearty") }
        ),
        Food(
            description: "Fruit",
            teas: Tea.all.filter { $0.foodComplement.lowercased().contains("fruit") }
        ),
        Food(
            description: "Breakfast",
            teas: Tea.all.filter { $0.foodComplement.lowercased().contains("breakfast") }
        ),
        Food(
            description: "Light foods",
            teas: Tea.all.filter { $0.foodComplement.lowercased().contains("light") }
        ),
        Food(
            description: "Rich foods",
            teas: Tea.all.filter { $0.foodComplement.lowercased().contains("rich") }
        ),
        Food(
            description: "Asian",
            teas: Tea.all.filter {
                $0.foodComplement.lowercased().contains("asian") ||
                $0.foodComplement.lowercased().contains("chinese")
            }
        )
    ]
    
}
