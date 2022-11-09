//
//  HapticPaletteView.swift
//  HapticFeedback
//
//  Created by Gianluca Orpello for the Developer Academy on 12/11/21.
//

import SwiftUI
import CoreHaptics
import AVFoundation

struct HapticPaletteView: View {
    
    // A haptic engine manages the connection to the haptic server.
    @State var engine: CHHapticEngine?
    
    // Maintain a variable to check for Core Haptics compatibility on device.
    var supportsHaptics: Bool {
        // Check if the device supports haptics.
        let hapticCapability = CHHapticEngine.capabilitiesForHardware()
        return hapticCapability.supportsHaptics
    }
    
    var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 2)
    
    var cards = [
        "Sparkle",
        "Heartbeats",
        "Boing",
        "Inflate",
        "Gravel",
        "Rumble",
        "Oscillate",
        "(♬)Drums"
    ]
    
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(cards, id: \.self) { card in
                    Card(title: card)
                        .padding(.vertical)
                        .onTapGesture {
                            playHapticsFile(named: "AHAP/\(card)")
                        }
                }
            }
            .navigationTitle("Haptic Palette")
            .onAppear {
                createEngine()
            }
        }
    }
    
    /// - Tag: CreateEngine
    func createEngine() {
        // Create and configure a haptic engine.
        do {
            // Associate the haptic engine with the default audio session
            // to ensure the correct behavior when playing audio-based haptics.
            let audioSession = AVAudioSession.sharedInstance()
            engine = try CHHapticEngine(audioSession: audioSession)
        } catch let error {
            print("Engine Creation Error: \(error)")
        }
        
        guard let engine = engine else {
            print("Failed to create engine!")
            return
        }
        
        // The stopped handler alerts you of engine stoppage due to external causes.
        engine.stoppedHandler = { reason in
            print("The engine stopped for reason: \(reason.rawValue)")
            switch reason {
            case .audioSessionInterrupt:
                print("Audio session interrupt")
            case .applicationSuspended:
                print("Application suspended")
            case .idleTimeout:
                print("Idle timeout")
            case .systemError:
                print("System error")
            case .notifyWhenFinished:
                print("Playback finished")
            case .gameControllerDisconnect:
                print("Controller disconnected.")
            case .engineDestroyed:
                print("Engine destroyed.")
            @unknown default:
                print("Unknown error")
            }
        }
 
        // The reset handler provides an opportunity for your app to restart the engine in case of failure.
        engine.resetHandler = {
            // Try restarting the engine.
            print("The engine reset --> Restarting now!")
            do {
                try self.engine?.start()
            } catch {
                print("Failed to restart the engine: \(error)")
            }
        }
    }
    
    /// - Tag: PlayAHAP
    func playHapticsFile(named filename: String) {
        
        // If the device doesn't support Core Haptics, abort.
        if supportsHaptics == false {
            debugPrint("No support for Haptic...")
            return
        }
        
        // Express the path to the AHAP file before attempting to load it.
        guard let path = Bundle.main.path(forResource: filename, ofType: "ahap") else {
            debugPrint("Can not find the files...")
            return
        }
        
        do {
            // Start the engine in case it's idle.
            try engine?.start()
            
            // Tell the engine to play a pattern.
            try engine?.playPattern(from: URL(fileURLWithPath: path))
            
        } catch { // Engine startup errors
            print("An error occured playing \(filename): \(error).")
        }
    }
}

struct Card: View {
    
    var title: String
    
    var body: some View{
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
            
            Text(title)
                .foregroundColor(.black)
                .padding(20)
                .multilineTextAlignment(.center)
        }
        .frame(width: 150, height: 100)
    }
}

struct HapticPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HapticPaletteView()
        }
    }
}
