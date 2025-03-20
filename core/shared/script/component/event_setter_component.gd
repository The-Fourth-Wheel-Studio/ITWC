@icon("res://editor/assets/component/eventSetterComponent.png")
extends Node

@export var eventValueSetter : Array[int]

func setEventState(eventName : String):
	EventObserver.setEvent(eventName, Common.biggestClosestValueInArray(EventObserver.getEvent(eventName), eventValueSetter))
	

	
	
