//
//  TeaListView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//
import Foundation
import SwiftUI



struct TeaListView: View {
    
    let viewModel: any TeaListViewModelLogic
    let proxy: GeometryProxy
    
    init(viewModel: TeaListViewModelLogic = AllTeasListViewModel(), proxy: GeometryProxy) {
        self.viewModel = viewModel
        self.proxy = proxy
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(viewModel.teas) { tea in
                    TeaRowView(tea: tea, proxy: proxy)
                    Line()
                        .stroke(style: .init(dash: [10]))
                        .foregroundStyle(.yellow)
                        .frame(height: 1)
                }
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}

struct TeaListView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            TeaListView(proxy: proxy)
        }
    }
}

