extends Node

enum senderType
{
	PNJ,
	OTHER
}
	
signal triggerDialogue(senderTypeParameter : senderType, sender : dialogueActor)
signal actionFinished
