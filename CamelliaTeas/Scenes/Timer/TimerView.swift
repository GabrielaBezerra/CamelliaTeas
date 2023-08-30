//
//  TimerView.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation
import SwiftUI
import UXCam
import Mixpanel
import Amplitude

struct TimerView: View {

    let teaName: String
    
    @State var progress: Double = -1
    @State var pickerValue: Int = 0
    @ObservedObject var viewModel: TimerViewModel
    
    init(teaName: String = "no tea", viewModel: TimerViewModel = TimerViewModel()) {
        self.teaName = teaName
        self.viewModel = viewModel
    }
    
    var body: some View {
        if viewModel.durationInMinutes > 0 {
            ZStack(alignment: .center) {
                Color("redCamellia").ignoresSafeArea()
                
                Text(viewModel.timerString)
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 15,
                                        lineCap: .round,
                                        lineJoin:.round
                                    )
                                )
                                .foregroundColor(.red.opacity(0.3))
                                .frame(width: 300, height: 300)
                                .rotationEffect(.degrees(-90))
                            Circle().trim(from: 0, to: progress)
                                .stroke(
                                    style: StrokeStyle(
                                        lineWidth: 15,
                                        lineCap: .round,
                                        lineJoin:.round
                                    )
                                )
                                .foregroundColor(.white)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.degrees(-90))
                                .opacity(0.75)
                        }
                    )
                    .onTapGesture {
                        viewModel.toggleTimer()
                        withAnimation {
                            progress = 1
                        }
                    }
                    .font(.largeTitle)
                
                if viewModel.timerIsRunning {
                    VStack {
                        HStack {
                            Image(systemName: "leaf.circle")
                                .font(.system(size: 22))
                            Text("Don't leave this screen.\nInstead, live this moment outside your iPhone.")
                        }
                        .padding()
                        .font(.headline)
                        .opacity(0.5)
                        
                        Spacer()
                        Button {
                            let dict = [
                                "tea": teaName,
                                "timer": viewModel.timerString
                            ]
                            UXCam.logEvent("Cancelled Timer", withProperties: dict)
                            Mixpanel.mainInstance().track(event: "Cancelled Timer", properties: dict)
                            Amplitude.instance().logEvent("Cancelled Timer", withEventProperties: dict)
                            viewModel.toggleTimer()
                            withAnimation {
                                progress = 1
                            }
                        } label: {
                            HStack {
                                Image(systemName: "xmark.circle")
                                Text("Cancel timer")
                            }
                            .foregroundColor(Color(uiColor: .label).opacity(0.5))
                            .font(.title3)
                        }
                    }
                }
            }
            .navigationBarTitle("Timer")
            .onChange(of: viewModel.remainingSeconds) { newValue in
                withAnimation {
                    progress = newValue / (viewModel.durationInMinutes * 60)
                }
            }
            .onAppear {
                withAnimation {
                    if teaName == "no tea" {
                        UXCam.logEvent("Starting custom timer with \(viewModel.timerString)")
                        Mixpanel.mainInstance().track(event: "Starting custom timer with \(viewModel.timerString)")
                        Amplitude.instance().logEvent("Starting custom timer with \(viewModel.timerString)")
                    } else {
                        UXCam.logEvent("Starting timer for \(teaName)")
                        Mixpanel.mainInstance().track(event: "Starting timer for \(teaName)")
                        Amplitude.instance().logEvent("Starting timer for \(teaName)")
                    }
                    progress = 1
                    UIApplication.shared.isIdleTimerDisabled = true
                }
            }
            .onDisappear {
                if viewModel.timerHasFinished {
                    UXCam.logEvent("Leaving Timer View. Finished brewing \(teaName)")
                    Mixpanel.mainInstance().track(event: "Leaving Timer View. Finished brewing \(teaName)")
                    Amplitude.instance().logEvent("Leaving Timer View. Finished brewing \(teaName)")
                } else {
                    let dict = [
                        "tea": teaName,
                        "timer": viewModel.timerString
                    ]
                    UXCam.logEvent("Leaving Timer View. Didn't finished brewing", withProperties: dict)
                    Mixpanel.mainInstance().track(event: "Leaving Timer View. Didn't finished brewing", properties: dict)
                    Amplitude.instance().logEvent("Leaving Timer View. Didn't finished brewing", withEventProperties: dict)
                }
                UIApplication.shared.isIdleTimerDisabled = false
            }
            .uxcamTagScreenName("TimerView")
            .onAppear {
                Mixpanel.mainInstance().track(event: "TimerView")
                Amplitude.instance().logEvent("TimerView")
            }
        } else {
            VStack {
                Text("How long is your timer?")
                Picker("How long is your timer? (minutes)", selection: $pickerValue) {
                    ForEach(1..<16) {
                        Text("\($0) minute\($0 > 1 ? "s" : "")")
                    }
                }
                .pickerStyle(.inline)
                
                Button {
                    withAnimation {
                        viewModel.durationInMinutes = Double(pickerValue) + 1
                        progress = 1
                    }
                } label: {
                    HStack {
                        Image(systemName: "timer")
                        Text("Setup timer")
                    }
                    .padding()
                    .background(Color("redCamellia"))
                    .foregroundColor(Color(uiColor: .label))
                    .cornerRadius(.infinity)
                }
            }
            .uxcamTagScreenName("SetupTimerView")
            .onAppear {
                Mixpanel.mainInstance().track(event: "SetupTimerView")
                Amplitude.instance().logEvent("SetupTimerView")
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(teaName: Tea.all.first!.name)
    }
}

