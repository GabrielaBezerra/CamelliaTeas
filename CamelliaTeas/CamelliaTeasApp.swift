//
//  CamelliaTeasApp.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import SwiftUI
import UXCam
import UXCamSwiftUI
import Mixpanel

@main
struct CamelliaTeasApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CamelliaView()
                    .uxcamTagScreenName("CamelliaView")
                    .onAppear {
                        Mixpanel.mainInstance().track(event: "CamelliaView")
                    }
            }
        }
    }
    
    init() {
        UXCamCore.optIntoSchematicRecordings()
        let config = UXCamSwiftUI.Configuration(appKey: "biv1s2kbe5d69kp")
        UXCam.start(with: config)
    
        Mixpanel.initialize(
            token: "5fb960ff44403a9ece21fee4ac7970df",
            trackAutomaticEvents: true
        )
    }
}
