extends TextureProgressBar


func _process(delta):
	var hp = PlayerStats.hp
	var max = PlayerStats.max_hp
	value = hp * 100 / max
