//
//  TimerViewModel.swift
//  CamelliaTeas
//
//  Created by Gabriela Bezerra on 22/08/23.
//

import Foundation

class TimerViewModel: ObservableObject {
    
    @Published var durationInMinutes: Double
    @Published var remainingSeconds: TimeInterval = -1
    @Published var timerString: String = "Start timer"
    @Published var timerIsRunning: Bool = false
    
    private var endTime: Date?
    private var timer: Timer?
    
    init(minutes: Double = 0) {
        self.durationInMinutes = minutes
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func toggleTimer() {
        if timerIsRunning {
            stop()
        } else {
            start()
        }
    }
    
    private func start() {
        endTime = Date.now.advanced(by: durationInMinutes * 60)
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            [weak self] _ in
            guard let self, let endTime else { return }
            remainingSeconds = endTime.distance(to: Date.now) * -1
            if remainingSeconds > 0 {
                let formatter = DateComponentsFormatter()
                formatter.allowedUnits = [.hour, .minute, .second]
                formatter.unitsStyle = .abbreviated
                timerString = formatter.string(from: remainingSeconds)!
            } else {
                stop()
                timerString = "Tea is ready 🫖"
            }
        }
        timer?.fire()
        timerIsRunning = true
    }
    
    private func stop() {
        timer?.invalidate()
        timer = nil
        endTime = nil
        timerString = "Start timer"
        timerIsRunning = false
    }
}
