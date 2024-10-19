extends Node
func _ready():
	DiscordRPC.app_id = 1099618430065324082 # Application ID
	DiscordRPC.details = "ITWC"
	DiscordRPC.state = "Martin will kill you.."
	DiscordRPC.large_image = "logo" # Image key from "Art Assets"
	DiscordRPC.large_image_text = "don't look !"
	#DiscordRPC.small_image = "logo" # Image key from "Art Assets"
	#DiscordRPC.small_image_text = ""

	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
# DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"

	DiscordRPC.refresh() # Always refresh after changing the values!
