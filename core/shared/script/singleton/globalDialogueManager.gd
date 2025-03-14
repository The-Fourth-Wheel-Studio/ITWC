extends Node

enum senderType
{
	PNJ,
	OTHER
}
	
signal triggerDialogue(sender : senderType, option : Variant)
signal actionFinished
