extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const KNOCK_BACK = 200.0
signal hp_changed
@onready var character = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_attacking = false
var is_hit = false

func _physics_process(delta):
	if PlayerStats.hp <= 0:
		character.play("die")
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y < 0:
			character.play("up")
		elif velocity.y > 0:
			character.play("down")
	if not is_attacking and not is_hit:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		# Get the input direction and handle the movement/deceleration.
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
			character.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if is_on_floor():
				character.play("idle")
		# Character facing direction
		if direction == 1 :
			character.flip_h = false
		elif direction == -1:
			character.flip_h = true
	if Input.is_action_just_pressed("Attack") and not is_hit:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		is_attacking = true
		$AttackArea/CollisionShape2D.disabled = false
		character.play("attack1")
	move_and_slide()

func _on_animated_sprite_2d_animation_finished():
	if character.animation == "attack1":
		$AttackArea/CollisionShape2D.disabled = true
		is_attacking = false
	if character.animation == "hurt":
		is_hit = false
	if character.animation == "die":
		get_tree().change_scene_to_file("res://EndGame.tscn")
		
func _on_body_area_area_entered(area):
	if area.is_in_group("enemy1_attack"):
		velocity.x = move_toward(velocity.x, 0, SPEED)
		is_hit = true
		character.play("hurt")
		hp_changed.emit()
		velocity.x -= lerp(velocity.x, KNOCK_BACK, 0.5)
