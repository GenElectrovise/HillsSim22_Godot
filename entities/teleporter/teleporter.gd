extends Node2D

export (Vector2) var destination: Vector2

func trigger():
	teleport(destination)

func teleport(destination: Vector2):
	PlayerData.position = destination
	PlayerData.make_dirty()

func teleport_custom(x: float, y: float):
	teleport(Vector2(x, y))
