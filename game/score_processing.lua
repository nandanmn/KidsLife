function initialize_score()
  if game_init_user_data or not love.filesystem.exists("score.lua") then
    score = {}
    for k, v in pairs(usernames) do
      score[usernames[k]] = {}
      for i = 1, 5 do
        score[usernames[k]][i] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
      end
    end
    score["admin"] = {}
    for i = 1, 5 do
      score["admin"][i] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    end
    love.filesystem.write("score.lua", table.show(score, "score"))
  end
  chunk = love.filesystem.load("score.lua")
  chunk()

  score_system = false
end

function save_score()
  love.filesystem.write("score.lua", table.show(score, "score"))
end

function get_score_for_game(g_index)
  for k, v in pairs(score_indexes) do
    if v == g_index then
      if score[username or "guest"][selected_age or 1][k or 1] ~= nil then
        return score[username][selected_age][k]
      else
        return 0
      end
    end
  end
end

function get_max_score_for_game(g_index)
  for k, v in pairs(score_indexes) do
    if v == g_index then
      return max_scores[k]
    end
  end
end

function add_score_for_game(g_index)
  for k, v in pairs(score_indexes) do
    if v == g_index then
      if score[username][selected_age][k] ~= nil then
        score[username][selected_age][k] = score[username][selected_age][k] + 1
      else
        score[username][selected_age][k] = 1
      end
    end
  end
  --save_score()
end
