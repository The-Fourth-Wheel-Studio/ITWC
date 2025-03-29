shader_type spatial;

uniform sampler2D text: filter_nearest;
uniform vec4[3] palette;

void vertex() {
	// Called for every vertex the material is visible on.
}

float noise(vec2 input)
{
	return fract(sin(dot(input, vec2(12.25, 10.356)) * 23.12)*1054.52) * 100.0;
}

void fragment() {
	
	int paletteKey = int(mod(noise(vec2(texture(text, UV).r, NODE_POSITION_WORLD.x + NODE_POSITION_WORLD.y)),3));
	ALBEDO = palette[paletteKey].xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
