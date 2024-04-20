@tool
extends "res://addons/popochiu/engine/interfaces/i_room.gd"

# classes ----
const PRBookshopFront := preload("res://game/rooms/bookshop_front/room_bookshop_front.gd")
# ---- classes

# nodes ----
var BookshopFront: PRBookshopFront : get = get_BookshopFront
# ---- nodes

# functions ----
func get_BookshopFront() -> PRBookshopFront: return super.get_runtime_room("BookshopFront")
# ---- functions

