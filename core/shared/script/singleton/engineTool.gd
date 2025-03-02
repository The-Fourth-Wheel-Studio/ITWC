extends Node
class_name EngineTool

static func loadScene(nodeWhereToLoad : Node, scenePath:String, loadingScene = null):
	#MKhomer code thanks yoshman
	if loadingScene != null:
		loadingScene.visible = true
	#MultiplayerAPI.get_default_interface().

	MKUtil.print(str("Switching scene to ", scenePath))
	var sceneToInstantiate = ResourceLoader.load(scenePath).instantiate()
	nodeWhereToLoad.add_child(sceneToInstantiate)
	if loadingScene != null:
		loadingScene.visible = false

static func MKprintArray(arrayName : String = "Unknow", array : Array = [null]):
	if len(array) > 0:
		var s : String = arrayName + " : "
		for i in range(len(array)-1):
			s += (str(array[i]) + ", ")
		s += str(array[-1])
		MKUtil.print(s)
	else:
		MKUtil.print("the array is empty")

static func removeAllChildren(node : Node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

static func addChildfromPath(parent : Node, path : String):
	var absolutePath : String = GameManager.gamePath.path_join(path)
	MKUtil.print(absolutePath + "res://".path_join(path))
	if FileAccess.file_exists(absolutePath):
		MKUtil.print("'" + absolutePath + "' correctly instanciate")
		parent.add_child(load(absolutePath).instantiate())
	elif FileAccess.file_exists("res://".path_join(path)):
		MKUtil.print("'" + absolutePath + "' correctly instanciate")
		absolutePath = "res://".path_join(path)
		parent.add_child(load(absolutePath).instantiate())
	else:
		MKUtil.print("enable to instanciate child")

static func passFunc():
	pass

static func removeChild(parent : Node, child : Node):
	parent.remove_child(child)
	child.queue_free()
