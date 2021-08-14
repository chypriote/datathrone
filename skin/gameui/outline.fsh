varying vec2 v_texCoord;
varying vec4 v_fragmentColor;
uniform float outlineColor_x;
uniform float outlineColor_y;
uniform float outlineColor_z;
uniform float u_threshold;
uniform float u_radius;
void main()
{
    float radius = u_radius;
    vec4 accum = vec4(0.0);
    vec4 normal = vec4(0.0);
    vec3 outlineColor = vec3(outlineColor_x,outlineColor_y,outlineColor_z);
    normal = texture2D(CC_Texture0, vec2(v_texCoord.x, v_texCoord.y));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x - radius, v_texCoord.y - radius));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x + radius, v_texCoord.y - radius));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x + radius, v_texCoord.y + radius));
    accum += texture2D(CC_Texture0, vec2(v_texCoord.x - radius, v_texCoord.y + radius));
    accum *= u_threshold;
    accum.rgb =  outlineColor * accum.a;
    accum.a = 0.0;
    normal = ( accum * (1.0 - normal.a)) + (normal * normal.a);
    gl_FragColor = v_fragmentColor * normal;
}
