//
//  HapticManager.swift
//  HapticFeedback
//
//  Created by Gianluca Orpello for the Developer Academy on 12/11/21.
//

import Foundation
import CoreHaptics

class HapticManager {
    
    let hapticEngine: CHHapticEngine
    var sliceAudio: CHHapticAudioResourceID?
    var nomNomAudio: CHHapticAudioResourceID?
    var splashAudio: CHHapticAudioResourceID?
    
    init?() {
        
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        guard hapticCapability.supportsHaptics else {
            debugPrint("This Device do not support Core Haptics Feedbacks")
            return nil
        }
        
        
        do {
            hapticEngine = try CHHapticEngine()
        } catch let error {
            print("Haptic engine Creation Error: \(error)")
            return nil
        }
    }
    
    func playSlice() {
        do {
            // 1
            let pattern = try slicePattern()
            // 2
            try hapticEngine.start()
            // 3
            let player = try hapticEngine.makePlayer(with: pattern)
            // 4
            try player.start(atTime: CHHapticTimeImmediate)
            // 5
            hapticEngine.notifyWhenPlayersFinished { _ in
                return .stopEngine
            }
        } catch {
            print("Failed to play slice: \(error)")
        }
    }
    
}


extension HapticManager {
    
    private func slicePattern() throws -> CHHapticPattern {
        
        var audio: CHHapticEvent
        let events: [CHHapticEvent]
        
        let slice = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.45),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.35)
            ],
            relativeTime: 0,
            duration: 0.25)
        
        let snip = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
            ],
            relativeTime: 0.08)
        
        let slice2 = CHHapticEvent(
            eventType: .hapticContinuous,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 0.45),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 0.35)
            ],
            relativeTime: 0.25,
            duration: 0.25)
        
        let snip2 = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
                CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
                CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
            ],
            relativeTime: 0.25)
        
        if let url = Bundle.main.url(forResource: "GameOver", withExtension: "wav") {
            let resourceId = try hapticEngine.registerAudioResource(url, options: [:])

            audio = CHHapticEvent(
                audioResourceID: resourceId,
                parameters: [],
                relativeTime: 0
            )
            
            events = [audio, slice, snip, slice2, snip2]
            
        } else {
            debugPrint("Can't load audio file \"GameOver\" from bundle")
            events = [slice, snip, slice2, snip2]
        }
        
        
        return try CHHapticPattern(events: events, parameters: [])
    }
}
