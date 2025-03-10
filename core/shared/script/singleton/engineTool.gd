extends Node
class_name EngineTool
const _scriptName : String = "engineTool"

static func loadScene(nodeWhereToLoad : Node, scenePath:String, loadingScene = null):
	#MKhomer code thanks yoshman
	if loadingScene != null:
		loadingScene.visible = true
	#MultiplayerAPI.get_default_interface().

	MKUtil.print(str("Switching scene to ", scenePath, _scriptName))
	var sceneToInstantiate = ResourceLoader.load(scenePath).instantiate()
	nodeWhereToLoad.add_child(sceneToInstantiate)
	if loadingScene != null:
		loadingScene.visible = false

static func MKprintArray(arrayName : String = "Unknow", array : Array = [null], scriptName : String = _scriptName):
	if len(array) > 0:
		var s : String = arrayName + " : "
		for i in range(len(array)-1):
			s += (str(array[i]) + ", ")
		s += str(array[-1])
		MKUtil.print(s, _scriptName)
	else:
		MKUtil.print("the array is empty", _scriptName)

static func removeAllChildren(node : Node):
	for n in node.get_children():
		node.remove_child(n)
		n.queue_free()

static func addChildfromPath(parent : Node, path : String):
	var absolutePath : String = "res://".path_join(path)
	var scene = load(absolutePath)
	if scene:
		MKUtil.print("'" + absolutePath + "' correctly instantiated", _scriptName)
		parent.add_child(scene.instantiate())
	else:
		MKUtil.print("unable to instantiate child at : " + absolutePath, _scriptName)

static func passFunc():
	pass

static func removeChild(parent : Node, child : Node):
	parent.remove_child(child)
	child.queue_free()
