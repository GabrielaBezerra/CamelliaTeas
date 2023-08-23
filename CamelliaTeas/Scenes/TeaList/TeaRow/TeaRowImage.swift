//
//  TeaRowImage.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI

struct TeaRowImage: View {

    @State var animateGradient = false
    
    let url: URL
    let proxy: GeometryProxy
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ZStack {
                LinearGradient(colors: [Color("greenCamellia"), Color("yellowCamellia"),  Color("redCamellia")], startPoint: animateGradient ? .topLeading : .bottomLeading, endPoint: animateGradient ? .bottomTrailing : .topTrailing)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
                Image(systemName: "leaf")
                    .font(.largeTitle)
                    .scaleEffect(animateGradient ? 1.5 : 1, anchor: .center)
                    .opacity(0.25)
            }
        }
        .frame(width: proxy.size.width * 0.9, height: proxy.size.height * 0.4)
        .background(Color("greenCamellia").opacity(0.5))
        .cornerRadius(12)
        .clipped()
    }
}
