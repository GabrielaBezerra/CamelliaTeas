//
//  OptionsView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI
import UXCam
import Mixpanel

struct OptionsView: View {
    
    enum Option {
        case timer
        case favorites
        case food
    }
    
    @State var presentSheet: Bool = false
    @State var showNextView: Bool = false
    @State private var option: Option!
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Image(systemName: "timer").bold()
                Text("It's brew time!")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("redCamellia"))
            .cornerRadius(.infinity)
            .onTapGesture {
                UXCam.logEvent("Tap on custom timer quick action")
                Mixpanel.mainInstance().track(event: "Tap on custom timer quick action")
                option = .timer
                showNextView = false
                presentSheet = true
            }
            
            HStack {
                Image(systemName: "cup.and.saucer.fill")
                Text("Scroll through your favorite teas")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("yellowCamellia"))
            .cornerRadius(.infinity)
            .onTapGesture {
                UXCam.logEvent("Tap on favorites quick action")
                Mixpanel.mainInstance().track(event: "Tap on favorites quick action")
                option = .favorites
                presentSheet = false
                showNextView = true
            }
            
            HStack {
                Image(systemName: "frying.pan.fill")
                Text("Find the perfect tea for your food")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("brownCamellia"))
            .cornerRadius(.infinity)
            .onTapGesture {
                UXCam.logEvent("Tap on food quick action")
                Mixpanel.mainInstance().track(event: "Tap on food quick action")
                option = .food
                presentSheet = false
                showNextView = true
            }
        }
        .sheet(isPresented: $presentSheet) {
            switch option {
            case .timer: TimerView()
            default: EmptyView()
            }
        }
        .navigationDestination(isPresented: $showNextView) {
            switch option {
            case .favorites: FavoriteTeasList()
            case .food: FoodListView()
            default: EmptyView()
            }
        }
    }
    
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List {
                Section {
                    OptionsView()
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
    }
}
