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
  
    @ObservedObject var bw: BW
    
    var dailyGoal: Double {
        if let weight = Double(bw.bodyWeight) {
            return weight * 0.03
        } else {
            return 0.0 // Return a default value if conversion fails
        }
    }


  
    @State private var currentWaterIntake: Double = 0.0
  
    var body: some View {
        NavigationView{
            VStack(spacing: 70) {
                
                // Display today's water intake and goal
                VStack(alignment: .leading) { 
                    
                    // Align content to the left
                    Text("Today's Water Intake")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    HStack{
                        Text("\(String(format: "%.1f", currentWaterIntake)) liter")
                            .font(.title2)
                            .fontWeight(.bold).foregroundColor(String(format: "%.1f", currentWaterIntake) >= String(format: "%.1f", dailyGoal) ? Color(.green) : Color(.black))
  
                        // Tolerance for floating-point comparison
                        
                        Text("/ \(String(format: "%.1f", dailyGoal)) liter") .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                .padding().frame(maxWidth: .infinity, alignment: .leading) 
              
                Spacer()
              
               
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
                            
                            switch currentWaterIntake {
                            case  0.0:
                                return Image(systemName: "zzz")
                                    .scaleEffect(3).foregroundColor(.yellow)
                                
                            case  0.1...0.5:
                                return Image(systemName: "tortoise.fill")
                                    .scaleEffect(3).foregroundColor(.yellow)
                                
                            case  0.5...dailyGoal:
                                return Image(systemName: "hare.fill")
                                    .scaleEffect(3).foregroundColor(.yellow)
                                
                            case dailyGoal...(dailyGoal + 0.1):
                                return Image(systemName: "hands.clap.fill")
                                    .scaleEffect(3).foregroundColor(.yellow)
                                
                            default: return Image(systemName: "")
                                    .scaleEffect(3).foregroundColor(.yellow)
                            }
                            
                        }()
                        )
                }
                .scaleEffect(1.5)
              
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
                            
                            .font(.largeTitle)
                           
                    }.padding()
                    
                    Divider().frame(width: 2, height: 30)
                    
                    Button(action: {
                        if currentWaterIntake < dailyGoal {
                            currentWaterIntake += 0.1  // Increase by 0.1 liters
                        }
                    }) {
                        Text("+")
                            .font(.largeTitle)
                    }.padding()
                        .disabled(currentWaterIntake >= dailyGoal)
                    
                }.frame(width: 120, height: 50).foregroundColor(currentWaterIntake >= dailyGoal ? Color.gray: Color.black).foregroundColor(.black)  .background(Color(.systemGray6))
                    .cornerRadius(10)
                
            }
            .padding()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    WaterIntakeView(bw: BW())
}
