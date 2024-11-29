//
//  EventRow.swift
//  DatePlanerApp
//
//  Created by Muhammad Zeeshan on 30/11/2024.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(systemName: event.symbol)
                .foregroundStyle(event.color)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
            
            if event.isCompleted {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundStyle(.secondary)
            }
        }
        .badge(event.remainingTaskCount)
    }
}

#Preview {
    EventRow(event: Event.example)
}
