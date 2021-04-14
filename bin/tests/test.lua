#!/usr/bin/env lua

--require 't5'
-- this is a test comment


-- test comment
-- test comment
--tables
city = {}
city.name = "Seattle"
city.population = 10000
city.mayor = "Klark McDonald"

-- test comment
-- test comment
--[[io.write('Hello, what is your name? ')
local name = io.read()
io.write('Nice to meet you, ', name, '!\n')--]]

--can use semicolon to write two statements in one line
--local var = nil
--io.write("Which aspect of hte city you want to know?: "); local var = io.read() --will throw error in other parts of the program cuz its local

local clock = os.clock
function sleep(n)  -- stop execution for x seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

local function printWait(num, var, time)
    io.write(num,". ", var, "\n"); sleep(time)
end

local function city_part(var) -- check if `var` is x, meant to be usef or menu func
    if (var == "name" or var == " name" or var == "Name" or var == "1") then
        print("Name:", city.name)
    elseif (var == "population" or var == "2") then
        print("Population:", city.population)
    elseif (var == "mayor" or var == "3") then
        print("Mayor:", city.mayor)
    elseif (var == "exit" or var == "Exit" or var == "4")  then
        io.write("goodbye!\n"); os.exit(0)
    elseif (var == "all" or var == "5") then
        io.write("\n----------||----------\nName:\t\t", city.name, "\nPopulation:\t", city.population, "\nMayor:\t\t", city.mayor, "\n")
    else
        io.write("The given argument ", var, " was not recognized!")
    end
end

local function menu() -- main menu
    repeat
        io.write("----MENU----\n")
        --sleep(2) --worked
        local global_time = 0.1
        printWait(1, "name", global_time); printWait(2, "population", global_time); printWait(3, "mayor", global_time); printWait(4, "exit", global_time); printWait(5, "all", global_time);
        io.write("\n")
        --io.write("1. name\n2. population\n3. mayor\n4. exit\n5. all\n\n")
        io.write("Which aspect of the city you want to know?: "); usrInput = io.read() --can't be local, cuz we need it to be used in the whole program's scope
        city_part(usrInput)
    until (usrInput == "exit")
end

menu()
--city_part()
