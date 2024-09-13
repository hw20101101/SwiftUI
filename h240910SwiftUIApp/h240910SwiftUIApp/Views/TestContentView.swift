//
//  Test.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/12.
//

import SwiftUI

struct ContentView2: View {
    
    var body: some View {
        
        VStack {
            
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Text("California")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                
                Text("Desc text goes here.")
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ContentView2()
}
