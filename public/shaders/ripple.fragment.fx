#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    vec2 scaled_uv = model_uv * 2.0 - vec2(1.0); 
    float magnitude = length(scaled_uv);
    float radius = pow(magnitude, 2.0);
    vec2 text_coord_offset = scaled_uv * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;
    vec2 text_coord = model_uv + text_coord_offset;

    FragColor = texture(image, text_coord);
}
