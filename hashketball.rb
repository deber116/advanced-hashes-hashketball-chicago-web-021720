require 'pp'
require 'pry'
def game_hash
  result = {}
  result[:home] = {
    team_name: "Brooklyn Nets",
    colors: ["Black","White"],
    players: []
  }
  result[:away] = {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: []
  }
  
  result[:home][:players][0] = {
    player_name: "Alan Anderson",
    number: 0,
    shoe: 16,
    points: 22,
    rebounds: 12,
    assists: 12,
    steals: 3,
    blocks: 1,
    slam_dunks: 1
  }
  
  result[:home][:players][1] = {
    player_name: "Reggie Evans",
    number: 30,
    shoe: 14,
    points: 12,
    rebounds: 12,
    assists: 12,
    steals: 12,
    blocks: 12,
    slam_dunks: 7
  }
  
  result[:home][:players][2] = {
    player_name: "Brook Lopez",
    number: 11,
    shoe: 17,
    points: 17,
    rebounds: 19,
    assists: 10,
    steals: 3,
    blocks: 1,
    slam_dunks: 15
  }
  
  result[:home][:players][3] = {
    player_name: "Mason Plumlee",
    number: 1,
    shoe: 19,
    points: 26,
    rebounds: 11,
    assists: 6,
    steals: 3,
    blocks: 8,
    slam_dunks: 5
  }
  
  result[:home][:players][4] = {
    player_name: "Jason Terry",
    number: 31,
    shoe: 15,
    points: 19,
    rebounds: 2,
    assists: 2,
    steals: 4,
    blocks: 11,
    slam_dunks: 1
  }
  
  result[:away][:players][0] = {
    player_name: "Jeff Adrien",
    number: 4,
    shoe: 18,
    points: 10,
    rebounds: 1,
    assists: 1,
    steals: 2,
    blocks: 7,
    slam_dunks: 2
  }
  
  result[:away][:players][1] = {
    player_name: "Bismack Biyombo",
    number: 0,
    shoe: 16,
    points: 12,
    rebounds: 4,
    assists: 7,
    steals: 22,
    blocks: 15,
    slam_dunks: 10
  }
  
  result[:away][:players][2] = {
    player_name: "DeSagna Diop",
    number: 2,
    shoe: 14,
    points: 24,
    rebounds: 12,
    assists: 12,
    steals: 4,
    blocks: 5,
    slam_dunks: 5
  }
  
  result[:away][:players][3] = {
    player_name: "Ben Gordon",
    number: 8,
    shoe: 15,
    points: 33,
    rebounds: 3,
    assists: 2,
    steals: 1,
    blocks: 1,
    slam_dunks: 0
  }
  
  result[:away][:players][4] = {
    player_name: "Kemba Walker",
    number: 33,
    shoe: 15,
    points: 6,
    rebounds: 12,
    assists: 12,
    steals: 7,
    blocks: 5,
    slam_dunks: 12
  }
 result
end


def drill_down_player_info (player, characteristic)
  result = nil
  player_hash = game_hash
  player_hash.reduce(nil) do |memo, (team, team_info)|
    team_info[:players].each do |player_hash|
      if player_hash[:player_name] == player
        result = player_hash[characteristic]
      end
    end
    memo
  end
  result
end 

def get_team_info (team_name, team_characteristic)
  result = nil
  player_hash = game_hash
  player_hash.reduce(nil) do |memo, (team, team_info)|
    if team_info[:team_name] == team_name
      result = team_info[team_characteristic]
    end
  end
  result
end

def num_points_scored (player)
  #binding.pry
  result = drill_down_player_info(player , :points)
end

def shoe_size(player)
  result = drill_down_player_info(player , :shoe)
end

def team_colors(team_name)
  result = get_team_info(team_name, :colors)
end 

def team_names
  result = []
  data = game_hash
  data.reduce([]) do |memo, (team,team_info)|
    result << team_info[:team_name]
  end
  result
end

def player_numbers(team_name)
  result = []
  players = get_team_info(team_name, :players)
  players.each do |player|
    result << player[:number]
  end
  result
end

def player_stats(player_name)
  result = {}
  player_hash = game_hash
  player_hash.reduce({}) do |memo, (team,team_info)|
    team_info[:players].each do |indiv_player|
      if indiv_player[:player_name] == player_name
        indiv_player.reduce({}) do |new_memo, (category, characteristic)|
          if !category == :player_name
            result[category] = characteristic
          end
        end
      end
    end 
  end
  result
end
#need to interate through the players into and create a new hash 
#how do we get to that player hash when given a player name? 
#need to go through each team --> players --> see if the name matches the argument 
#then iterate through the players info







