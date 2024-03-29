#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;
layout(location = 3) in vec3 inNormals;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    vec4 light = vec4(0,0,1,1);
	vec4 transformedNormals =  ubo.proj * ubo.view * ubo.model *vec4(inNormals,1);
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(inPosition, 1.0);
	//gl_Position = vec4(inPosition, 1.0);
    //fragColor = max(dot(inNormals.xyz,light.xyz),0)*inColor;
	fragColor = inColor;
    fragTexCoord = inTexCoord;
}