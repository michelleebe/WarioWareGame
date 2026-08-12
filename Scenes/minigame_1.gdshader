shader_type canvas_item;

uniform float speed : hint_range(0.0, 0.15) = 0.05;

void fragment() {
    vec2 moved_uv = UV;
    moved_uv.y += TIME * speed;
	moved_uv.x += TIME * speed;
	
    moved_uv.x = fract(moved_uv.x);

    COLOR = texture(TEXTURE, moved_uv);
}
