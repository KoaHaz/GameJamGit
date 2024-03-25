extends CharacterBody2D

const KNOCKBACK = 50.0
var dead = false
var default_hp = 100
var speed = 500
var dmg = 10
var hp = default_hp
var is_hit = false
var is_attacking = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player = null
var chase = false
@onready var enemy = $AnimatedSprite2D

func _process(delta):
	if not dead and chase:
		if not is_attacking and not is_hit:
			position.x += (player.position.x - position.x)/speed
			enemy.play("walk")

func _on_animated_sprite_2d_animation_finished():
	if enemy.animation == "die":
		PlayerStats.vote += 10
		self.queue_free()
	if enemy.animation == "hurt":
		is_hit = false
	if enemy.animation == "attack1":
		is_attacking = false

func _on_attack_area_area_entered(area):
	if area.is_in_group("player_body"):
		PlayerStats.hp -= dmg
		is_attacking = true
		enemy.play("attack1")
		is_attacking = false

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_attack"):
		hp -= PlayerStats.dmg
		if hp <= 0:
			dead = true
			enemy.play("die")
		if hp > 0:
			is_hit = true
			enemy.play("hurt")
			position.x += lerp(position.x, KNOCKBACK, 1)
			is_hit = false

func _on_player_detection_area_entered(body):
	if body.is_in_group("player_body"):
		player = body
		chase  = true

