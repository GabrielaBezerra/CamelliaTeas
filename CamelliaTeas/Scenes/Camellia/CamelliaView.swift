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

    @State var showPremiumView: Bool = false
    @StateObject var viewModel = SearchTeaViewModel()
    
    var body: some View {
        GeometryReader { proxy in
            List {
                if viewModel.search.isEmpty {
                    Section(header: Text("Quick actions").bold()) {
                        OptionsView()
                    }
                    .listRowSeparator(.hidden)
                    
                    Section(header: HStack {
                        Text("All teas").bold()
                        Spacer()
                        Button {
                            showPremiumView = true
                        } label: {
                            Text("+teas")
                                .padding(.vertical, 6)
                                .padding(.horizontal)
                                .font(.system(size: 14))
                                .foregroundColor(Color("yellowCamellia"))
                                .background(Color(uiColor: .label))
                                .cornerRadius(.infinity)
                                .bold()
                        }
                    }) {
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
        .sheet(isPresented: $showPremiumView) {
            PremiumView()
                .uxcamTagScreenName("PremiumView")
                .onAppear {
                    Mixpanel.mainInstance().track(event: "PremiumView")
                    Amplitude.instance().logEvent("PremiumView")
                }
        }
    }
}

struct CamelliaView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CamelliaView()
        }
    }
}
