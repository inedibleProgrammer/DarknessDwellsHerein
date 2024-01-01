


function LaunchLua()
  print(bj_MAX_PLAYER_SLOTS) -- 28
  print(type(Player(0))) -- userdata
  print(GetPlayerId(Player(0))) -- 0
  print(Player(0)) -- "player: 000002A1E7CB9DC0" different every time
end

