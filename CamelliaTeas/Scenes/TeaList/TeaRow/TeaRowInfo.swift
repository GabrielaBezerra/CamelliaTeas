//
//  TeaRowInfo.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI
import UXCam

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
                    UXCam.logEvent("Tap on timer on Tea")
                    showTimerSheet = true
                }
            Text("\(tea.brewTime) minutes")
            
            Image(systemName: "cup.and.saucer.fill")
                .padding()
                .overlay { Circle().fill(.orange).opacity(0.25) }
                .onTapGesture {
                    UXCam.logEvent("Tap on description circle on Tea")
                }
            Text(tea.description)
            
            Image(systemName: "frying.pan.fill")
                .padding()
                .overlay { Circle().fill(.brown).opacity(0.25) }
                .onTapGesture {
                    UXCam.logEvent("Tap on food circle on Tea")
                }
            Text(tea.foodComplement)
        }
        .sheet(isPresented: $showTimerSheet) {
            TimerView(teaName: tea.name, viewModel: .init(minutes: Double(tea.brewTime)))
        }
    }
}
