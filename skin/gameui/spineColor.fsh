#ifdef GL_ES
precision mediump float;
#endif
varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
uniform float ratio_r;
uniform float ratio_g;
uniform float ratio_b;
void main(void)
{
vec4 c = texture2D(CC_Texture0, v_texCoord);
gl_FragColor.xyz = vec3(ratio_r*c.r + ratio_g*c.g + ratio_b*c.b);
gl_FragColor.w = c.w;
}