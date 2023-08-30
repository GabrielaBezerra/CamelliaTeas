//
//  CamelliaTeasApp.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import SwiftUI
import UXCam
import UXCamSwiftUI

@main
struct CamelliaTeasApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                CamelliaView()
                    .uxcamTagScreenName("CamelliaView")
            }
        }
    }
    
    init() {
        UXCamCore.optIntoSchematicRecordings()
        let config = UXCamSwiftUI.Configuration(appKey: "biv1s2kbe5d69kp")
        UXCam.start(with: config)
    }
}
