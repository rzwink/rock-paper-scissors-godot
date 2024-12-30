extends Node

var player_score = 0
var opponent_score = 0
var moves = ["Rock", "Paper", "Scissors"]

# Called when the player makes a move
func player_move(player_choice):
	var opponent_choice = moves[randi() % moves.size()]
	print("Player chose:", player_choice)
	print("Opponent chose:", opponent_choice)
	determine_winner(player_choice, opponent_choice)

# Determine the winner of the round
func determine_winner(player_choice, opponent_choice):
	if player_choice == opponent_choice:
		$"../OpponentArea/MoveDisplay/Outcome".text = opponent_choice + "!\nIt's a draw!"
		print("It's a draw!")
	elif (player_choice == "Rock" and opponent_choice == "Scissors") or (player_choice == "Paper" and opponent_choice == "Rock") or (player_choice == "Scissors" and opponent_choice == "Paper"):
		player_score += 1
		$"../OpponentArea/MoveDisplay/Outcome".text = opponent_choice + "!\nPlayer wins this round!"
		print("Player wins this round!")
	else:
		opponent_score += 1
		$"../OpponentArea/MoveDisplay/Outcome".text = opponent_choice + "!\nOpponent wins this round!"
		print("Opponent wins this round!")

	update_scores()

# Update the score labels
func update_scores():
	$"../PlayerArea/Score".text = str(player_score)
	$"../OpponentArea/Score".text = str(opponent_score)


func _on_paper_pressed() -> void:
	player_move("Paper")


func _on_scissor_pressed() -> void:
	player_move("Scissors")


func _on_rock_pressed() -> void:
	player_move("Rock")
