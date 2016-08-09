
extends Button

func _ready():
	pass
	
func _on_Retour_pressed():
	get_node("/root/globals").set_scene("res://Scenes/Menu.scn")
