//
//  PremiumView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 31/08/23.
//

import Foundation
import SwiftUI
import UXCam
import Mixpanel
import Amplitude

struct PremiumView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject var viewModel: PremiumViewModel = PremiumViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("brownCamellia").ignoresSafeArea()
                
                VStack {
                    Text(viewModel.text)
                        .font(.largeTitle).bold()
                        .multilineTextAlignment(.center)
                        .padding(30)
                    
                    switch viewModel.step {
                    case .learnMore:
                        PremiumFeaturesView {
                            viewModel.nextStep(.subscribeNow)
                            changeTitleText(to: "Choose your\nsubscription plan")
                        }
                    case .subscribeNow:
                        SubscriptionOptionsView(
                            selectedSubscriptionOptionIndex: $viewModel.selectedSubscriptionOptionIndex,
                            subscriptionOptions: viewModel.subscriptionOptions
                        ) {
                            viewModel.nextStep(.underConstruction)
                            changeTitleText(to: "We're glad that you are interested!")
                        }
                    case .underConstruction:
                        PremiumUnderConstructionView()
                    }
                    
                }
                .padding()
            }
        }
        .background(.background)
        .frame(maxWidth: .infinity)
        .onDisappear {
            UXCam.logEvent("Exit premium view")
            Mixpanel.mainInstance().track(event: "Exit premium view")
            Amplitude.instance().logEvent("Exit premium view")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundStyle(.foreground)
                }
            }
        }
    }
    
    func changeTitleText(to newTitle: AttributedString) {
        viewModel.text = ""
        withAnimation(.easeInOut(duration: 2)) {
            viewModel.text = newTitle
        }
    }
}

struct PremiumView_Previews: PreviewProvider {
    @State static var show: Bool = true
    static var previews: some View {
        Text("").fullScreenCover(isPresented: $show) {
            PremiumView()
        }
    }
}
