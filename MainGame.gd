extends Node2D

var enemy1 = preload("res://enemy1.tscn")
var enemy2 = preload("res://enemy2.tscn")
var enemy3 = preload("res://enemy3.tscn")
var enemy4 = preload("res://enemy4.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var firstX = 640
	var secondX = firstX * 2
	var thirdX = firstX * 3
	var fourthX = firstX * 4
	for i in 10:
		inst(Vector2(firstX + (i * 40),300), enemy1)
		inst(Vector2(secondX + (i * 40),334), enemy2)
		inst(Vector2(thirdX + (i * 40),334), enemy3)
		inst(Vector2(fourthX + (i * 40),334), enemy4)
	
func inst(pos, enemy):
	var instance = enemy.instantiate()
	instance.position = pos
	add_child(instance)
