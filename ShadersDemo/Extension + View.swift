//
//  Extension + View.swift
//  ShadersDemo
//
//  Created by Vasichko Anna on 21.07.2023.
//

import SwiftUI

extension View {
    func magenta() -> some View {
        let function = ShaderFunction(library: .default, name: "magenta")
        let shader = Shader(function: function, arguments: [])
        return self.colorEffect(shader)
    }
    
    func noise(seconds: Double) -> some View {
        let function = ShaderFunction(library: .default, name: "noise")
        let shader = Shader(
            function: function,
            arguments: [
                .float(seconds)
            ]
        )
        
        return self.colorEffect(shader)
    }
    
    func gradientSubstract() -> some View {
//        let function = ShaderFunction(library: .default, name: "gradientSubtract")
//        let shader = Shader(function: function, arguments: [
//            .boundingRect
//            ]
//        )
//        return self.layerEffect(shader, maxSampleOffset: .zero)
        
        self.layerEffect(
                    ShaderLibrary.default.gradientSubtract(.boundingRect),
                    maxSampleOffset: .zero
                )
    }
    
    func wave(seconds: Double, speed: Double, frequency: Double, amplitude: Double) -> some View {
        self.distortionEffect(
            ShaderLibrary.wave(
                .float(seconds),
                .float(speed),
                .float(frequency),
                .float(amplitude)
            ),
            maxSampleOffset: .zero
        )
    }
}
