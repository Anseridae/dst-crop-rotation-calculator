extends ItemList

const RESOURCE_VALS = [[-2, -2, 4], #tomato
						[2, 2, -4], #eggplant
						[2, 2, -4], #potato
						[4, 4, -8], #dragonfruit
						[4, 4, -8], #pepper
						[2, -4, 2], #carrot
						[2, -4, 2], #puimpkin
						[4, -8, 4], #onion
						[4, -8, 4], #pomegranat
						[-4, 2, 2], #asparagus
						[-4, 2, 2], #corn
						[-8, 4, 4], #durian
						[-8, 4, 4], #garlic
						[-2, 4, -2], #watermelon
						[0, 0, 0] 	 #detritus
						]

func _on_item_selected(index: int) -> void:
	set_item_icon(index, SelectedCrop.crop)
	SelectedCrop.crop_layout[index] = RESOURCE_VALS[SelectedCrop.crop_index]
	
	#print("crop index: ", SelectedCrop.crop_index, 
	#"\ncrop: ", SelectedCrop.crop,
	#"\ncrop resource val: ", RESOURCE_VALS[SelectedCrop.crop_index], 
	#"\ncrop layouy: ", SelectedCrop.crop_layout)
	
