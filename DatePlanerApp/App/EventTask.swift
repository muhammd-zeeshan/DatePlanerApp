//
//  EventTask.swift
//  DatePlanerApp
//
//  Created by Muhammad Zeeshan on 28/11/2024.
//

import Foundation


struct EventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
