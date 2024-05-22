#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    vec2 scaled_uv = model_uv * 1.5 - vec2(0.5); 
    float theta = atan(scaled_uv.y, scaled_uv.x);
    float magnitude = length(scaled_uv);
    float radius = pow(magnitude, 1.0);
    vec2 grid = vec2(radius * cos(theta),  radius * sin(theta));
    vec2 grid_out = 2.0 * (grid + 1.0);

    FragColor = texture(image, grid_out);
}
