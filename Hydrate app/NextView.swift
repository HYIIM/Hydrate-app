//
//  NextView.swift
//  Hydrate app
//
//  Created by HY on 17/04/1446 AH.
//

import SwiftUI

struct NotificationPreferencesView: View {
    @State private var startHour = Date() // For start time
    @State private var endHour = Date()   // For end time
    @State private var selectedInterval = 15 // For notification interval

    // Define available intervals (in minutes)
    let intervals = [15, 30, 60, 90, 120, 180, 240, 300]
    
    var body: some View {
        VStack(alignment: .leading) {
            // العنوان
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold).padding(.bottom)
            
            // شرح الفقره
            Text("The start and End hour")
                .font(.headline)
            
            Text("Specify the start and end date to receive the notifications")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                //.padding(.horizontal, 10)
                .frame(minHeight: 42)
            
            // وقت البدايه والنهايه هنا
            VStack (spacing: 15) {
                HStack {
                    Text("START HOUR ")
                    Spacer()
                    DatePicker("", selection: $startHour, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                HStack {
                    Text("END HOUR")
                  Spacer()
                    DatePicker("", selection: $endHour, displayedComponents: .hourAndMinute)
                       .labelsHidden()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            }
      
            // Notification Interval Buttons
            VStack(alignment: .leading, spacing: 0.5) {
                // Notification Interval Section
                Text("Notification interval")
                    .font(.headline)
                
                Text("How often would you like to receive notifications within the specified time interval?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                //.multilineTextAlignment()
                //.padding()
                    .frame(minHeight: 70)
            }.padding(.vertical)
       
            
            // Notification Interval Buttons
            VStack(spacing: 10) {
     
                let columns = [GridItem(.adaptive(minimum: 82))]
                // Grid layout
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(intervals, id: \.self) { interval in
                        Button(action: {
                            selectedInterval = interval
                        }) {
                            Text("\(interval < 100 ? "\(interval)" : "\(interval / 50)") \(interval < 100 ? "Mins" : "Hours")")// حساب الوقت بين التنبيهات يجي من هنا
                                .fontWeight(selectedInterval == interval ? .bold : .regular)
                                .foregroundColor(selectedInterval == interval ? .white : .black)
                                .frame(width: 75, height: 75)
                                .background(selectedInterval == interval ? Color.blue : Color(.systemGray6))
                                .cornerRadius(10)
                        }
                    }
                }
            }.padding(.bottom)

            
            // Start Button
            Button(action: {
                // Start action here
                print("Start pressed")
            }) {
                Text("Start")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }.padding(.top)
        }
        .padding() // General padding for the view
    }
}

struct NotificationPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationPreferencesView()
    }
}

#Preview {
    NotificationPreferencesView()
}
