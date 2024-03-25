extends CanvasLayer




func _ready():
	if PlayerStats.hp <= 0:
		$Node2D2.visible = true
		$Menu/State.text = "You Lose"
	elif PlayerStats.hp > 0:
		$Node2D.visible = true
		$Menu/State.text = "You Win"
		
func _on_restart_pressed():
	PlayerStats.reset()
	$Node2D2.visible = false
	$Node2D.visible = false
	get_tree().change_scene_to_file("res://MainGame.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
