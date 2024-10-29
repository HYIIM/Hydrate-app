//
//  NextView.swift
//  Hydrate app
//
//  Created by HY on 17/04/1446 AH.
//

import SwiftUI

struct NotificationPreferencesView: View {
   
    @ObservedObject var bw: BW
    
    @State private var amPm: String = "AM"
    @State private var AmPm: String = "AM"

    @State private var startHour : Date = Date() // For start time
    @State private var endHour : Date =  Date()   // For end time
    @State private var selectedInterval = 15 // For notification interval

    // Define available intervals (in minutes)
    let intervals = [15, 30, 60, 90, 120, 180, 240, 300]
    
    var body: some View {
  
//        هنا ابدا النافيجيشن اكتب الكلمه وافتح القوس وابدا شغلي
        NavigationView{
            VStack(alignment: .leading) {
                Spacer()
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
                    .frame(minHeight: 42)
                
                // وقت البدايه والنهايه هنا، الديت بيكر
                VStack (spacing: 15) {
                    HStack {
                        
                        Text("Start Hour")
                        Spacer()
                        DatePicker("", selection: $startHour, displayedComponents: .hourAndMinute)
                            .labelsHidden().environment(\.locale, Locale(identifier: ""))
                        
                        Picker("", selection: $amPm){
                            Text("AM").tag("AM")
                            Text("PM").tag("PM")
                        }.pickerStyle(SegmentedPickerStyle()).frame(width: 100)
                        
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
//                 ماهي راضيه تضبط وتنحط ١٢ ساعه**
                    HStack {
                        Text("End Hour")
                        Spacer()
                        DatePicker("", selection: $endHour, displayedComponents: .hourAndMinute)
                            .labelsHidden().environment(\.locale, Locale(identifier: "en_GB"))
                        
                        Picker("", selection: $AmPm){
                            Text("AM").tag("AM")
                            Text("PM").tag("PM")
                        }.pickerStyle(SegmentedPickerStyle()).frame(width: 100)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                Spacer()
             
                // قسم النوتيفيكيشن
                VStack(alignment: .leading, spacing: 0.5) {
                
                    Text("Notification interval")
                        .font(.headline)
                    
                    Text("How often would you like to receive notifications within the specified time interval?")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                  
                        .frame(minHeight: 70)
                }.padding(.top)
                
         
                // Notification Interval ازرار
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
                                    .background(selectedInterval == interval ? Color.cyan : Color(.systemGray6))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                
                Spacer()
            
//هذي صفحة النافيجيت احطها قبل الزر اللي بيوديني للصفحه الثانيه واحط اسم الصفحه الثانيه فيه
                
                NavigationLink(destination: WaterIntakeView(bw: bw)) {
                    HStack{
                        Text("Start")
                        
                     
                    }   .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.cyan))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding() // General padding for the view
        }.navigationBarBackButtonHidden(true)
    }

}


#Preview {
    NotificationPreferencesView(bw: BW())
}
