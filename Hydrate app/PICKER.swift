//
//  PICKER.swift
//  Hydrate app
//
//  Created by HY on 26/04/1446 AH.
//

import SwiftUI

struct TimePickerView: View {
    // State variables for hour, minute, and AM/PM selections
    @State private var selectedHour: Int = 12
    @State private var selectedMinute: Int = 0
    @State private var amPm: String = "AM"
    
    // Arrays for hours and minutes
    private let hours = Array(1...12)
    private let minutes = Array(0...59)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Start Hour")
                .font(.headline)
            HStack {
                // Hour Picker (1-12)
                Picker("Hour", selection: $selectedHour) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .frame(width: 50)
                .clipped()
                // Minute Picker (0-59)
                Picker("Minute", selection: $selectedMinute) {
                    ForEach(minutes, id: \.self) { minute in
                        Text(String(format: "%02d", minute)).tag(minute)
                    }
                }
                .frame(width: 50)
                .clipped()
                
                // AM/PM Picker
                Picker("AM/PM", selection: $amPm) {
                    Text("AM").tag("AM")
                    Text("PM").tag("PM")
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 100)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    TimePickerView()
}
