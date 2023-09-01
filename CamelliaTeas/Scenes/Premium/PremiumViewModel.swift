//
//  PremiumViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 01/09/23.
//

import Foundation
import UIKit

class PremiumViewModel: ObservableObject {
    
    enum PremiumOptionsStep: String {
        case learnMore
        case subscribeNow
        case underConstruction
    }
    
    @Published var text: AttributedString = {
        let string = "Unlock entirely new"
        let coloredString = " tea and food suggestions..."
        var att = AttributedString(coloredString)
        att.setAttributes(.init([NSAttributedString.Key.foregroundColor : UIColor.white]))
        return AttributedString(string)+att
    }()
    
    @Published var step: PremiumOptionsStep = .learnMore
    
    @Published var selectedSubscriptionOptionIndex: Int = 0

    let subscriptionOptions: [(String, String)] = [
        ("$ 10.90 / Year", "Get 7 days free for trial. Billed yearly."),
        ("$ 1.90 / Month", "Get 7 days free for trial. Billed monthly."),
        ("$ 29.90 / Lifetime Access", "You pay once and use forever!")
    ]
    
    func nextStep(_ nextStep: PremiumOptionsStep) {
        step = nextStep
    }
}
