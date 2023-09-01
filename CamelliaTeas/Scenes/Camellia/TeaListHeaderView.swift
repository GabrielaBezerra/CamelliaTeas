//
//  TeaListHeaderView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 31/08/23.
//

import Foundation
import SwiftUI
import UXCam
import Mixpanel
import Amplitude

struct TeaListHeaderView: View {
    
    @State private var showPremiumView: Bool = false
    
    var body: some View {
        HStack {
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
        }
        .sheet(isPresented: $showPremiumView) {
            NavigationStack {
                PremiumView()
                    .uxcamTagScreenName("PremiumView")
                    .onAppear {
                        Mixpanel.mainInstance().track(event: "PremiumView")
                        Amplitude.instance().logEvent("PremiumView")
                    }
            }
        }
        .foregroundColor(nil)
    }
}
