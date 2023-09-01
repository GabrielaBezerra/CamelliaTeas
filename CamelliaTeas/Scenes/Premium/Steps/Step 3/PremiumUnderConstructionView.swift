//
//  PremiumUnderConstructionView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 01/09/23.
//

import Foundation
import SwiftUI

struct PremiumUnderConstructionView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image(systemName: "face.smiling")
                    .font(.system(size: 80))
                Image(systemName: "party.popper.fill")
                    .font(.system(size: 80))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.black, .white)
            }
            Text("Currently, the premium features are under construction. We will make sure to notify you when they are available.\n\nMeanwhile, we hope that our App makes your experience drinking tea more pleasurable.")
                .font(.title3)
                .padding(.horizontal, 25)
            Spacer()
        }
        .multilineTextAlignment(.center)
    }
}
