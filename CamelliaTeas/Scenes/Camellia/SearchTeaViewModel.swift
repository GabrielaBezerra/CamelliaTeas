//
//  SearchTeaViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI
import Combine
import UXCam

class SearchTeaViewModel: ObservableObject, TeaListViewModelLogic {
    
    var subscription: Set<AnyCancellable> = []
    
    @Published var search: String = ""
    @Published var teas: [Tea] = Tea.all
    
    init() {
        $search
            .debounce(for: .seconds(1.5), scheduler: RunLoop.main)
            .removeDuplicates()
            .compactMap { $0 }
            .sink(receiveValue: { text in
                if !text.isEmpty {
                    UXCam.logEvent("Searching for \(text)")
                }
            })
            .store(in: &subscription)
    }
    
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
