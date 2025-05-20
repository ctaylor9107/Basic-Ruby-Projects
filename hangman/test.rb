require_relative "lib/game_state.rb"

# game_state = GameState.new("blank", "blank", "blank", "blank")

# test = File.open("./lib/save_files/save1.txt")

# # while lines = test.gets do
# #   print lines
# # end

# game_state = GameState.from_yaml(test)

# test.close

# save_files_unfiltered = Dir.entries "./lib/save_files"

# p save_files_unfiltered

save_files = Dir.entries("./lib/save_files").select { |file| file != "." && file != ".."}

p save_files_filtered
