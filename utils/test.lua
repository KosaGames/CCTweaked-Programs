-----------------------------------------------
--    DO NOT INCLUDE THIS IN ANY PROJECTS    --
--     ONLY USED TO MAKE TESTING EASIER      --
-----------------------------------------------

local test = {}

test.monitor = peripheral.find("monitor")
test.nbt_storage = peripheral.find("nbt_storage")
test.player_detector = peripheral.find("player_detector")
test.chatbox = peripheral.find("chat_box")
test.modem = peripheral.find("modem")
test.data = test.nbt_storage.read()

return test