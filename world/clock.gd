extends Node

# Parameters
export (int) var REAL_MINUTES_PER_GAME_DAY = 24
var SPEED: float = 1440 / REAL_MINUTES_PER_GAME_DAY
export (int) var DAYS_PER_SEASON = 3
export (float, 0.1, 200, 0.1) var accelerate
# Initial state
export (int) var start_seconds: float = 0
export (int) var start_minutes: int = 0
export (int) var start_hours: int = 0
export (int) var start_days: int = 0
export (int) var start_season: int = 0
# Running state
export (bool) var paused: bool = true
export (float) var dawn_hour: float = 4
export (float) var day_hour: float = 6
export (float) var dusk_hour: float = 19
export (float) var night_hour: float = 21
var seconds: float = 0
var minutes: int = 0
var hours: int = 0
var days: int = 0
var season: int = 0

enum DayStage { DAWN, DAY, DUSK, NIGHT }

func reset():
	print("Resetting clock")
	seconds = start_seconds
	minutes = start_minutes
	hours = start_hours
	days = start_days
	season = start_season

func pause(pause: bool):
	print("Time paused: ", pause)
	paused = pause

func _physics_process(delta):
	if !paused:
		increment_time(delta)

func increment_time(delta):
	seconds += delta * SPEED * accelerate
	
	var m = floor(seconds / 60.0)
	minutes += m
	seconds -= m * 60
	
	var h = floor(minutes / 60.0)
	hours += h
	minutes -= h * 60
	
	var d = floor(hours / 24.0)
	days += d
	hours -= d * 24
	
	season = floor(days / 3)

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

func get_day_stage():
	if hours < dawn_hour:
		return DayStage.NIGHT
	elif dawn_hour <= hours && hours < day_hour:
		return DayStage.DAWN
	elif day_hour <= hours && hours < night_hour:
		return DayStage.DAY
	else:
		return DayStage.NIGHT














