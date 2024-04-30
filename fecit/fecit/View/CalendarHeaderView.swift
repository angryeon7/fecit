//
//  CalendarHeaderView.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct CalendarHeaderView: View {
    @ObservedObject public var viewModel: CalendarViewModel

    var body: some View {
        HStack {
            Button {
            } label: {
                Text("Today")
            }
            .padding(.leading, 10)
            .foregroundColor(.white)
            
            Spacer()

            Text(viewModel.formattedDate)
                .foregroundColor(Color.white)
                .font(.title2)

            Spacer()

            HStack(spacing: 15) {
                Button(action: {

                }) {
                    Image(systemName: "ellipsis.rectangle")
                      .foregroundColor(.white)
                }
                
                Button(action: {

                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                }
            }         
            .padding(.trailing, 10)
        }.background(Color("MainBlue"))
    }
}
