//
//  Impact.swift
//  HapticFeedback
//
//  Created by Gianluca Orpello for the Developer Academy on 12/11/21.
//

import Foundation
import SwiftUI

struct Impacts: Identifiable, Hashable {
    let id = UUID()
    let impactStyle: UIImpactFeedbackGenerator.FeedbackStyle
    let title: String
}
