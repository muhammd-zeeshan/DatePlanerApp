//
//  SymbolPicker.swift
//  DatePlanerApp
//
//  Created by Muhammad Zeeshan on 30/11/2024.
//

import SwiftUI

struct SymbolPicker: View {
    @Binding var event: Event
    @State private var selectedColor: Color = ColorOptions.default
    @Environment(\.dismiss) private var dismiss
    @State private var synbolNames = EventSymbols.symbolName
    @State private var searchInput = ""
    
    var columns = Array(repeating: GridItem(.flexible()), count: 6)
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
                .padding()
            }
            HStack {
                Image(systemName: event.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)
            }
            .padding()
            
            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
                        event.color = color
                    } label: {
                        Circle()
                            .foregroundStyle(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)
            
            Divider()
            
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(synbolNames, id: \.self) { symbolItem in
                        Button {
                            event.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .foregroundStyle(selectedColor)
                                .padding(5)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
            selectedColor = event.color
        }
    }
}

#Preview {
    SymbolPicker(event: .constant(Event.example))
}
