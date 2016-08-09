
extends VBoxContainer

func _on_Quitter_pressed():
	get_tree().quit()

func _on_Jouer_pressed():
	get_node("/root/globals").set_scene("res://Scenes/LevelOne.scn")


func _on_Credits_pressed():
	get_node("/root/globals").set_scene("res://Scenes/CreditsScene.scn")


func _on_Commandes_pressed():
	get_node("/root/globals").set_scene("res://Scenes/ControlesScene.scn")
