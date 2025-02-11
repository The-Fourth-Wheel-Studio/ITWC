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
