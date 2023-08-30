//
//  FavoriteTeasList.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI
import Mixpanel
import Amplitude

struct FavoriteTeasList: View {
    var body: some View {
        GeometryReader { proxy in
            TeaListView(viewModel: FavoriteTeasViewModel(), proxy: proxy)
                .navigationTitle("Favorite Teas")
        }
        .uxcamTagScreenName("FavoriteTeasView")
        .onAppear {
            Mixpanel.mainInstance().track(event: "FavoriteTeasView")
            Amplitude.instance().logEvent("FavoriteTeasView")
        }
    }
}
