//
//  ContentView.swift
//  Hydrate app
//
//  Created by HY on 17/04/1446 AH.
//

import SwiftUI

class BW: ObservableObject{
    @Published var bodyWeight: String = ""
}

struct HydrateView: View {
    @StateObject var bw = BW()
    //@State var bodyWeight: String = ""
    // State variable to track the body weight input
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                Image(systemName: "drop.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.cyan)
                // العنوان
                Text("Hydrate")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                //  الكلام المكتوب
                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                //.multilineTextAlignment(.leading)
                //.padding(.horizontal, 30)
    
                HStack{
                    Text("Body weight")
                        .padding() // Adjust font as desired
                    // التكست فيلد الي احط فيه الوزن
                    TextField("", text: $bw.bodyWeight)
                        .keyboardType(.decimalPad) // Ensure it takes numerical input
                        .padding()
                    
                    //.padding(.horizontal, 30)
                    
                    // زر الاكس الصغير
                    
                    if !bw.bodyWeight .isEmpty {
                        Button(action: {
                            bw.bodyWeight = ""
                        }){
                            Image(systemName:"xmark.circle.fill")
                                .foregroundColor(.gray)
                        }.padding()
                    }
                }  .background(Color(.systemGray6))
                
                //.padding(.horizontal, 1)
                // زر النكست
                Spacer()
                
                NavigationLink(destination: NotificationPreferencesView(bw: bw)) {
                    HStack{
                        Text("Next")
                        
                        //.padding(.horizontal, 30)
                    }   .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.cyan))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding() }
        // General padding for the view
    }
}
struct HydrateView_Previews: PreviewProvider {
    static var previews: some View {
        HydrateView()
    }
}





