pao_ying_chub <- function () {
  print("Welcome to Pao Ying Chub...")
  print("Here's your options")
  print("[1] Rock, [2] Paper, [3] Scissors, [4] Score, [5] End!")
  
  
  # empty objects
  player_act <- 0
  count_win  <- 0
  count_lose <- 0
  count_draw <- 0
  
  
  while (player_act != 5) {
    print("Pao Ying Chub!: ")
    
    # bot 
    bot_act <- sample( c(1,2,3), size = 1 )
    bot_act1 <- factor(bot_act,
                   levels = c(1, 2, 3),
                   labels = c("Rock", "Paper", "Scissors"))
    
    # player
    player_act <- readLines("stdin", n=1)
    if (player_act == "1") {
      player_act <- "Rock"
    } else if (player_act == "2") {
      player_act <- "Paper"
    } else if (player_act == "3") {
      player_act <- "Scissors"
    } else if (player_act == "4") {
      player_act <- "Score"
    } else if (player_act == "5") {
      player_act <- "End!"
    }

     #display
    if (player_act == "End!") {
      print("Game end")
      print("Your total score is")
      print(paste("Win:", count_win, 
                  "Lose:", count_lose,
                  "Draw:", count_draw))
      break
    } else if (player_act %in% c("Rock", "Paper", "Scissors")) {
      print(paste("You:", player_act, "VS Bot:", bot_act1))
    } else if (player_act == "Score") {
      print("Your current score is")
      print(paste("Win:", count_win, 
                  "Lose:", count_lose,
                  "Draw:", count_draw))
    } else {
      print("Please select the number again")
    }
    # scoring
    if (bot_act1 == "Rock" & player_act == "Paper" |
        bot_act1 == "Paper" & player_act == "Scissors" |
        bot_act1 == "Scissors" & player_act == "Rock") {
      print("You win!")
      count_win  <- count_win + 1
    } else if (bot_act1 == "Paper" & player_act == "Rock" |
               bot_act1 == "Scissors" & player_act == "Paper" |
               bot_act1 == "Rock" & player_act == "Scissors") {
      print("You lose!")
      count_lose <- count_lose + 1
    } else if (bot_act1 == player_act) {
      print("Draw!")
      count_draw <- count_draw + 1
    }
    
  }
}
pao_ying_chub()
