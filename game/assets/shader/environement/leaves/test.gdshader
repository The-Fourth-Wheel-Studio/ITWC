shader_type spatial;

uniform vec3 Albedo : source_color = vec3(1, 1, 1);
uniform float Roughness : hint_range(0.0, 1.0) = 1.0;
uniform float Metallicness : hint_range(0.0, 1.0) = 0.0;
uniform sampler2D leaveTexture;
uniform vec3 pos;

varying vec4 vertex_world;
varying vec3 Vertex;

// Fonctions utilitaires
float DistributionGGX(float cos_theta_m, float alpha) {
    float alpha2 = alpha * alpha;
    float d = 1.0 + (alpha2 - 1.0) * cos_theta_m * cos_theta_m;
    return alpha2 / (PI * d * d);
}

float GeometryGGX(float NdotL, float NdotV, float alpha) {
    return 0.5 / mix(2.0 * NdotL * NdotV, NdotL + NdotV, alpha);
}

vec3 SchlickBaseReflectivity(float metallics, float speculars, vec3 albedos) {
    float dielectric = 0.04 * speculars * speculars;
    return mix(vec3(dielectric), albedos, vec3(metallics));
}

float SchlickFresnel(float u) {
    float m = 1.0 - u;
    float m2 = m * m;
    return m2 * m2 * m;
}

// Shader principal
void vertex() {
    // Calculer VERTEX_WORLD dans le vertex shader pour passer au fragment shader
    mat4 modified_model_view = VIEW_MATRIX * mat4(
        INV_VIEW_MATRIX[0],
        INV_VIEW_MATRIX[1],
        INV_VIEW_MATRIX[2],
        MODEL_MATRIX[3]
    );
    MODELVIEW_MATRIX = modified_model_view;
    
    // Calcule la position du vertex dans l'espace monde
    vertex_world = INV_VIEW_MATRIX * vec4(VERTEX, 1.0);
	Vertex = VERTEX;
}

void fragment() {
    // Utiliser l'albédo de base pour la couleur
	vec4 tex = texture(leaveTexture,UV);
    ALBEDO = tex.xyz * Albedo;
	ALPHA = tex.a;
	METALLIC = 0.0;
	ROUGHNESS = 1.0;
	
}

void light() {
    // Calculer une "normale sphérique" en utilisant la position locale
    vec3 spherical_normal = normalize(pos);

    // Utiliser la normale sphérique pour les calculs d'éclairage
    vec3 lightColor = LIGHT_COLOR / PI;
    vec3 half = normalize(VIEW + LIGHT);
    
    float NdotL = max(dot(spherical_normal, LIGHT), 0.0);
    float NdotV = max(dot(spherical_normal, VIEW), 0.0);
    float NdotH = max(dot(spherical_normal, half), 0.0);
    float LdotH = max(dot(LIGHT, half), 0.0);

    // Diffuse light (Lambert)
    DIFFUSE_LIGHT += NdotL * ATTENUATION * lightColor;

    // Specular light (Schlick-GGX)
    float ggxAlpha = Roughness * Roughness;
    float D = DistributionGGX(NdotH, ggxAlpha);
    float G = GeometryGGX(NdotL, NdotV, ggxAlpha);

    vec3 f0 = SchlickBaseReflectivity(Metallicness, 0.5, Albedo); // SPECULAR_AMOUNT par défaut à 0.5
    float LdotH5 = SchlickFresnel(LdotH);
    float f90 = clamp(50.0 * f0.g, 0.0, 1.0);
    vec3 F = f0 + (f90 - f0) * LdotH5;
    
    vec3 specularBRDF = max(NdotL * D * G * F, 0.0);
    SPECULAR_LIGHT += specularBRDF * LIGHT_COLOR * ATTENUATION;
}
