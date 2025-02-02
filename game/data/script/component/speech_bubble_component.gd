extends Control
class_name speechBubble

@export var textLabel : Label
@export var timer : Timer

var text : String = ""
var letterIndex : int = 0

var letterTime = 0.03
