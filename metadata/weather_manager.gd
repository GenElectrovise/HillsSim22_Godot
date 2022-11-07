extends Node

var PrecipitationNoise: OpenSimplexNoise = OpenSimplexNoise.new()
var TemperatureNoise: OpenSimplexNoise = OpenSimplexNoise.new()

func _init():
	PrecipitationNoise.seed = Global.SEED
	TemperatureNoise.seed = Global.SEED
	PrecipitationNoise.octaves = 4
	TemperatureNoise.octaves = 4
	PrecipitationNoise.persistence = 0.1
	TemperatureNoise.persistence = 0.01
	PrecipitationNoise.period = 28
	TemperatureNoise.period = 28

func get_precipitation_noise():
	return PrecipitationNoise.get_noise_1d(Clock.get_total_mins())

func get_temperature_noise():
	return TemperatureNoise.get_noise_1d(Clock.get_total_mins())

func get_temperature():
	var t = Clock.get_total_mins()
	
	var day_weight = 0.05 # Day amplitude
	var season_weight = 1.8 # Season amplitude
	var noise_weight = 0.25 # Noise amplitude
	
	var min_temp = -30
	var max_temp = 50
	
	# Calculate deviations
	var day_dev = -cos( t * (2*PI)/(60*24)) * day_weight # Period 1440 game-mins (1 g-day)
	var season_dev = sin( t * (2*PI)/(60*24*12)) * season_weight # Period 17280 game-mins (12 g-days)
	var noise_dev = get_temperature_noise() * noise_weight # [-1,1]
	var total_dev = day_dev + season_dev + noise_dev # [-3,3]
	var dev_count = 3
	var clamped_dev = (total_dev + dev_count) / (2 * dev_count) # [-3,3] -> [-1,1]
	
	var temp_rng = max_temp - min_temp
	var temp = min_temp + (clamped_dev * temp_rng)
	
	#print("")
	#print("total_dev:", total_dev, " clamped_dev:", clamped_dev, " day_dev:", day_dev, " season_dev:", season_dev, " noise_dev:", noise_dev)
	#print("Temp:", temp, " t:", t," dev:", total_dev, " Clock:", Clock.get_formatted())
	return temp
