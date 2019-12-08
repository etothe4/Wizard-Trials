extends Label

var scrollSpeed = 0

func _ready():
	set_process(false)

func scroll_text():
	set_process(true)
	scrollSpeed += 1
	self.visible_characters = scrollSpeed

func _process(delta):
	scroll_text()
