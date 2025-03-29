shader_type spatial;

uniform sampler2D roofTexture;
uniform sampler2D roofVariationTexture : filter_nearest;
uniform vec4[3] palette;

vec3 blendColors(vec4 colA, vec4 colB) {
    float alphaFinal = colA.a + colB.a * (1.0 - colA.a);
    return (colA.rgb * colA.a + colB.rgb * colB.a * (1.0 - colA.a)) / max(alphaFinal, 0.0001);
}

void vertex() {
	// Called for every vertex the material is visible on.
}

float noise(vec2 input)
{
	return fract(sin(dot(input, vec2(12.25, 10.356)) * 23.12)*1054.52) * 100.0;
}

void fragment() {
	
	int paletteKey = int(mod(noise(vec2(texture(roofVariationTexture, UV).r, NODE_POSITION_WORLD.y + NODE_POSITION_WORLD.x + NODE_POSITION_WORLD.z)),3));
	vec4 roofTextureWithoutVariation = texture(roofTexture, UV);
	ALBEDO = blendColors(roofTextureWithoutVariation,palette[paletteKey]).xyz;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
