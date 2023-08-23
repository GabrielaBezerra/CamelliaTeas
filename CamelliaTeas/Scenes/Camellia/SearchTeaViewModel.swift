//
//  SearchTeaViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

class SearchTeaViewModel: ObservableObject, TeaListViewModelLogic {
    
    @Published var teas: [Tea] = Tea.all
    
    @MainActor
    func filter(by search: String) {
        let searchFormatted = search.lowercased()
        teas = Tea.all.filter {
            $0.name.lowercased().contains(searchFormatted) ||
            $0.description.lowercased().contains(searchFormatted) ||
            $0.foodComplement.lowercased().contains(searchFormatted) ||
            "\($0.brewTime) minutes".lowercased().contains(searchFormatted)
        }
    }
}
