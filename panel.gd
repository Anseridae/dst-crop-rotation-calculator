extends Panel

var autom = get_theme_stylebox("bg_panel_autom")
var winter = get_theme_stylebox("bg_panel_winter")
var spring = get_theme_stylebox("bg_panel_spring")
var summer = get_theme_stylebox("bg_panel_summer")
const detritus_icon = preload("res://crop icons/Farm_Soil.webp")

const SMALL_CROPS_ICONS = ["res://crop icons/Toma_Root_Dropped.webp", "res://crop icons/Eggplant_Dropped.webp", "res://crop icons/Potato_Dropped.webp", "res://crop icons/Dragon_Fruit_Dropped.webp", "res://crop icons/Pepper_Dropped.webp", "res://crop icons/Carrot_Dropped.webp", "res://crop icons/Pumpkin_Dropped.webp", "res://crop icons/Onion_Dropped.webp", "res://crop icons/Pomegranate_Dropped.webp", "res://crop icons/Asparagus_Dropped.webp", "res://crop icons/Corn_Dropped.webp", "res://crop icons/Durian_Dropped.webp", "res://crop icons/Garlic_Dropped.webp", "res://crop icons/Watermelon_Dropped.webp"]
const GIANT_CROPS_ICONS = ["res://giant crop icons/Giant_Toma_Root_Dropped.webp", "res://giant crop icons/Giant_Eggplant_Dropped.webp", "res://giant crop icons/Giant_Potato_Dropped.webp", "res://giant crop icons/Giant_Dragon_Fruit_Dropped.webp", "res://giant crop icons/Giant_Pepper_Dropped.webp", "res://giant crop icons/Giant_Carrots_Dropped.webp", "res://giant crop icons/Giant_Pumpkin_Dropped.webp", "res://giant crop icons/Giant_Onion_Dropped.webp", "res://giant crop icons/Giant_Pomegranate_Dropped.webp", "res://giant crop icons/Giant_Asparagus_Dropped.webp", "res://giant crop icons/Giant_Corn_Dropped.webp", "res://giant crop icons/Giant_Durian_Dropped.webp", "res://giant crop icons/Giant_Garlic_Dropped.webp", "res://giant crop icons/Giant_Watermelon_Dropped.webp"]

				#autumn, winter, spring, summer
const CROP_SEASON = [[true, false, true, true],  #tomato
					[true, false, true, false],  #eggplant
					[true, true, true, false],   #potato
					[false, false, true, true],  #dragonfruit
					[true, false, false, true],  #pepper
					[true, true, true, false],   #carrot
					[true, true, false, false],  #puimpkin
					[true, false, true, true],   #onion
					[false, false, true, true],  #pomegranat
					[false, true, true, false],  #asparagus
					[true, false, true, true],   #corn
					[false, false, true, false], #durian
					[true, true, true, true],    #garlic
					[false, false, true, true],  #watermelon
					[false, false, false, false] #detritus
]


func reset_crops() -> void:
	var index = 0
	for i in %crop_plot.item_count:
		%crop_plot.set_item_icon(i, detritus_icon)
	for i in SelectedCrop.crop_layout:
		SelectedCrop.crop_layout[index] = [0, 0, 0]
		index += 1
	%resource_counter._on_item_list_item_selected(0)


func _ready() -> void:
	add_theme_stylebox_override("panel", autom)
	seasonal_crop_icons(0)


func seasonal_crop_icons(season) -> void:
	var path = null
	for i in %crop_seeds.item_count:
		if CROP_SEASON[i][season]:
			path = GIANT_CROPS_ICONS[i]
		else:
			path = SMALL_CROPS_ICONS[i]
		%crop_seeds.set_item_icon(i, load(path))


func _on_option_button_item_selected(index: int) -> void:
	reset_crops()
	seasonal_crop_icons(index)
	match index:
		0:
			add_theme_stylebox_override("panel", autom)
		1:
			add_theme_stylebox_override("panel", winter)
		2:
			add_theme_stylebox_override("panel", spring)
		3:
			add_theme_stylebox_override("panel", summer)
