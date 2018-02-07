shader_type canvas_item;

uniform float default_hue = 15;
uniform vec4 replace_color : hint_color;

vec4 rgba2hsva(vec4 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec4(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x, c.a);
}

vec4 hsva2rgba(vec4 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return vec4(c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y), c.a);
}

vec4 change_color(vec4 rgba) {
	vec4 hsva = rgba2hsva(rgba);

	float current_hue = hsva.x * 360.0;
	float hue_difference = abs(current_hue - default_hue);

	if (hue_difference <= 1.0) {
		hsva.x = rgba2hsva(replace_color).x;
		rgba = hsva2rgba(hsva);
	}
	
	return rgba;
}

void fragment() {
	vec4 rgba = texture(TEXTURE, UV);
	rgba = change_color(rgba);
	COLOR = rgba;
}