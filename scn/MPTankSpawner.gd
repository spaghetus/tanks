extends Spatial

export var MPTank: PackedScene
export var TankRoot: NodePath

func _ready():
	Networking.create_players(MPTank, get_node(TankRoot))
	get_tree().connect("network_peer_connected", self, "new_player")
	pass # Replace with function body.

func new_player(id: int):
	Networking.rpc_id(id, "start_game", get_tree().current_scene)
	var new_player = MPTank.instance()
	new_player.set_network_master(id)
	new_player.name = str(id)
	get_node(TankRoot).add_child(new_player)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
