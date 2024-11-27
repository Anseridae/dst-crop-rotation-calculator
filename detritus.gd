extends ItemList


const detritus_icon = preload("res://crop icons/Farm_Soil.webp")

func _on_item_selected(_index: int) -> void:
	SelectedCrop.crop = detritus_icon
	SelectedCrop.crop_index = 14
