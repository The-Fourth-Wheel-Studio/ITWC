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
