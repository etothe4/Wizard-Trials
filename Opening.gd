extends Node

func _ready():
	$FadeIn.show()
	$FadeIn.fade_in()
	$Timer1.start()

func _on_Timer1_timeout():
	get_node("Panel/Text1").scroll_text()
	$Timer2.start()

func _on_Timer2_timeout():
	$Panel/Text1.hide()
	get_node("Panel/Text2").scroll_text()
	$Timer3.start()

func _on_Timer3_timeout():
	$Panel/Text2.hide()
	get_node("Panel/Text3").scroll_text()
	$Timer4.start()

func _on_Timer4_timeout():
	$Panel/Text3.hide()
	get_node("Panel/Text4").scroll_text()
	$Timer5.start()

func _on_Timer5_timeout():
	$Panel/Text4.hide()
	get_node("Panel/Text5").scroll_text()
	$Timer6.start()

func _on_Timer6_timeout():
	$Panel/Text5.hide()
	get_node("Panel/Text6").scroll_text()
	$Timer7.start()

func _on_Timer7_timeout():
	$Panel/Text6.hide()
	get_node("Panel/Text7").scroll_text()
	$Timer8.start()

func _on_Timer8_timeout():
	$Panel/Text7.hide()
	get_node("Panel/Text8").scroll_text()
	$Timer9.start()

func _on_Timer9_timeout():
	$FadeOut.fade_out()

func _on_FadeOut_fade_out_finished():
	get_tree().change_scene("Stage1StartScreen.tscn")
