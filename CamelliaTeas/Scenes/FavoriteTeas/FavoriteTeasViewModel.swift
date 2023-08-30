//
//  FavoriteTeasViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import UXCam
import Mixpanel

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
        UXCam.logEvent("Unfavorited \(name)", withProperties: Tea.tea(named: name).toDict())
        Mixpanel.mainInstance().track(event: "Unfavorited \(name)", properties: Tea.tea(named: name).toDict())
    }
    
    private func favorite(_ name: String) {
        __favorites = __favorites + [name]
        UXCam.logEvent("Favorited \(name)", withProperties: Tea.tea(named: name).toDict())
        Mixpanel.mainInstance().track(event: "Favorited \(name)", properties: Tea.tea(named: name).toDict())
    }
}

extension FavoriteTeasViewModel: TeaListViewModelLogic {
    var teas: [Tea] {
        Tea.all.filter { __favorites.contains($0.name) }
    }
}
