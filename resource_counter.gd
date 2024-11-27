extends ItemList


var count = [0, 0, 0]

func _on_item_list_item_selected(_index: int) -> void:
	count = [0, 0, 0]
	for i in SelectedCrop.crop_layout:
		count[0] += i[0]
		count[1] += i[1]
		count[2] += i[2]
		
	#print("count: ", count)
	
	set_item_text(0, str(count[0]))
	set_item_text(1, str(count[1]))
	set_item_text(2, str(count[2]))
