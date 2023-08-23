//
//  Model.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

protocol Model: Hashable, Identifiable {
    var id: UUID { get }
}

extension Model {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (_ lhs: Self, _ rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
