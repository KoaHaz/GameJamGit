shader_type canvas_item;

uniform float speed = 0.02;
void vertex() {
	UV.x += TIME * speed;
}


