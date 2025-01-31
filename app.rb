require "sinatra"
require "sinatra/reloader"

def who_won(computer_played, user_played)
  if computer_played == user_played
    "Tie"
  elsif (computer_played == "rock" && user_played == "scissors") ||
        (computer_played == "paper" && user_played == "rock") ||
        (computer_played == "scissors" && user_played == "paper")
    "Computer_win"
  else
    "User_win"
  end
end

get("/") do
  erb(:elephant)
end

options = ["rock", "paper", "scissors"]

get("/rock") do
  @computer_played = options.sample
  @user_played = "rock"
  @result = who_won @computer_played, @user_played
  erb(:rock)
end

get("/paper") do
  @computer_played = options.sample
  @user_played = "paper"
  @result = who_won @computer_played, @user_played
  erb(:paper)
end

get("/scissors") do
  @computer_played = options.sample
  @user_played = "scissors"
  @result = who_won @computer_played, @user_played
  erb(:scissors)
end
