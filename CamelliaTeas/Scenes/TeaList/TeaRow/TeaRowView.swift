//
//  TeaRowView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct TeaRowView: View {
    
    let tea: Tea
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            TeaRowHeader(teaName: tea.name)
            TeaRowContent(tea: tea, proxy: proxy)
        }
    }
}
