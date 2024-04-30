//
//  WeekdayView.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct WeekdayView: View {
    static let weekdaySymbols = Calendar.current.shortStandaloneWeekdaySymbols.map { $0.uppercased() }

    var body: some View {
        VStack {
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                }
            }
            Divider()
        }        
    }
}
