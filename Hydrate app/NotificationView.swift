//
//  NotificationView.swift
//  Hydrate app
//
//  Created by HY on 26/04/1446 AH.
//
import SwiftUI

struct NotificationView: View {
    var title: String
    var message: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.orange)
            
            Text(message)
                .font(.body)
                .foregroundColor(.orange)
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [8]))
                .foregroundColor(.orange.opacity(0.5))
        )
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            NotificationView(
                title: "Reminder Notification (iOS)",
                message: "Hey there! It's time to hydrate. You're close to reaching today's water goal. Take a sip to stay on track!"
            )
            
            NotificationView(
                title: "Motivational Notification (iOS)",
                message: "Great job on staying hydrated! Keep up the good work. Every sip brings you closer to your health goals!"
            )
            
            NotificationView(
                title: "Achievement Notification (iOS)",
                message: "You're almost there! Just a few more sips to go to reach today's water goal. You're doing fantastic!"
            )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
