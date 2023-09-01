//
//  PremiumFeaturesView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 01/09/23.
//

import Foundation
import SwiftUI
import UXCam
import Mixpanel
import Amplitude

struct PremiumFeaturesView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let action: () -> Void
    
    var body: some View {
        VStack {
            MugsVStackView()
            Text("...written by our experts on a weekly basis, and more!")
                .font(.title2).bold()
                .padding()
            Text("Tea brewing methods\nHistory of the Teas\nFood recipes")
            Spacer()
            Button {
                UXCam.logEvent("Tap on Learn More on PremiumView")
                Mixpanel.mainInstance().track(event: "Tap on Learn More on PremiumView")
                Amplitude.instance().logEvent("Tap on Learn More on PremiumView")
                action()
            } label: {
                Text("Learn more")
                    .frame(maxWidth: .infinity)
                    .bold()
                    .padding()
                    .background(colorScheme == .light ? .black : .white)
                    .foregroundStyle(Color("yellowCamellia"))
                    .cornerRadius(.infinity)
            }
        }
        .multilineTextAlignment(.center)
    }
}
