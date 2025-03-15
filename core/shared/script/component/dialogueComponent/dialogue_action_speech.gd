extends dialogueActionComponent
class_name dialogueActionComponentSpeech

@export_category("action dependancy")
@export var speech : speechBubble

@export_category("dialogue text")
@export var currentActionText : String = ""

func connectAllSignal():
	speech.asFinishDisplay.connect(actionIsFinished)

func doTheAction():
	if not speech.active:
		speech.setActive()
	await speech.displayLetterByLetter(currentActionText)
