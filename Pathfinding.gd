extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var map

func setup_navserver():
	# create a new navigation map
	map = NavigationServer.map_create()
	NavigationServer.map_set_up(map, Vector3.UP)
	NavigationServer.map_set_active(map, true)

	# create a new navigation region and add it to the map
	var region = NavigationServer.region_create()
	NavigationServer.region_set_transform(region, Transform())
	NavigationServer.region_set_map(region, map)

	# sets navigation mesh for the region
	var navigation_mesh = NavigationMesh.new()
	navigation_mesh = $NavigationMeshInstance.navmesh
	NavigationServer.region_set_navmesh(region, navigation_mesh)

	# wait for NavigationServer sync to adapt to made changes
	yield(get_tree(), "physics_frame")


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("setup_navserver")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
