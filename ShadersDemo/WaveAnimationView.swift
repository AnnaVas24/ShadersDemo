//
//  WaveAnimationView.swift
//  ShadersDemo
//
//  Created by Vasichko Anna on 21.07.2023.
//

import SwiftUI

struct WaveAnimationView: View {
    @State private var speed = 1.0
    @State private var amplitude = 5.0
    @State private var frequency = 10.0
   
    private let startDate = Date()
    
    var body: some View {
        VStack {
            TimelineView(.animation) { _ in
                Image(systemName: "cloud.circle.fill")
                    .font(.system(size: 300))
                    .wave(
                        seconds: startDate.timeIntervalSinceNow,
                        speed: speed,
                        frequency: frequency,
                        amplitude: amplitude
                    )
            }
            
            SliderView(value: $speed, animationName: "Speed")
            SliderView(value: $frequency, animationName: "Frequency")
            SliderView(value: $amplitude, animationName: "Amplitude")
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    WaveAnimationView()
}


struct SliderView: View {
    @Binding var value: Double
    let animationName: String
    
    
    var body: some View {
        VStack(alignment: .leading) {
           
                Text(animationName)
                    .font(.title)
                    .bold()
          
            
            Slider(value: $value, in: 1...20)
        }
    }
}
