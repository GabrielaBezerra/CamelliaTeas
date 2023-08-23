//
//  FoodListViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

class FoodListViewModel: ObservableObject {
    @Published var food: [Food] = Food.all
    @Published var filteredTeas: [Tea] = []
    
    @MainActor
    func filter(by search: String) {
        filteredTeas = Tea.all.filter {
            $0.foodComplement.lowercased().contains(search.lowercased())
        }
    }
}
