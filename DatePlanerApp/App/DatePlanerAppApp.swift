//
//  DatePlanerAppApp.swift
//  DatePlanerApp
//
//  Created by Muhammad Zeeshan on 28/11/2024.
//

import SwiftUI

@main
struct DatePlanerAppApp: App {
    @StateObject private var eventData = EventData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventList()
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
        }
    }
}
