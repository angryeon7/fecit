//
//  MonthDayCell.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct MonthDayCellView: View {
    var day: Int

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.white)

            Text("\(day)")
                .fontWeight(.semibold)
                .offset(y: -40)
        }
    }
}
