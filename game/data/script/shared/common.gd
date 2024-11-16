class_name Common


static func banUnallowedChar(unAllowedChar : Array[String], string : String):
	var newString : String = ""
	for i in string:
		if i not in unAllowedChar:
			newString += i
	return newString

static func xor(bool1 : bool, bool2 : bool):
	if bool1 and bool2:
		return false
	elif not bool1 and not bool2:
		return false
	return true
