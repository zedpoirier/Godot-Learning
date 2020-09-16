shader_type canvas_item;

uniform vec3 colorA = vec3(0.149,0.141,0.912);
uniform vec3 colorB = vec3(1.000,0.833,0.224);
const float TWO_PI = 6.28318530718;

vec3 hsb2rgb(vec3 c){
    vec3 rgb = clamp(abs(mod(c.x*6.0+vec3(0.0,4.0,2.0), 6.0) -3.0) -1.0, 0.0, 1.0);
    rgb = rgb*rgb*(3.0-2.0*rgb);
    return c.z * mix(vec3(1.0), rgb, c.y);
}


void fragment(){	
	// Use polar coordinates instead of cartesian
	vec3 color = vec3(0);
    vec2 toCenter = vec2(0.5)-UV;
    float angle = atan(toCenter.y,toCenter.x);
	angle += TIME;
    float radius = length(toCenter)*2.0;

    // Map the angle (-PI to PI) to the Hue (from 0 to 1)
    // and the Saturation to the radius
    color = hsb2rgb(vec3((angle/TWO_PI)+0.5,0.8,1.0-radius));
	
	float circle = 1.0 - step(radius, 0.9);
	color = mix(color, vec3(0), circle);
	
	COLOR = vec4(color, 1);
}