extends Spatial



var target : Spatial
var path = []

var move_speed = 10.0
var move_vec : Vector3

var map

func _ready():

	map = NavigationServer.get_maps()[1]
#	nav = get_tree().get_nodes_in_group("navigation")[0]
	target = get_tree().get_nodes_in_group("target")[0]

func _physics_process(delta):
	update_move_vec()
	global_translate(move_vec * move_speed * delta)

func update_move_vec():
	path = NavigationServer.map_get_path(map, global_transform.origin, target.global_transform.origin, true)
	if path.size() > 1:
		var dir : Vector3 = path[1] - global_transform.origin
		dir.y = 0
		dir = dir.normalized()
		move_vec = dir
