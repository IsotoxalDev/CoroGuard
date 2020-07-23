extends Node2D

var Level = Global.Level
var Entitiy = preload("res://Scenes/Entity.tscn")
var infected = 0
var masks = 5
var score = 0
var Ground = Global.ground
onready var container = $Container
onready var Mc = get_node("Player")

func _ready():
	randomize()
	Global.Score = 0
	spawn(10)
#	for i in range(Level*10):
#		var newEntity = Entitiy.instance()
#		container.add_child(newEntity)
#	var entities = container.get_children()
#	var virus = round(rand_range(0, len(entities)-1))
#	entities[virus].infected = true

func _process(_delta):
	Global.Level = Level
	Ground = Global.ground
	infected = 0
	var entities = container.get_children()
	for i in entities:
		infected += int(i.infected)

func spawn(no):
	var entities = []
	for _i in range(no):
		var newEntity = Entitiy.instance()
		container.add_child(newEntity)
		entities.append(newEntity)
	var virus = round(rand_range(0, len(entities)-1))
	entities[virus].infected = true
