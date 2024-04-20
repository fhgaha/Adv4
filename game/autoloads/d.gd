@tool
extends "res://addons/popochiu/engine/interfaces/i_dialog.gd"

# classes ----
const PDWorkingClassWomanFirst := preload("res://game/dialogs/working_class_woman_first/dialog_working_class_woman_first.gd")
# ---- classes

# nodes ----
var WorkingClassWomanFirst: PDWorkingClassWomanFirst : get = get_WorkingClassWomanFirst
# ---- nodes

# functions ----
func get_WorkingClassWomanFirst() -> PDWorkingClassWomanFirst: return E.get_dialog("WorkingClassWomanFirst")
# ---- functions

