extends Control


func _on_TextureButton_pressed():
	AudioManager.play("btn")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
