extends Node


var default_lvl = 1
var max_lvl = 5
var lvl = 1

const default_hp = 10
var max_hp = 10
var hp = 10

var default_dmg = 1
var dmg = 1

var default_vote = 0
var vote = 0

func _process(delta):
	if vote == 10:
		lvl = 2
		max_hp = 100
		hp = max_hp
		dmg = 10
	if vote == 110:
		lvl = 3
		max_hp = 1000
		hp = max_hp
		dmg = 100
	if vote == 1110:
		lvl = 4
		max_hp = 10000
		hp = max_hp
		dmg = 1000
	if vote >= 11110:
		get_tree().change_scene_to_file("EndGame.tscn")
		
func reset():
	vote = default_vote
	lvl = default_lvl
	hp = default_hp
	max_hp = default_hp
	dmg = default_dmg
