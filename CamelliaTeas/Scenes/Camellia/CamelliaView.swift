//
//  CamelliaView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI
import Combine
import UXCam
import Mixpanel
import Amplitude

struct CamelliaView: View {

    @StateObject var viewModel = SearchTeaViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            List {
                if viewModel.search.isEmpty {
                    Section(header: Text("Quick actions").bold()) {
                        OptionsView()
                    }
                    .listRowSeparator(.hidden)
                    
                    Section(header: TeaListHeaderView()) {
                        TeaListView(proxy: proxy)
                    }
                    .listRowSeparator(.hidden)
                } else {
                    Section(header: Text("Search results").bold()) {
                        TeaListView(viewModel: viewModel, proxy: proxy)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .headerProminence(.increased)
            .listStyle(.plain)
            .searchable(text: $viewModel.search, prompt: "Search by name, minutes, and food")
            .onChange(of: viewModel.search) { newValue in
                viewModel.filter(by: newValue)
            }
        }
        .navigationTitle("Camellia Sinensis")
    }
}

struct CamelliaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CamelliaView()
        }
    }
}
