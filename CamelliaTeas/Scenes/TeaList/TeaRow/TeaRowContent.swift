//
//  TeaRowContent.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct TeaRowContent: View {
    
    let tea: Tea
    let proxy: GeometryProxy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TeaRowImage(url: tea.pictureURL, proxy: proxy)
            TeaRowInfo(tea: tea)
        }
    }
}
