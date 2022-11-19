class_name DamageSource

enum DamageType {
	FIRE
}

export (int) var damage_type
export (int) var amount

func _init(damage_type: int, amount: int):
	self.damage_type = damage_type
	self.amount = amount
