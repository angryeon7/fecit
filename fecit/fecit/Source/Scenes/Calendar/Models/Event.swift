//
//  Event.swift
//  fecit
//
//  Created by nayeon  on 4/30/24.
//

import Foundation
import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let color: Color
    let date: YearMonthDay
}
