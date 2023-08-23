//
//  FavoriteTeasViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

class FavoriteTeasViewModel: ObservableObject {

    @Published var favorites: [String] = UserDefaults.standard.array(forKey: "favs") as? [String] ?? []
    
    private var __favorites: [String] {
        get {
            UserDefaults.standard.array(forKey: "favs") as? [String] ?? []
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "favs")
        }
    }
    
    @MainActor
    func toggleFavorite(_ name: String) {
        if __favorites.contains(name) {
            unfavorite(name)
        } else {
            favorite(name)
        }
        favorites = __favorites
    }
    
    private func unfavorite(_ name: String) {
        __favorites = __favorites.filter { $0 != name }
    }
    
    private func favorite(_ name: String) {
        __favorites = __favorites + [name]
    }
}

extension FavoriteTeasViewModel: TeaListViewModelLogic {
    var teas: [Tea] {
        Tea.all.filter { __favorites.contains($0.name) }
    }
}
