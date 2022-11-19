extends Node

export (int) var DAYS_PER_REAL_MINUTE = 0.05 # 20 minutes per day
export (int) var MINUTES_PER_REAL_SECOND: int = 3
export (int) var DAYS_PER_SEASON = 3

export (float, 0.1, 200, 0.1) var accelerate

export (bool) var paused: bool = true

export (int) var seconds: float = 0
export (int) var minutes: int = 0
export (int) var hours: int = 0
export (int) var days: int = 0
export (int) var season: int = 0

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
	
	# floor(21/4) = 5; summer 2 
	# floor(11/4) = 3; winter 1
	season = floor(days / DAYS_PER_SEASON)

func get_formatted(): 
	return "%s:%02d:%02d:%02d:%02d" % [get_season_name(), days, hours, minutes, seconds]

func get_season_name():
	if season == 0 or 4: # 0-2, 12-14
		return "summer"
	elif season == 1 or 5: # 3-5, 15-17
		return "autumn"
	elif season == 2 or 6: # 6-8, 18-20
		return "winter"
	elif season == 3 or 7: # 9-11, 21-23
		return "spring"

func get_total_mins():
	var total = minutes + (hours * 60) + (days * 60 * 24)
	return total
