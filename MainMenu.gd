extends CanvasLayer



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://MainGame.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
