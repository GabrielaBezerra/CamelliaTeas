//
//  SubscriptionOptionsView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 01/09/23.
//

import Foundation
import SwiftUI
import UXCam
import Mixpanel
import Amplitude

struct SubscriptionOptionsView: View {

    @Environment(\.colorScheme) var colorScheme
    
    @Binding var selectedSubscriptionOptionIndex: Int

    let subscriptionOptions: [(String, String)]
    let subscriptionAction: () -> Void
    
    var body: some View {
        VStack {
            MugsHStackView()
            
            ForEach(0..<3) { i in
                Button {
                    selectedSubscriptionOptionIndex = i
                } label: {
                    HStack {
                        Image(systemName: selectedSubscriptionOptionIndex == i ? "checkmark.circle.fill": "circle")
                            .font(.system(size: 22))
                            .foregroundColor(selectedSubscriptionOptionIndex == i ? Color("AccentColor") : .gray)
                        VStack(alignment: .leading) {
                            Text(subscriptionOptions[i].0)
                            Text(subscriptionOptions[i].1)
                        }
                        .font(.system(size: 16))
                        Spacer()
                    }
                }
                .foregroundStyle(.foreground)
                .padding()
                .background(.white.opacity(colorScheme == .light ? 1 : 0.1))
                .cornerRadius(11)
            }

            Button {
                // TODO: call apple pay
                let dict = [
                    "option": "\(subscriptionOptions[selectedSubscriptionOptionIndex].0)"
                ]
                UXCam.logEvent("Tap on Subscribe on PremiumView", withProperties: dict)
                UXCam.logEvent("Tap on Subscribe on PremiumView with \(subscriptionOptions[selectedSubscriptionOptionIndex].0)")
                
                Mixpanel.mainInstance().track(event: "Tap on Subscribe on PremiumView", properties: dict)
                Mixpanel.mainInstance().track(event: "Tap on Subscribe on PremiumView with \(subscriptionOptions[selectedSubscriptionOptionIndex].0)")
                
                Amplitude.instance().logEvent("Tap on Subscribe on PremiumView", withEventProperties: dict)
                Amplitude.instance().logEvent("Tap on Subscribe on PremiumView with \(subscriptionOptions[selectedSubscriptionOptionIndex].0)")
                
                subscriptionAction()
            } label: {
                Text("Subscribe now")
                    .frame(maxWidth: .infinity)
                    .bold()
                    .padding()
                    .background(colorScheme == .light ? .black : .white)
                    .foregroundStyle(Color("yellowCamellia"))
                    .cornerRadius(.infinity)
            }
            
            Spacer()
        }
    }
}
