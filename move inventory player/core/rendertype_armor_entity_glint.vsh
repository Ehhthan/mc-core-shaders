#version 150

#moj_import <fog.glsl>
#moj_import <util.glsl>

in vec3 Position;
in vec2 UV0;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat4 TextureMat;

out float vertexDistance;
out vec2 texCoord0;

void main() {
    if(isInvTopAlt(ProjMat)) { // detects it's being rendered in their inventory
		gl_Position = (ProjMat * ((ModelViewMat * vec4(Position, 1.0))  + INV_OFFSET)); // offset
	} else {
		gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
	}

    vertexDistance = cylindrical_distance(ModelViewMat, Position);
    texCoord0 = (TextureMat * vec4(UV0, 0.0, 1.0)).xy;
}
