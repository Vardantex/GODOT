extends Control


#Appending arrays 
var player_words = [] 
var prompt = [ "one..", "two..", "three.."]
var story = "Method1: Terminal output: "
var words = ""

##HashMap variation below
#var player_words = [] 
#var template 
#var current_story = [{ 
#		"prompts":[ "one..", "two..", "three.."],
#		"story": "Output1: Terminal output: " },
#		{
#			"story" : "Output2: Terminal outpu: "
#		}]


#Prepare a node to be called multiple times (onready)
onready var displayText = $VBoxContainer/DisplayText
onready var lineInput = $VBoxContainer/HBoxContainer/LineInput

func _ready():
	
	#Create a function to pick a current story
	
#	print("Method1: Terminal ", array[0], "  output: ", array[1], " ", array[2]) 
	print()
	displayText.text = story
	lineInput.grab_focus()
#	#Use the % (array) to cycle values in an array not used yet
#	#Use %s to place the position of array output
##	var array2 = ["text", "one..", "two.."]
##	print("Method2: Terminal %s output: %s %s" % array2) 
#
#	#Get node with $### or get_node("###")
#	displayText.text = story % prompt;
#

func pick_current_story():
	randomize()
#	template = current_story[randi() %current_story.size()]  
	
	#Count how many child story nodes in the parent StoryBook
	var stories = $StoryBook.get_child_count()
	#Randomize selection
	var selected_Story = randi() % stories
	story = $StoryBook.get_child(selected_Story).prompts
	prompt = $StoryBook.get_child(selected_Story).story
	
	
#Read the text of a user
func _on_LineInput_text_entered(new_text):
	add_to_Sentence()
	lineInput.clear()
	lineInput.grab_focus()
	
#Add a button to submit text
func _on_TextureButton_pressed():
	#Pass words to update display
	add_to_Sentence()
	lineInput.clear()
	lineInput.grab_focus()
		
func add_to_Sentence():
	player_words.append(lineInput.text)
#	words.insert(0, lineInput.text) 
	print(player_words)
	displayText.text = story
	displayText.text += str(player_words)
	player_words.clear()
	
func is_story_Done():
	#return to match size
	return player_words.size() == story.size()
	
func check_player_words():
	if is_story_Done():
		tell_story()
	else:
		prompt_player()

func tell_story():
	displayText.text = story % player_words
	
func prompt_player():
	return story
	


func _on_resetButton_pressed():
	get_tree().reload_current_scene()
	lineInput.clear()
	lineInput.grab_focus()

	
