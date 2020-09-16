shader_type canvas_item;

uniform float value = 0.0;
uniform vec2 amplitude = vec2(20.0, 20.0);
uniform vec2 divisions = vec2(2.0, 2.0);
uniform float twist = 0.0;
uniform mat2 rot90ccw = mat2(vec2(0.0, 1.0), vec2(1.0, 0.0));
uniform mat2 bosCorrection = mat2(vec2(1.0, 0.0), vec2(0.0, -1.0));

mat2 rotate2d(float _angle){
    return mat2(vec2(cos(_angle),-sin(_angle)),
                vec2(sin(_angle),cos(_angle)));
}

void fragment(){
	vec2 altUV = UV;
	altUV -= amplitude.x;
	altUV += amplitude.y;
	float dist = length(altUV);
	dist *= value;
	altUV *= mat2(vec2(altUV.x * value, 0), vec2(0, altUV.y * value));

	
	altUV *= divisions;
	altUV = fract(altUV);
	vec2 top = step(vec2(0.95), altUV);
	vec2 bot = step(altUV, vec2(0.05));
	vec2 res = top + bot;
	COLOR = vec4(res.y, res.x, 0, 1.0);
}