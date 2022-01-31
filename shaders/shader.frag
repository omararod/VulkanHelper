#version 450

layout(binding = 1) uniform sampler2D texSampler;

layout(location = 0) in vec3 fragColor;
layout(location = 1) in vec2 fragTexCoord;

layout(location = 0) out vec4 outColor;

void main() {
    //outColor = normalize(vec4(fragColor,1) * texture(texSampler, fragTexCoord));
	//outColor = vec4(fragColor,1) ;
	outColor = texture(texSampler, fragTexCoord);
}