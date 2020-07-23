extends Node2D

var iconsScn = preload("res://Scenes/Icons.tscn")
var Mc
onready var Level = get_node("../../").Level
onready var entities = get_node("../../Container").get_children()
onready var container = $Container

func _ready():
	var mc = iconsScn.instance()
	mc.sprite = "Mc"
	add_child(mc)
	spawn(10)
	Mc = get_node("../../").Mc
		

func _process(_delta):
	Level = get_node("../../").Level
	Mc = get_node("../../").Mc
	if Mc != null:
		get_child(2).set_rot(Mc.position.x)
	entities = get_node("../../Container").get_children()
	var icons = container.get_children()
	for i in range(len(icons)):
		icons[i].set_rot(entities[i].position.x)
		icons[i].sprite = "Entity"
		icons[i].infected = entities[i].infected
	pass
func spawn(no):
	for _i in range(no):
		var newIcon = iconsScn.instance()
		container.add_child(newIcon)
