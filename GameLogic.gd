extends Node

# Rope position varies from -1942 to +3058, and starts at 558
const lowerBound = -1943
const upperBound = 3058
var ropePos = 558

# How long the server waits before sending the rope position to the clients
const ropePosSendUpdatePeriod = 1

var players = []


# ********** SERVER FUNCTIONS ***********
func insertPlayer(ip, name, team):
	# Check that parameters are valid
	players.append({"ip":ip, "name":name, "team":team})



# After getting tug from client, record it
func recordTug (team_id, power):

	# Record power
	if (team_id == 0):
		ropePos -= power
	else:
		ropePos += power

	# Check for win condition
	if (ropePos <= lowerBound):
		print("Team 0 won!!!")
	elif (ropePos >= upperBound):
		print("Team 1 won!!!!")

	# Update UI for server


# Report ropePos to client
func getRopePos():
	return ropePos

# Iterate through each client, and send them the rope position. Called every refresh period.
func sendAllClientsRopePos():
	# TODO: Implement me
	pass

# ********** CLIENT FUNCTIONS ***********

# Send tug to server
func sendTug(power):
	# TODO: Implement me
	pass

# After getting rope position from server, set it
func setRopePos(newRopePos):
	# TODO: Implement me
	pass


