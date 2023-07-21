//
//  NoiseAnimationView.swift
//  ShadersDemo
//
//  Created by Vasichko Anna on 21.07.2023.
//

import SwiftUI

struct NoiseAnimationView: View {
    private let startDate = Date()
    
    var body: some View {
        TimelineView(.animation) { context in
            Image(systemName: "cloud.circle.fill")
                .font(.system(size: 300))
                .noise(seconds: startDate.timeIntervalSinceNow)
        }
    }
}

#Preview {
    NoiseAnimationView()
}
