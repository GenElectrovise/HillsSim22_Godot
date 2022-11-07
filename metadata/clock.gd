extends Timer

const SECONDS_PER_TICK: int = 3

var time: int

func _init():
	print("Starting Clock")
	prepare()
	time = 0
	pause(true)
	
func prepare():
	connect("timeout", self, "tick")
	wait_time = SECONDS_PER_TICK
	one_shot = false
	paused = false
	start()

func pause(pause: bool):
	print("Time paused: ", pause)
	paused = pause

func tick():
	print("Ticking time ", time, " -> ", time + 1)
	time += 1
