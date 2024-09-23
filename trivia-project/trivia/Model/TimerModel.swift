//
//  TimerModel.swift
//  trivia
//
//  Created by Axel Pestoni on 4/30/23.
//

import Foundation
import SwiftUI

class UpdaterViewModel: ObservableObject {
    @Published var maxTime = 180
    @Published var secondsRemaining = 180
    private var timer: Timer?
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.secondsRemaining > 0 {
                self.secondsRemaining -= 1
            }
        }
    }
    init() {
        startTimer()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func getCurrentTime() -> Int {
        return secondsRemaining
    }
    
    func refresh() {
        secondsRemaining -= 1
    }
    
    func reset() {
        self.secondsRemaining = maxTime
        startTimer()
    }
}

struct Updater: View {
    @StateObject var updaterViewModel = UpdaterViewModel()
    var TimerVar: UpdaterViewModel
    var body: some View {
        VStack {
            Text("\(updaterViewModel.secondsRemaining)")
            ZStack(alignment: .leading){
                Capsule().frame(width: UIScreen.main.bounds.width-20).foregroundColor(Color.gray)
                Capsule().frame(width:(UIScreen.main.bounds.width-20)*CGFloat(updaterViewModel.getCurrentTime())/CGFloat(updaterViewModel.maxTime)).foregroundColor(Color.blue).animation(.linear)
            }.frame(height: 20)
        }
    }
}
