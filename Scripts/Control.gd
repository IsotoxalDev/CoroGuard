extends Control

func _ready():
	if Global.Score > Global.Data["HighScore"]:
		Global.Data["HighScore"] = Global.Score
		Global.save()
	$CenterContainer/HBoxContainer/Label2.set_text(str(Global.Score))

func _on_Button_pressed():
	AudioManager.play("btn")
	var _n = get_tree().change_scene("res://Scenes/World.tscn")


func _on_TextureButton2_pressed():
	AudioManager.play("btn")
	var _n = get_tree().change_scene("res://Scenes/MainMenu.tscn")
