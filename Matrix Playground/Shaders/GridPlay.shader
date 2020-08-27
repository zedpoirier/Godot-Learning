shader_type canvas_item;

uniform float time_value = 1.0;
uniform vec2 amplitude = vec2(20.0, 20.0);
uniform vec2 divisions = vec2(2.0, 2.0);
uniform vec4 matVals = vec4(1.0, 0.0, 0.0, 1.0);

void vertex(){
	//VERTEX.x += cos(TIME * time_value) * amplitude.x;
	//VERTEX.y += sin(TIME * time_value) * amplitude.y;
}

void fragment(){
	vec2 altUV = UV * divisions;
	mat2 m = mat2(vec2(matVals.x, matVals.y), vec2(matVals.z, matVals.w));
	altUV *= m;
	altUV = fract(altUV);
	vec2 top = step(vec2(0.95), altUV);
	vec2 bot = step(altUV, vec2(0.05));
	vec2 res = top + bot;
	COLOR = vec4(res.y, res.x, altUV.y, 1.0);
}