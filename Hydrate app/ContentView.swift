//
//  ContentView.swift
//  Hydrate app
//
//  Created by HY on 17/04/1446 AH.
//

import SwiftUI

struct HydrateView: View {
    @State private var bodyWeight: String = ""  
    // State variable to track the body weight input
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            
            Image(systemName: "drop.fill")
                .font(.system(size: 50))
                .foregroundColor(.blue)
            // العنوان
            Text("Hydrate")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            //  الكلام المكتوب
            Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 30)
            
            // التكست فيلد الي احط فيه الوزن
            TextField("Body weight", text: $bodyWeight)
                .keyboardType(.decimalPad) // Ensure it takes numerical input
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 30)
            
            // زر النكست
            Button(action: {
                // اكشن الزر
                print("Next button pressed, body weight: \(bodyWeight)")
            }) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }
        }
        .padding() 
        // General padding for the view
    }
}

struct HydrateView_Previews: PreviewProvider {
    static var previews: some View {
        HydrateView()
    }
}

