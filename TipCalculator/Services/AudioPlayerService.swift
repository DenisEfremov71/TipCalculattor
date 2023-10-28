//
//  AudioPlayerService.swift
//  TipCalculator
//
//  Created by Denis Efremov on 2023-10-28.
//

import Foundation
import AVFoundation

protocol AudioPlayerService {
    func playSound()
}

final class DefaultAudioPlayer: AudioPlayerService {

    private var player: AVAudioPlayer?

    func playSound() {
        guard let path = Bundle.main.path(forResource: "click", ofType: "m4a") else {
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print(error.localizedDescription)
        }
    }
}
