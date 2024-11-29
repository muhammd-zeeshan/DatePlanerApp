//
//  EventList.swift
//  DatePlanerApp
//
//  Created by Muhammad Zeeshan on 28/11/2024.
//

import SwiftUI

struct EventList: View {
    @EnvironmentObject var eventData: EventData
    @State private var isAddingnewEvent = false
    @State private var newEvent = Event()
    
    var body: some View {
        List {
            ForEach(Period.allCases) { period in
                if !eventData.sortedEvents(period: period).isEmpty {  // MARK: Check that the current Time period contains at least                                                      one event , otherwise don't show any data for it.
                    Section { // create section for specific event period list
                        ForEach(eventData.sortedEvents(period: period)) { $event in
                            NavigationLink {
                                EventEditor(event: $event)
                            } label: {
                                EventRow(event: event)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    eventData.delete(event)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    } header: {
                        Text(period.name)
                            .font(.callout)
                            .foregroundStyle(.secondary)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .navigationTitle("Date Planner")
        .toolbar {
            
        }
    }
}

#Preview {
    EventList()
        .environmentObject(EventData())
}
