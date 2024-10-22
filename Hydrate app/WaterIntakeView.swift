//
//  WaterIntakeView.swift
//  Hydrate app
//
//  Created by HY on 17/04/1446 AH.
//

import SwiftUI
extension Color{
    init(hex:  String){
        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb >> 0xFF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct WaterIntakeView: View {
    @State private var currentWaterIntake: Double = 0.0
    let dailyGoal: Double = 2.7  // Set your daily goal, e.g., 2.7 liters
    
    var body: some View {

        VStack(spacing: 70) {
            // Display today's water intake and goal
            VStack(alignment: .leading) {  // Align content to the left
                Text("Today's Water Intake")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack{
                    Text("\(String(format: "%.1f", currentWaterIntake)) liter")
                        .font(.title2)
                        .fontWeight(.bold)                .foregroundColor(abs(currentWaterIntake - 2.7) < 0.001 ? Color(.green) : Color(.black))  // Tolerance for floating-point comparison
                    
                    Text("/ \(String(format: "%.1f", dailyGoal)) liter") .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding().frame(maxWidth: .infinity, alignment: .leading)  // Align VStack to the left
 Spacer()
            // Circular Progress Ring (Fake for now, we will adjust the progress dynamically)
            ZStack {
                
                Circle()
                    .stroke(Color(.systemGray6), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                // Progress Circle
                Circle()
                    .trim(from: 0, to: CGFloat(min(currentWaterIntake / dailyGoal, 1.0)))  // Dynamic progress based on intake
                    .stroke(Color.cyan, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                    .rotationEffect(Angle(degrees: -90))  // Start from the top
                    .frame(width: 200, height: 200).background( {
                        
                        switch currentWaterIntake{
                        case  0.0:
                            return Image(systemName: "zzz").resizable()
                                .scaleEffect(0.4).foregroundColor(.yellow)
                            
                        case  0.1...0.5:
                            return Image(systemName: "tortoise.fill").resizable()
                                .scaleEffect(0.4).foregroundColor(.yellow)
                            
                        case  0.5...2.7:
                        return Image(systemName: "hare.fill").resizable()
                                .scaleEffect(0.4).foregroundColor(.yellow)

                        case  2.7...2.8:
                        return Image(systemName: "hands.clap.fill").resizable()
                                .scaleEffect(0.4).foregroundColor(.yellow)
                            
                        default: return Image(systemName: "").resizable()
                                .scaleEffect(0.4).foregroundColor(.yellow)
                            
                        }
                        
                    }()
                    )
                
            
                
            }
            .scaleEffect(1.5)
            //.padding()
            Spacer()

            // Display current intake in large text
            Text("\(String(format: "%.1f", currentWaterIntake)) L")
                .font(.title)
                .fontWeight(.bold)
            
            // Increment and Decrement Buttons
            HStack() {
                Button(action: {
                    if currentWaterIntake > 0 {
                        currentWaterIntake -= 0.1  // Decrease by 0.1 liters
                    }
                }) {
                    Text("-")
                        .frame(width: 50, height: 50)
                        .font(.largeTitle)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
                
                Button(action: {
                    if currentWaterIntake < dailyGoal {
                        currentWaterIntake += 0.1  // Increase by 0.1 liters
                    }
                }) {
                    Text("+")
                        .frame(width: 50, height: 50)
                        .font(.largeTitle)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                }
            }

        }
        .padding()

    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}

#Preview {
    WaterIntakeView()
}
