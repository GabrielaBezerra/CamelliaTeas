//
//  FavoriteTeasList.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct FavoriteTeasList: View {
    var body: some View {
        GeometryReader { proxy in
            TeaListView(viewModel: FavoriteTeasViewModel(), proxy: proxy)
                .navigationTitle("Favorite Teas")
        }
        .uxcamTagScreenName("FavoriteTeasView")
    }
}
