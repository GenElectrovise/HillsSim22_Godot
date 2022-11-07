extends VBoxContainer

onready var Precipitation = $Precipitation
onready var Temperature = $Temperature

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	Precipitation.text = str("prec_noise: ", WeatherManager.get_precipitation_noise())
	Temperature.text = str("temp_noise: ", WeatherManager.get_temperature_noise())
