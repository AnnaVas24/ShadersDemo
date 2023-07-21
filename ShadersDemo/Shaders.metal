//
//  Shaders.metal
//  ShadersDemo
//
//  Created by Vasichko Anna on 21.07.2023.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;


[[stitchable]] half4 magenta(float2 position, half4 color) {
    return half4(199.0/255.0, 85.0/255.0, 212.0/255.0, 1.0);
}

[[ stitchable ]] half4 noise(float2 position, half4 currentColor, float time) {
    float value = fract(sin(dot(position + time, float2(12.9898, 78.233))) * 43758.5453);
    return half4(value, value, value, 1) * currentColor.a;
}

[[ stitchable ]] half4 gradientSubtract(float2 position, SwiftUI::Layer layer, float4 bounds) {
    float2 uv = position / bounds.zw;
    half4 pixelColor = layer.sample(position);
    float offset = 0.5;
    return pixelColor - half4(uv.x * offset, uv.y * offset, 0, 0);
}

[[stitchable]] float2 wave(float2 position, float time, float speed, float frequency, float amplitude) {
    float positionY = position.y + sin((time * speed) + (position.x / frequency)) * amplitude;
    return float2(position.x, positionY);
}
