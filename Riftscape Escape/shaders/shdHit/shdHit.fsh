//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float flash;

void main() {
	 vec4 base = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
	 gl_FragColor = mix(base, vec4(1.0,1.0,1.0,base.a), flash);
}
