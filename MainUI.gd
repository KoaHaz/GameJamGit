extends CanvasLayer


func _process(delta):
	$Panel/Health.text = "HP: " + str(PlayerStats.hp) + "/" + str(PlayerStats.max_hp)
	$Panel/Level.text = "LEVEL: " + str(PlayerStats.lvl)
	$Panel/Damage.text = "DAMAGE: " + str(PlayerStats.dmg)
	$Panel/Vote.text = "VOTE: " + str(PlayerStats.vote)


func _on_restart_pressed():
	PlayerStats.reset()
	get_tree().change_scene_to_file("res://MainGame.tscn")


func _on_quit_pressed():
	get_tree().quit()
