shader_type canvas_item;

uniform float time_value = 1.0;
uniform vec2 amplitude = vec2(20.0, 20.0);
uniform vec2 divisions = vec2(2.0, 2.0);
uniform mat2 rot90ccw = mat2(vec2(0.0, 1.0), vec2(1.0, 0.0));
uniform mat2 bosCorrection = mat2(vec2(1.0, 0.0), vec2(0.0, -1.0));

mat2 rotate2d(float _angle){
    return mat2(vec2(cos(_angle),-sin(_angle)),
                vec2(sin(_angle),cos(_angle)));
}

float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}

float cross_bos(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/4.)) +
            box(_st, vec2(_size/4.,_size));
}

void fragment(){
	vec2 st = UV;
	vec3 color = vec3(0.0);

    // move space from the center to the vec2(0.0)
    st -= vec2(0.5);
    // rotate the space
    st = rotate2d( sin(TIME)*3.16 ) * st;
    // move it back to the original place
    st += vec2(0.5);

    // Show the coordinates of the space on the background
     color = vec3(st.x,st.y,0.0);

    // Add the shape on the foreground
    color += vec3(cross_bos(st,0.4));
	COLOR = vec4(color, 1.0);
}