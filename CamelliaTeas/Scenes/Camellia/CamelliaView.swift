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
                    
                    Section(header: Text("All teas").bold()) {
                        TeaListView(proxy: proxy)
                    }
                    .listRowSeparator(.hidden)
                } else {
                    Section(header: Text("Search results").bold()) {
                        TeaListView(viewModel: viewModel, proxy: proxy)
                    }
                    .listRowSeparator(.hidden)
                    .uxcamOcclude(blockGestures: false)
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
