//
//  ContentView.swift
//  ShadersDemo
//
//  Created by Vasichko Anna on 21.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Rectangle()
                .magenta()
                .gradientSubstract()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
