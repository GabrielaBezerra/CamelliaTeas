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
    
    @State var text: AttributedString = {
        let string = "Unlock entirely new"
        let coloredString = " tea and food suggestions..."
        var att = AttributedString(coloredString)
        att.setAttributes(.init([NSAttributedString.Key.foregroundColor : UIColor.white]))
        return AttributedString(string)+att
    }()
    
    @State var buttonText: String = "Learn more"
    
    @State var showingSubscribeOption: Bool = false
    
    let subscriptionOptions: [(String, String)] = [
        ("10.90 / Year", "Get 7 days free for trial. Billed yearly."),
        ("1.90 / Month", "Get 7 days free for trial. Billed monthly."),
        ("149.90 / Lifetime Access", "You pay once and use forever!")
    ]
    
    @State var selectedSubscriptionOptionIndex: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("brownCamellia").ignoresSafeArea()
                
                VStack {
                    Text(text)
                        .font(.largeTitle).bold()
                        .multilineTextAlignment(.center)
                        .padding(30)
                    
                    if !showingSubscribeOption {
                        VStack(spacing: 15) {
                            ZStack(alignment: .bottom) {
                                Image(systemName: "mug.fill")
                                    .font(.system(size: 70))
                                Image(systemName: "leaf.fill")
                                    .font(.system(size: 30))
                                    .foregroundColor(Color("yellowCamellia"))
                                    .offset(x: -5, y: -15)
                            }
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
                        }
                        
                        Spacer()
                        
                    } else {
                        VStack {
                            HStack {
                                ZStack(alignment: .bottom) {
                                    Image(systemName: "mug.fill")
                                        .font(.system(size: 70))
                                    Image(systemName: "leaf.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color("yellowCamellia"))
                                        .offset(x: -5, y: -15)
                                }
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
                            }
                        }
                    }
                    
                    if !showingSubscribeOption {
                        VStack(spacing: 10) {
                            Text("...every week,\nwritten by our experts\n And more!")
                                .font(.title2).bold()
                            Text("New food compliments\nPreparation methods\nHistory of the Teas")
                        }
                        .multilineTextAlignment(.center)
                    } else {
                        VStack {
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
                                .background(.background)
                                .cornerRadius(11)
                            }
                        }
                    }
                    //Spacer()
                    Button {
                        if !showingSubscribeOption {
                            UXCam.logEvent("Tap on Learn More on PremiumView")
                            Mixpanel.mainInstance().track(event: "Tap on Learn More on PremiumView")
                            Amplitude.instance().logEvent("Tap on Learn More on PremiumView")
                            buttonText = "Subscribe now"
                            showingSubscribeOption = true
                            text = ""
                            withAnimation(.easeInOut(duration: 2)) {
                                text = "Choose your\nsubscription plan"
                            }
                        } else {
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
                            dismiss()
                        }
                    } label: {
                        Text(buttonText)
                            .frame(maxWidth: .infinity)
                            .bold()
                            .padding()
                            .background(colorScheme == .light ? .black : .white)
                            .foregroundStyle(Color("yellowCamellia"))
                            .cornerRadius(.infinity)
                    }
                }
                .padding()
            }
        }
        .background(.background)
        .frame(maxWidth: .infinity)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
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
}

struct PremiumView_Previews: PreviewProvider {
    @State static var show: Bool = true
    static var previews: some View {
        Text("").fullScreenCover(isPresented: $show, content: { PremiumView() })
    }
}
