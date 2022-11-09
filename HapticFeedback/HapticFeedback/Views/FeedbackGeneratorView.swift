//
//  FeedbackGenerator.swift
//  HapticFeedback
//
//  Created by Gianluca Orpello for the Developer Academy on 12/11/21.
//

import SwiftUI

struct FeedbackGeneratorView: View {
    
    let generator = UINotificationFeedbackGenerator()
    let hapticManager = HapticManager()
    
    
    private let impacts: [Impacts] = [
        Impacts(impactStyle: .light, title: "Light Impact"),
        Impacts(impactStyle: .medium, title: "Medium Impact"),
        Impacts(impactStyle: .heavy, title: "Heavy Impact"),
        Impacts(impactStyle: .rigid, title: "Rigid Impact"),
        Impacts(impactStyle: .soft, title: "Soft Impact"),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                
                Section{
                    ForEach(impacts) { impact in
                        ImpactButton(
                            impactStyle: impact.impactStyle,
                            title: impact.title
                        )
                    }
                } header: {
                    Text("Impact Feedback Generator")
                }
                
                Section{
                    BlueButton(action: {
                        generator.notificationOccurred(.error)
                    }, title: "Error")
                    
                    BlueButton(action: {
                        generator.notificationOccurred(.success)
                        
                    }, title: "Success")
                    
                    BlueButton(action: {
                        generator.notificationOccurred(.warning)
                        
                    }, title: "Warning")
                    
                } header: {
                    Text("Notification Feedback Generator")
                }
                
                Section{
                    BlueButton(action: {
                        hapticManager?.playSlice()
                    }, title: "(♬)Custom")
                } header: {
                    Text("CoreHaptics Custom Feedback")
                        
                }
            }
            .navigationTitle("Feedback Generator")
        }
    }
}


struct ImpactButton: View {
    var impactStyle: UIImpactFeedbackGenerator.FeedbackStyle
    var title: String
    
    var body: some View {
        Button(action: {
            let impact = UIImpactFeedbackGenerator(style: impactStyle)
            impact.impactOccurred()
        }) {
            Text(self.title)
        }
        .padding()
    }
}

struct BlueButton: View {
    var action: () -> Void
    var title: String
    
    var body: some View {
        Button(action: self.action) {
            Text(self.title)
        }
        .padding()
    }
}


struct FeedbackGeneratorViewFeedbackGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackGeneratorView()
    }
}
