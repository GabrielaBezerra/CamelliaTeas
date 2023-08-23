//
//  TeaRowHeader.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct TeaRowHeader: View {
    
    @StateObject var viewModel = FavoriteTeasViewModel()
    
    let teaName: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: "leaf")
                .padding()
                .overlay { Circle().fill(.green).opacity(0.25) }
            Text(teaName)
            Spacer()
            Button {
                viewModel.toggleFavorite(teaName)
            } label: {
                Image(systemName: viewModel.favorites.contains(teaName) ? "heart.fill" : "heart")
                    .font(.system(size: 24))
            }
        }
        .font(.system(.headline, weight: .medium))
    }
}
