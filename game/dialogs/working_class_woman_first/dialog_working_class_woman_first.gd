@tool
extends PopochiuDialog


#region Virtual ####################################################################################
func _on_start() -> void:
	# One can put here something to excecute before showing the dialog options.
	# E.g. Make the PC to look at the character which it will talk to, walk to
	# it, and say something (or make the character say something):
	await C.player.face_clicked()
#	await C.player.say("Hi")
#	await C.Popsy.say("Oh! Hi...")
	
	update_dialog([
		opt("agoodone", "A good one? Point at the book"),
		opt("hello", "Hello"),
		#opt("leave", "Leave")
	])

	#update_dialog([
		#opt("test1", "Shouldn't a working class woman be working?"),
		#opt("test2", "What are you doing?"),
		#opt("test3", "Have a good day [Leave]")
	#])

	# (!) It MUST always use an await
	await E.get_tree().process_frame


func update_dialog(array: Array[PopochiuDialogOption]) -> void:
	var RES = load("res://game/dialogs/working_class_woman_first/dialog_working_class_woman_first.tres")
	RES.options.clear()
	RES.options.append_array(array)
	var res = load("res://game/dialogs/working_class_woman_first/dialog_working_class_woman_first.tres")
	print(res.options.size())


func opt(id: String, text: String, visible: bool = true) -> PopochiuDialogOption:
	var opt = PopochiuDialogOption.new()
	opt.id = id
	opt.text = text
	opt.visible = visible
	return opt


func _option_selected(opt: PopochiuDialogOption) -> void:
	match opt.id:
		#"test1":
			#await C.WorkingClassWoman.say("test saying 1")
			#update_dialog([
				#opt("test1", "Shouldn't a working class woman be working?"),
				#opt("test2", "What are you doing?"),
				#opt("test3", "Have a good day [Leave]")
			#])
		#"test2":
			#await C.WorkingClassWoman.say("test saying 2")
			#update_dialog([
				#opt("test1", "Shouldn't a working class woman be working?"),
				#opt("test2", "What are you doing?"),
				#opt("test3", "Have a good day [Leave]")
			#])
		#"test3":
			#await C.WorkingClassWoman.say("test saying 3")
			#update_dialog([
				#opt("test1", "Shouldn't a working class woman be working?"),
				#opt("test2", "What are you doing?"),
				#opt("test3", "Have a good day [Leave]")
			#])
		
		"agoodone":
			await C.WorkingClassWoman.say("It's not bad")
			update_dialog([
				opt("whoareyou", "Who are you?")
			])
		"hello":
			await C.WorkingClassWoman.say("Hello")
			update_dialog([
				opt("whoareyou", "Who are you?")
			])
		"whoareyou":
			await C.WorkingClassWoman.say("Me? No one")
			await C.WorkingClassWoman.say("I'm just a working class woman")
			update_dialog([
				opt("shouldwork", 	"Shouldn't a working class woman be working?"),
				opt("whatdoing", 	"What are you doing?"),
				opt("leave", 		"Have a good day Leave")
			])
		"shouldwork":
			await C.WorkingClassWoman.say("Me? No one")
		
		#should be always below
		"leave":
			stop()
	
	#old_thing()
	_show_options()


func old_thing(opt: PopochiuDialogOption):
	match opt.id:
		"AGoodOne":
			await C.WorkingClassWoman.say("Yes")
		"Hello":
			await C.WorkingClassWoman.say("Hello")
			turn_off_opts_all()
			turn_on_options(["WhoAreYou"])
		"Leave":
			stop()
		
		"WhoAreYou":
			await C.WorkingClassWoman.say("Me? No one")
			await C.WorkingClassWoman.say("I'm just a working class woman")
			turn_off_opts_all()
			turn_on_options(["ShouldWork", "WhatYouDoing", "HaveAGoodDay"])
		
		"ShouldWork":
			await C.WorkingClassWoman.say("Not all the time")
			await C.WorkingClassWoman.say("Right now I'm browsing books")
			await C.WorkingClassWoman.say("Even a working class woman need something to read")
			turn_off_opts_all()
			turn_on_options(["Phenomenal", "Good", "ImPoliceman"])
			
		"WhatYouDoing":
			stop()
		"HaveAGoodDay":
			stop()
		
		"Phenomenal":
			stop()
		"Good":
			await C.WorkingClassWoman.say("It is")
			turn_off_opts_all()
			turn_on_options(["ImPoliceman", "Leave2"])
		"ImPoliceman":
			await C.WorkingClassWoman.say("I know you are")
			turn_off_opts_all()
			turn_on_options(["GoodThen", "NeedHelp"])
		
		"GoodThen":
			await C.WorkingClassWoman.say("Mhm")
			turn_off_opts_all()
			turn_on_options(["NeedHelp"])
		
		"NeedHelp":
			await C.WorkingClassWoman.say("What with?")
			turn_off_opts_all()
			turn_on_options(["HusbandMissing", "WatchHer", "ThatsAll"])
		
		"HusbandMissing":
			await C.WorkingClassWoman.say("My husband? No, he's not")
			turn_off_opts_all()
			turn_on_options(["WhereHeCouldBe", "OkayThanks"])
		"WatchHer":
			stop()
		"ThatsAll":
			stop()
		
		"WhereHeCouldBe":
			await C.WorkingClassWoman.say("I don't know, at home now?")
			await C.WorkingClassWoman.say("Out drinking with his friends?")
			await C.WorkingClassWoman.say("Working?")
			turn_off_opts_all()
			turn_on_options(["YouDontKnowWhereHusband", "RightThanks"])
		"OkayThanks":
			stop()
		
		"YouDontKnowWhereHusband":
			await C.WorkingClassWoman.say("Yes, but...")
			await C.WorkingClassWoman.say("I don't really need to know where my husband is")
			await C.WorkingClassWoman.say("Not all the time")
			turn_off_opts_all()
			turn_on_options(["WoundtYouLikeTo"])
		"RightThanks":
			stop()
		
		"WoundtYouLikeTo":
			await C.WorkingClassWoman.say("No")
			turn_off_opts_all()
			turn_on_options(["ICanTotallyHelp", "SuitYourself", "MaybeHeIsntMissing"])
		
		"ICanTotallyHelp":
			await C.WorkingClassWoman.say("Why are you still talking about this?")
			await C.WorkingClassWoman.say("I haven't lost my husband")
			turn_off_opts_all()
			turn_on_options(["MaybeChildrenMissing", "MaybeCacatooMissing", "WatchHer", "ThatsAll"])
		"SuitYourself":
			stop()
		"MaybeHeIsntMissing":
			stop()
		
		"MaybeChildrenMissing":
			await C.WorkingClassWoman.say("No. Absulutely not")
			turn_off_opts_all()
			turn_on_options(["OkayWhereAreThey", "RightThanks2"])
		
		"OkayWhereAreThey":
			await C.WorkingClassWoman.say("Are you a police man or nanny?")
			turn_off_opts_all()
			turn_on_options(["NannyWhereAreThey", "IPoliceWhateverIWant"])
		"RightThanks2":
			stop()
		
		"NannyWhereAreThey":
			stop()
		"IPoliceWhateverIWant":
			await C.WorkingClassWoman.say("They are not missing, sir")
			turn_off_opts_all()
			turn_on_options(["TheyHomeSmoking", "MakingSure"])
		
		"TheyHomeSmoking":
			await C.WorkingClassWoman.say("What? That's just--")
			await C.WorkingClassWoman.say("My daughters are perfectly *fine*")
			await C.WorkingClassWoman.say("They're with their friends down in Jamrock!")
			await C.WorkingClassWoman.say("There's *nothing* to worry about!")
			await C.WorkingClassWoman.say("They're almost grown up anyway")
			await C.WorkingClassWoman.say("They're past the age they need me protecting them from everything now")
			turn_off_opts_all()
			turn_on_options(["HowOldAreThey", "MaybeYouAreRight"])
		"MakingSure":
			stop()
		
		"HowOldAreThey":
			await C.WorkingClassWoman.say("My youngest girl, Jolie, is just shy of sixteen")
			await C.WorkingClassWoman.say("Jennie is turning eighteen next month")
			await C.WorkingClassWoman.say("But we should't be talking about them!")
			turn_off_opts_all()
			turn_on_options(["Appearance"])
		"MaybeYouAreRight":
			stop()
		
		"Appearance":
			await C.WorkingClassWoman.say("Why do you need to know this?")
			await C.WorkingClassWoman.say("Haven't I repeatedly told you they are not missing?")
			await C.WorkingClassWoman.say("That they're in Jamrock, safe and well, at some stupid party")
			turn_off_opts_all()
			turn_on_options(["Professional", "StopAboutDaughters"])
		
		"Professional":
			await C.WorkingClassWoman.say("There is no *investigation* here, I can tell you that!")
			turn_off_opts_all()
			turn_on_options(["HusbandMissing", "MaybeChildrenMissing", "MaybeCacatooMissing", "WatchHer", "ThatsAll"])
		"StopAboutDaughters":
			stop()
		
		"MaybeCacatooMissing":
			await C.WorkingClassWoman.say("I don't mean to disrespect, sir...")
			await C.WorkingClassWoman.say("But *you* are being a bit of a cacatoo here")
			turn_off_opts_all()
			turn_on_options(["Cacatoo2", "CacatooMeaning"])
		
		"Cacatoo2":
			await C.WorkingClassWoman.say("I don't even have a cacatoo. And guess what?")
			turn_off_opts_all()
			turn_on_options(["What", "CacatooNotMissing"])
		
		"What":
			await C.WorkingClassWoman.say("Even if i had, it wouldn't be missing")
			turn_off_opts_all()
			turn_on_options(["CacatooNotMissing"])
		"CacatooNotMissing":
			await C.WorkingClassWoman.say("")
			turn_off_opts_all()
			turn_on_options(["CacatooNotMissing"])
		"":
			stop()
		_:
			stop()


func turn_off_opts_all():
	for opt in options:
		if opt.visible:
			opt.turn_off()
	pass


# Use this to save custom data for this PopochiuDialog when saving the game.
# The Dictionary must contain only JSON supported types: bool, int, float, String.
func _on_save() -> Dictionary:
	return {}


# Called when the game is loaded.
# This Dictionary should has the same structure you defined for the returned one in _on_save().
func _on_load(data: Dictionary) -> void:
	prints(data)


#endregion
