//
//  FoodListView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct FoodListView: View {
    
    @State var search: String = ""
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                List(Food.all) { food in
                    FoodSectionView(food: food, proxy: proxy)
                }
                .listStyle(.insetGrouped)
            }
            .scrollIndicators(.hidden)
        }
        .navigationTitle("Choose your Tea")
    }
}

struct FoodSectionView: View {
    let food: Food
    let proxy: GeometryProxy
    
    var body: some View {
        Section(header: Text(food.description)) {
            ForEach(food.teas) { tea in
                NavigationLink(
                    destination:
                        List {
                            Section {
                                VStack(spacing: 30) {
                                    TeaRowView(tea: tea, proxy: proxy)
                                    Line()
                                        .stroke(style: .init(dash: [10]))
                                        .foregroundStyle(.yellow)
                                        .frame(height: 1)
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .navigationBarTitleDisplayMode(.inline)
                ) {
                    Text(tea.foodComplement)
                }
            }
        }
        .headerProminence(.increased)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FoodListView()
        }
    }
}
