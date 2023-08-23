//
//  ViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

protocol TeaListViewModelLogic {
    var teas: [Tea] { get }
}

struct AllTeasListViewModel: TeaListViewModelLogic {
    let teas: [Tea] = Tea.all
}
