extends VBoxContainer

onready var Precipitation = $Precipitation
onready var Temperature = $Temperature

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	Precipitation.text = str("R:", WeatherManager.is_raining(), " S:", WeatherManager.is_snowing(), " PrNs:", WeatherManager.get_precipitation_noise())
	Temperature.text = str("TeNs: ", WeatherManager.get_temperature_noise())
