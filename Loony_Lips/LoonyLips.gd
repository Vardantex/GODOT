extends Control

#Appending arrays 
var player_words = [] 
var prompt = [ "one..", "two..", "three.."]
var story = "Method1: Terminal output: "
var words = ""


#Prepare a node to be called multiple times (onready)
onready var displayText = $VBoxContainer/DisplayText
onready var lineInput = $VBoxContainer/HBoxContainer/LineInput

func _ready():
#	print("Method1: Terminal ", array[0], "  output: ", array[1], " ", array[2]) 
	print()
	displayText.text = story
#	#Use the % (array) to cycle values in an array not used yet
#	#Use %s to place the position of array output
##	var array2 = ["text", "one..", "two.."]
##	print("Method2: Terminal %s output: %s %s" % array2) 
#
#	#Get node with $### or get_node("###")
#	displayText.text = story % prompt;
#
	
	

#Read the text of a user
func _on_LineInput_text_entered(new_text):
	add_to_Sentence()
	lineInput.clear()

#Add a button to submit text
func _on_TextureButton_pressed():
	#Pass words to update display
	add_to_Sentence()
	lineInput.clear()
	
		
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
	
