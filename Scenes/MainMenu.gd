extends Control

func _ready():
	Global.Load()
	$CenterContainer/VBoxContainer/CenterContainer/HBoxContainer/HScoreVal.set_text(str(Global.Data["HighScore"]))
	pass


func _on_TextureButton_pressed():
	AudioManager.play("btn")
	var _n = get_tree().change_scene("res://Scenes/World.tscn")


func _on_TextureButton2_pressed():
	AudioManager.play("btn")
	var _n = get_tree().change_scene("res://Scenes/FAQ.tscn")
