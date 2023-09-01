//
//  MugsVStackView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 01/09/23.
//

import Foundation
import SwiftUI

struct MugsVStackView: View {
    var body: some View {
        VStack(spacing: 15) {
            ZStack(alignment: .bottom) {
                Image(systemName: "mug.fill")
                    .font(.system(size: 70))
                Image(systemName: "leaf.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color("yellowCamellia"))
                    .offset(x: -5, y: -15)
            }
            .offset(x: 5)
            ZStack(alignment: .bottom) {
                Image(systemName: "cup.and.saucer.fill")
                    .font(.system(size: 70))
                Image(systemName: "leaf.fill")
                    .font(.system(size: 20))
                    .foregroundColor(Color("yellowCamellia"))
                    .offset(y: -23)
            }
            ZStack(alignment: .bottom) {
                Image(systemName: "mug.fill")
                    .font(.system(size: 70))
                Image(systemName: "leaf.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Color("yellowCamellia"))
                    .offset(x: -5, y: -15)
                    .rotation3DEffect(.degrees(45), axis: (x: 0, y: 0.5, z: 0.5))
            }
            .offset(x: 5)
        }
    }
}
