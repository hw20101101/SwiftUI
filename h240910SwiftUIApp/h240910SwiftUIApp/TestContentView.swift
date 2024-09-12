//
//  Test.swift
//  h240910SwiftUIApp
//
//  Created by hwacdx on 2024/9/12.
//

import SwiftUI

struct ContentView2: View {
    
    var body: some View {
        
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
        }
        .padding()
    }
}

#Preview {
    ContentView2()
}
