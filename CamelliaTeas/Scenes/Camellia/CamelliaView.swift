//
//  CamelliaView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct CamelliaView: View {
    
    @State var search: String = ""
    let searchViewModel = SearchTeaViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            List {
                if search.isEmpty {
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
                        TeaListView(viewModel: searchViewModel, proxy: proxy)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .headerProminence(.increased)
            .listStyle(.plain)
            .searchable(text: $search, prompt: "Search by name, minutes, and food")
            .onChange(of: search) { newValue in
                searchViewModel.filter(by: newValue)
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
