extends Node

const DAYS_PER_REAL_MINUTE = 0.05 # 20 minutes per day
const MINUTES_PER_REAL_SECOND: int = 3
const accelerate = 1

var paused: bool = true

var seconds: float = 0
var minutes: int = 0
var hours: int = 0
var days: int = 0

func pause(pause: bool):
	print("Time paused: ", pause)
	paused = pause

func _physics_process(delta):
	if !paused:
		increment_time(delta)

func increment_time(delta):
	seconds += delta * MINUTES_PER_REAL_SECOND * 60 * accelerate
	
	var m = floor(seconds / 60.0)
	minutes += m
	seconds -= m * 60
	
	var h = floor(minutes / 60.0)
	hours += h
	minutes -= h * 60
	
	var d = floor(hours / 24.0)
	days += d
	hours -= d * 24

func get_formatted(): 
	return "%02d:%02d:%02d:%02d" % [days, hours, minutes, seconds]

func get_total_mins():
	var total = minutes + (hours * 60) + (days * 60 * 24)
	return total
