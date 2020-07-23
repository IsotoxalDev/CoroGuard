extends Node

var Level = 1
var ground = (256*32)
var maskJustGiven = false
var Score = 0
var DataName = 'user://CoroGuardData.json'
var Data = {
	"HighScore": 0,
}

func save():
	var file = File.new()
	file.open(DataName, File.WRITE)
	file.store_string(to_json(Data))
	file.close()

func Load():
	var file = File.new()
	if file.file_exists(DataName):
		file.open(DataName, File.READ)
		var tempdata = parse_json(file.get_as_text())
		file.close()
		Data = tempdata
	
	
