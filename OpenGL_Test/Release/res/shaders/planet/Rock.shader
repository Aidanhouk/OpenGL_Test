#shader vertex
#version 330 core

layout(location = 0) in vec3 aPos;
layout(location = 2) in vec2 aTexCoords;
layout(location = 3) in mat4 aInstanceMatrix;

out vec2 TexCoords;

layout(std140) uniform Matrices
{
	mat4 projection;
	mat4 view;
};

void main()
{
	TexCoords = aTexCoords;
	gl_Position = projection * view* aInstanceMatrix * vec4(aPos, 1.0f);
}

#shader fragment
#version 330 core

out vec4 FragColor;

in vec2 TexCoords;

uniform sampler2D texture_diffuse1;

void main()
{
	FragColor = texture(texture_diffuse1, TexCoords);
}