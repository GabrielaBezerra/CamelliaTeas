//
//  TeaRowInfo.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct TeaRowInfo: View {
    
    @State var showTimerSheet: Bool = false
    let tea: Tea
    
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.fixed(50), spacing: 15, alignment: .topLeading),
                GridItem(.flexible(), alignment: .leading)
            ],
            alignment: .leading,
            spacing: 15
        ) {
            Image(systemName: "timer").bold()
                .padding()
                .overlay { Circle().fill(.red).opacity(0.25) }
                .onTapGesture {
                    showTimerSheet = true
                }
            Text("\(tea.brewTime) minutes")
            
            Image(systemName: "cup.and.saucer.fill")
                .padding()
                .overlay { Circle().fill(.orange).opacity(0.25) }
            Text(tea.description)
            
            Image(systemName: "frying.pan.fill")
                .padding()
                .overlay { Circle().fill(.brown).opacity(0.25) }
            Text(tea.foodComplement)
        }
        .sheet(isPresented: $showTimerSheet) {
            TimerView(viewModel: .init(minutes: Double(tea.brewTime)))
        }
    }
}
