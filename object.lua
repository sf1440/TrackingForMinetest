-- Written By Songyuhao Shi



minetest.log("object_test_obj")

minetest.register_chatcommand("lua_object", {
    description = "List all avaliable chat commands",
    func = function(name, param)
        if param == "" then
            minetest.log("Enter a page number - /lua_object #")
        end
        if param == "1" then
            minetest.log("lua_object_remove\n")
            minetest.log("lua_object_get_pos\n")
            minetest.log("lua_object_set_pos #\n")
            minetest.log("lua_object_move_to #\n")
            minetest.log("lua_object_punch - Not Working\n")
            minetest.log("lua_object_right_click\n")
            minetest.log("lua_object_set_hp - Not Working\n")
            minetest.log("lua_object_get_hp\n")
            minetest.log("lua_object_get_inventory\n")
            minetest.log("lua_object_get_weild_list\n")
        end
        if param == "2" then
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
            minetest.log("")
        end
    end,
})

-- l_remove
minetest.register_chatcommand("lua_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("lua_object_remove is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 8)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)

        for i, object in ipairs(saos) do
            if not object:is_player() then
                minetest.log("Removed: "..object:get_entity_name())
                local objectRemove = object:remove()
            end
        end
    end,
})

-- native_remove
minetest.register_chatcommand("native_object_remove", {
    description = "Test Object Remove",
    func = function(name, param)
        minetest.log("native_object_remove is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 8)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)

        for i, object in ipairs(saos) do
            if not object:is_player() then
                minetest.log("Removed: "..object:get_entity_name())
                local objectRemove = object:native_remove()
            end
        end
    end,
})

-- l_get_pos
minetest.register_chatcommand("lua_object_get_pos", {
    description = "Test Object Get Pos",
    func = function(name, param)
        minetest.log("lua_object_get_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)
        
        -- Get the position of the first object in saos
        local firstSaosPos = saos[1]:get_pos()
        minetest.log("Position of first Reference Object: " .. minetest.pos_to_string(firstSaosPos))
    end,
})

-- native_get_pos
minetest.register_chatcommand("native_object_get_pos", {
    description = "Test Object Get Pos",
    func = function(name, param)
        minetest.log("native_object_get_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of saos: " .. #saos)
        
        -- Get the position of the first object in saos
        local firstSaosPos = saos[1]:native_get_pos()
        minetest.log("Position of first Reference Object: " .. minetest.pos_to_string(firstSaosPos))
    end,
})

-- l_set_pos
minetest.register_chatcommand("lua_object_set_pos", {
    description = "Test Object Set Pos - /lua_object_set_pos (Z_Value)",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                local v3f = {x = 100, y = 22, z = tonumber(param)}
                local player_pos = object:set_pos(v3f)
                minetest.log("Player " .. object:get_player_name() .. " is at position: " .. minetest.pos_to_string(v3f))
            end
        end
    end,
})

-- native_set_pos
minetest.register_chatcommand(" native_object_set_pos", {
    description = "Test Object Set Pos - /native_object_set_pos (Z_Value)",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                local v3f = {x = 100, y = 22, z = tonumber(param)}
                local player_pos = object:native_set_pos(v3f)
                minetest.log("Player " .. object:get_player_name() .. " is at position: " .. minetest.pos_to_string(v3f))
            end
        end
    end,
})

-- l_move_to
minetest.register_chatcommand("lua_object_move_to", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            local v3f = {x = 100, y = 22, z = tonumber(param)}
            local player_pos = object:move_to(v3f, false)
            minetest.log(#saos .. " objects moved to position: " .. minetest.pos_to_string(v3f))
        end
    end,
})

-- native_move_to
minetest.register_chatcommand("native_object_move_to", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 1)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            local v3f = {x = 100, y = 22, z = tonumber(param)}
            local player_pos = object:native_move_to(v3f, false)
            minetest.log(#saos .. " objects moved to position: " .. minetest.pos_to_string(v3f))
        end
    end,
})

-- l_punch
minetest.register_chatcommand("lua_object_punch", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("lua_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                for i, floorobj in ipairs(saos) do
                    if not floorobj:isplayer() then
                        -- Wear all objects on floor
                        object:punch(floorobj)
                    end
                end
            end
        end
    end,
})

-- native_punch
minetest.register_chatcommand("native_object_punch", {
    description = "Test Object Move To",
    func = function(name, param)
        minetest.log("native_object_set_pos is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        for i, object in ipairs(saos) do
            -- Check if the object is a player
            if object:is_player() then
                for i, floorobj in ipairs(saos) do
                    if not floorobj:isplayer() then
                        -- Wear all objects on floor
                        object:native_punch(floorobj)
                    end
                end
            end
        end
    end,
})

-- l_right_click
-- right_click(self, clicker)
minetest.register_chatcommand("lua_object_right_click", {
    description = "Test Object Right Click",
    func = function(name, param)
        minetest.log("lua_object_right_click is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        -- Insert Lua code here that if saos == 2 then set plyr = saos[0] and rclk = saos[1]
        if #saos == 2 then
            local plyr = saos[1]
            local rclk = saos[2]
            plyr:right_click(rclk)
            minetest.log("Object: "..plyr:get_player_name().." right clicked on ".. rclk:get_entity_name())
        end
    end,
})

--set_hp

--get_hp
-- get_hp(self)
minetest.register_chatcommand("lua_object_get_hp", {
    description = "Get the player's current HP",
    func = function(name, param)
        minetest.log("lua_object_get_hp is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)
        for i, object in ipairs(saos) do
            local a = object:get_hp()
            minetest.log("The object's HP is currently " ..dump(a))
        end
    end,
})

-- get_inventory(self)
minetest.register_chatcommand("lua_object_get_inventory", {
    description = "Check player's inventory and returns inventory functions",
    func = function(name, param)
        minetest.log("lua_object_get_inventory is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_inventory()
        minetest.log(dump(a:get_list("main")))
    end,
})

-- get_weild_list(self)
minetest.register_chatcommand("lua_object_get_weild_list", {
    description = "Get the player's current HP",
    func = function(name, param)
        minetest.log("lua_object_get_weild_list is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end

        local pos = player:get_pos()
        local saos = minetest.get_objects_inside_radius(pos, 2)
        
        -- Check if saos is empty
        if #saos == 0 then
            minetest.log("No Active Objects near Player")
            return
        end
        
        -- Output the size of saos to minetest.log
        minetest.log("Size of Active Objects Array: " .. #saos)

        local plyr = saos[1]
        local a = plyr:get_wield_list()
        minetest.log("The player's wield list is " ..dump(a))
    end,
})

-- l_set_breath
minetest.register_chatcommand("lua_object_set_breath", {
    description = "Test Set Breath - /lua_object_set_breath (breath_value)",
    func = function(name, param)
        minetest.log("lua_object_set_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath_value = tonumber(param)
        if not breath_value then
            minetest.log("Invalid breath value")
            return
        end

        player:set_breath(breath_value)
        minetest.log("Player breath set to: " .. breath_value)
    end,
})

-- l_get_breath
minetest.register_chatcommand("lua_object_get_breath", {
    description = "Test Get Breath",
    func = function(name, param)
        minetest.log("lua_object_get_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath = player:get_breath()
        minetest.log("Player's current breath: " .. breath)
    end,
})

-- native_set_breath
minetest.register_chatcommand("native_object_set_breath", {
    description = "Test Set Breath - /native_object_set_breath (breath_value)",
    func = function(name, param)
        minetest.log("native_object_set_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath_value = tonumber(param)
        if not breath_value then
            minetest.log("Invalid breath value")
            return
        end

        player:native_set_breath(breath_value)
        minetest.log("Player breath set to: " .. breath_value)
    end,
})

-- native_get_breath
minetest.register_chatcommand("native_object_get_breath", {
    description = "Test Get Breath",
    func = function(name, param)
        minetest.log("native_object_get_breath is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local breath = player:native_get_breath()
        minetest.log("Player's current breath: " .. breath)
    end,
})



-- l_set_fov
minetest.register_chatcommand("lua_object_set_fov", {
    description = "Test Set FOV - /lua_object_set_fov (degrees) (is_multiplier) (transition_time)",
    func = function(name, param)
        minetest.log("lua_object_set_fov is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end
        
        local degrees, is_multiplier, transition_time = string.match(param, "^(%-?%d+%.?%d*) (%a+) (%d+%.?%d*)$")
        degrees = tonumber(degrees)
        transition_time = tonumber(transition_time)
        is_multiplier = is_multiplier == "true"
        
        if not degrees or is_multiplier == nil or not transition_time then
            minetest.log("Invalid FOV values")
            return
        end
        
        player:set_fov(degrees, is_multiplier, transition_time)
        minetest.log("Player FOV set to: degrees: " .. degrees .. " is_multiplier: " .. tostring(is_multiplier) .. " transition_time: " .. transition_time)
    end,
})

-- l_get_fov
minetest.register_chatcommand("lua_object_get_fov", {
    description = "Test Get FOV",
    func = function(name, param)
        minetest.log("lua_object_get_fov is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local degrees, is_multiplier, transition_time = player:get_fov()
        minetest.log("Player's current FOV: degrees: " .. degrees .. " is_multiplier: " .. tostring(is_multiplier) .. " transition_time: " .. transition_time)
    end,
})

-- l_set_attribute
minetest.register_chatcommand("lua_object_set_attribute", {
    description = "Test Set Attribute - /lua_object_set_attribute (attribute) (value)",
    func = function(name, param)
        minetest.log("lua_object_set_attribute is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local attribute, value = string.match(param, "^([^ ]+) (.+)$")
        
        if not attribute or not value then
            minetest.log("Invalid attribute or value")
            return
        end
        
        player:set_attribute(attribute, value)
        minetest.log("Player " .. attribute .. " set to: " .. value)
    end,
})

-- l_get_attribute
minetest.register_chatcommand("lua_object_get_attribute", {
    description = "Test Get Attribute - /lua_object_get_attribute (attribute)",
    func = function(name, param)
        minetest.log("lua_object_get_attribute is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local attribute = param
        
        if not attribute then
            minetest.log("Invalid attribute")
            return
        end
        
        local value = player:get_attribute(attribute)
        minetest.log("Player's " .. attribute .. ": " .. (value or "nil"))
    end,
})

-- l_get_meta
minetest.register_chatcommand("lua_object_get_meta", {
    description = "Test Get Meta",
    func = function(name, param)
        minetest.log("lua_object_get_meta is running!")
        local player = minetest.get_player_by_name(name)
        
        if not player then
            minetest.log("Player not found")
            return
        end
        
        local meta = player:get_meta()
        
        if meta then
            minetest.log("Player Meta Retrieved")
        else
            minetest.log("Failed to Retrieve Player Meta")
        end
    end,
})


-- native_set_attribute
minetest.register_chatcommand("native_set_attribute", {
    description = "Test Set Attribute",
    func = function(name, param)
        minetest.log("native_set_attribute is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        -- Assuming param is "attribute value"
        local attribute, value = string.match(param, "([^ ]+) (.+)")
        if not attribute or not value then
            minetest.log("Invalid parameters")
            return
        end

        player:native_set_attribute(attribute, value)
        minetest.log("Attribute " .. attribute .. " set to " .. value)
    end,
})

-- native_get_attribute
minetest.register_chatcommand("native_get_attribute", {
    description = "Test Get Attribute",
    func = function(name, param)
        minetest.log("native_get_attribute is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        if not param then
            minetest.log("Invalid parameter")
            return
        end

        local value = player:native_get_attribute(param)
        if value then
            minetest.log("Attribute " .. param .. " is " .. value)
        else
            minetest.log("Attribute " .. param .. " not found")
        end
    end,
})

-- native_get_meta
minetest.register_chatcommand("native_get_meta", {
    description = "Test Get Meta",
    func = function(name, param)
        minetest.log("native_get_meta is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local meta = player:native_get_meta()
        if meta then
            -- As an example, if param is an attribute name, get it from the MetaDataRef
            if param then
                local value = meta:get_string(param)
                if value then
                    minetest.log("Meta attribute " .. param .. " is " .. value)
                else
                    minetest.log("Meta attribute " .. param .. " not found")
                end
            else
                minetest.log("Meta data retrieved")
            end
        else
            minetest.log("Meta data not found")
        end
    end,
})

--native_set_fov
minetest.register_chatcommand("native_set_fov", {
    description = "Test Set FOV - /native_set_fov (degrees) (is_multiplier) (transition_time)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return true, "Player not found"
        end
        
        local degrees, is_multiplier, transition_time = string.match(param, "(%S+)%s*(%S*)%s*(%S*)")
        
        degrees = tonumber(degrees)
        is_multiplier = is_multiplier == "true"
        transition_time = tonumber(transition_time) or 0 -- default to 0 if not provided
        
        if not degrees then
            return true, "Invalid degrees value"
        end
        
        player:native_set_fov(degrees, is_multiplier, transition_time)
        return true, "Player FOV set to: " .. degrees .. ", is_multiplier: " .. tostring(is_multiplier) .. ", transition_time: " .. transition_time
    end,
})


--native_get_fov
minetest.register_chatcommand("native_get_fov", {
    description = "Test Get FOV",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return true, "Player not found"
        end
        
        local degrees, is_multiplier, transition_time = player:native_get_fov()
        return true, "Player's current FOV: " .. degrees .. ", is_multiplier: " .. tostring(is_multiplier) .. ", transition_time: " .. transition_time
    end,
})

-- l_get_look_dir
minetest.register_chatcommand("lua_object_get_look_dir", {
    description = "Test Look Direction",
    func = function(name, param)
        minetest.log("lua_object_get_look_dir is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local look_dir = player:get_look_dir()
        minetest.log("Player's look direction (Lua): " .. minetest.pos_to_string(look_dir))
    end,
})

-- native_get_look_dir
minetest.register_chatcommand("native_object_get_look_dir", {
    description = "Test Look Direction using native implementation",
    func = function(name, param)
        minetest.log("native_object_get_look_dir is running!")
        local player = minetest.get_player_by_name(name)

        if not player then
            minetest.log("Player not found")
            return
        end

        local look_dir = player:native_get_look_dir()
        minetest.log("Player's look direction (Native): " .. minetest.pos_to_string(look_dir))
    end,
})

-- DEPRECATED: l_get_look_pitch
minetest.register_chatcommand("lua_object_get_look_pitch", {
    description = "Test Deprecated Get Look Pitch",
    func = function(name, param)
        minetest.log("lua_object_get_look_pitch is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_pitch = player:get_look_pitch()
        minetest.log("Deprecated Look Pitch: " .. look_pitch)
    end,
})

-- DEPRECATED: l_get_look_yaw
minetest.register_chatcommand("lua_object_get_look_yaw", {
    description = "Test Deprecated Get Look Yaw",
    func = function(name, param)
        minetest.log("lua_object_get_look_yaw is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_yaw = player:get_look_yaw()
        minetest.log("Deprecated Look Yaw: " .. look_yaw)
    end,
})

-- l_get_look_vertical
minetest.register_chatcommand("lua_object_get_look_vertical", {
    description = "Test Get Look Vertical",
    func = function(name, param)
        minetest.log("lua_object_get_look_vertical is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_vertical = player:get_look_vertical()
        minetest.log("Look Vertical: " .. look_vertical)
    end,
})

-- l_get_look_horizontal
minetest.register_chatcommand("lua_object_get_look_horizontal", {
    description = "Test Get Look Horizontal",
    func = function(name, param)
        minetest.log("lua_object_get_look_horizontal is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_horizontal = player:get_look_horizontal()
        minetest.log("Look Horizontal: " .. look_horizontal)
    end,
})

-- Native n_get_look_pitch
minetest.register_chatcommand("native_object_get_look_pitch", {
    description = "Test Native Get Look Pitch",
    func = function(name, param)
        minetest.log("native_object_get_look_pitch is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_pitch = player:native_get_look_pitch()
        minetest.log("Native Look Pitch: " .. look_pitch)
    end,
})

-- Native n_get_look_yaw
minetest.register_chatcommand("native_object_get_look_yaw", {
    description = "Test Native Get Look Yaw",
    func = function(name, param)
        minetest.log("native_object_get_look_yaw is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_yaw = player:native_get_look_yaw()
        minetest.log("Native Look Yaw: " .. look_yaw)
    end,
})

-- Native n_get_look_vertical
minetest.register_chatcommand("native_object_get_look_vertical", {
    description = "Test Native Get Look Vertical",
    func = function(name, param)
        minetest.log("native_object_get_look_vertical is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_vertical = player:native_get_look_vertical()
        minetest.log("Native Look Vertical: " .. look_vertical)
    end,
})

-- Native n_get_look_horizontal
minetest.register_chatcommand("native_object_get_look_horizontal", {
    description = "Test Native Get Look Horizontal",
    func = function(name, param)
        minetest.log("native_object_get_look_horizontal is running!")
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local look_horizontal = player:native_get_look_horizontal()
        minetest.log("Native Look Horizontal: " .. look_horizontal)
    end,
})


-- Lua l_set_look_vertical
minetest.register_chatcommand("lua_object_set_look_vertical", {
    description = "Test Lua Set Look Vertical - /lua_object_set_look_vertical (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:set_look_vertical(radians)
    end,
})

-- Lua l_set_look_horizontal
minetest.register_chatcommand("lua_object_set_look_horizontal", {
    description = "Test Lua Set Look Horizontal - /lua_object_set_look_horizontal (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:set_look_horizontal(radians)
    end,
})

-- DEPRECATED: Lua l_set_look_pitch
minetest.register_chatcommand("lua_object_set_look_pitch", {
    description = "Test (Deprecated) Lua Set Look Pitch - /lua_object_set_look_pitch (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:set_look_pitch(radians)
    end,
})

-- DEPRECATED: Lua l_set_look_yaw
minetest.register_chatcommand("lua_object_set_look_yaw", {
    description = "Test (Deprecated) Lua Set Look Yaw - /lua_object_set_look_yaw (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:set_look_yaw(radians)
    end,
})


-- Native n_set_look_vertical
minetest.register_chatcommand("native_object_set_look_vertical", {
    description = "Test Set Look Vertical - /native_object_set_look_vertical (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:native_set_look_vertical(radians)
    end,
})

-- Native n_set_look_horizontal
minetest.register_chatcommand("native_object_set_look_horizontal", {
    description = "Test Set Look Horizontal - /native_object_set_look_horizontal (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:native_set_look_horizontal(radians)
    end,
})

-- DEPRECATED: n_set_look_pitch
minetest.register_chatcommand("native_object_set_look_pitch", {
    description = "Test (Deprecated) Set Look Pitch - /native_object_set_look_pitch (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:native_set_look_pitch(radians)
    end,
})

-- DEPRECATED: n_set_look_yaw
minetest.register_chatcommand("native_object_set_look_yaw", {
    description = "Test (Deprecated) Set Look Yaw - /native_object_set_look_yaw (radians)",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found")
            return
        end

        local radians = tonumber(param)
        if not radians then
            minetest.log("Invalid radian value")
            return
        end

        player:native_set_look_yaw(radians)
    end,
})
-- Lua Testing for set_sky
minetest.register_chatcommand("lua_object_set_sky", {
    description = "Set Sky Parameters",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found!")
            return
        end
        -- Example sky parameters, you can modify as needed
        local sky_parameters = {
            base_color = "#ABCDEF",
            type = "regular",
            textures = {"sky_texture_1.png", "sky_texture_2.png", },
            clouds = true,
            sky_color = {
                day_sky = "#ABCDEF",
                day_horizon = "#ABCDEF",
                dawn_sky = "#ABCDEF",
                dawn_horizon = "#ABCDEF",
                night_sky = "#ABCDEF",
                night_horizon = "#ABCDEF",
                indoors = "#ABCDEF"
            }
        }
        player:set_sky(sky_parameters)
        minetest.log("Sky parameters set for player: " .. name)
    end
})

-- Native Testing for set_sky
minetest.register_chatcommand("native_object_set_sky", {
    description = "Set Sky Parameters using Native Implementation",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found!")
            return
        end
        -- Example sky parameters, you can modify as needed
        local sky_parameters = {
            base_color = "#ABCDEF",
            type = "regular",
            textures = {"sky_texture_1.png", "sky_texture_2.png",  },
            clouds = true,
            sky_color = {
                day_sky = "#ABCDEF",
                day_horizon = "#ABCDEF",
                dawn_sky = "#ABCDEF",
                dawn_horizon = "#ABCDEF",
                night_sky = "#ABCDEF",
                night_horizon = "#ABCDEF",
                indoors = "#ABCDEF"
            }
        }
        player:native_set_sky(sky_parameters)
        minetest.log("Sky parameters set using native function for player: " .. name)
    end
})

-- Lua Testing for get_sky
minetest.register_chatcommand("lua_object_get_sky", {
    description = "Retrieve Sky Parameters",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found!")
            return
        end
        local sky = player:get_sky()
        -- Here you can process and display the 'sky' data as needed
        minetest.log(dump(sky))
    end
})

-- Native Testing for get_sky
minetest.register_chatcommand("native_object_get_sky", {
    description = "Retrieve Sky Parameters using Native Implementation",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found!")
            return
        end
        local sky = player:native_get_sky()
        -- Here you can process and display the 'sky' data as needed
        minetest.log(dump(sky))
    end
})


-- Lua Testing for get_sky_color
minetest.register_chatcommand("lua_object_get_sky_color", {
    description = "Retrieve Sky Colors",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found!")
            return
        end
        local sky_color = player:get_sky_color()
        -- Here you can process and display the 'sky_color' data as needed
        minetest.log(dump(sky_color))
    end
})

-- Native Testing for get_sky_color
minetest.register_chatcommand("native_object_get_sky_color", {
    description = "Retrieve Sky Colors using Native Implementation",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            minetest.log("Player not found!")
            return
        end
        local sky_color = player:native_get_sky_color()
        -- Here you can process and display the 'sky_color' data as needed
        minetest.log(dump(sky_color))
    end
})



-- Lua Testing for set_sun
minetest.register_chatcommand("lua_object_set_sun", {
    description = "Test set_sun - /lua_object_set_sun",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local sun_params = {
            visible = true,
            texture = "some_texture.png",
            tonemap = "some_tonemap.png",
            sunrise = "some_sunrise.png",
            sunrise_visible = true,
            scale = 1.0
        }
        player:set_sun(sun_params)
        return true, "Sun parameters set using lua_object_set_sun"
    end,
})

-- Lua Testing for get_sun
minetest.register_chatcommand("lua_object_get_sun", {
    description = "Test get_sun - /lua_object_get_sun",
    func = function(name, _)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local sun_params = player:get_sun()
        -- Here, you can either print the parameters or use them further
        return true, "Got sun parameters using lua_object_get_sun"
    end,
})

-- Lua Testing for set_moon
minetest.register_chatcommand("lua_object_set_moon", {
    description = "Test set_moon - /lua_object_set_moon",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local moon_params = {
            visible = true,
            texture = "some_moon_texture.png",
            tonemap = "some_moon_tonemap.png",
            scale = 1.0
        }
        player:set_moon(moon_params)
        return true, "Moon parameters set using lua_object_set_moon"
    end,
})

-- Lua Testing for get_moon
minetest.register_chatcommand("lua_object_get_moon", {
    description = "Test get_moon - /lua_object_get_moon",
    func = function(name, _)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local moon_params = player:get_moon()
        -- Here, you can either print the parameters or use them further
        return true, "Got moon parameters using lua_object_get_moon"
    end,
})


-- Native Testing for set_sun
minetest.register_chatcommand("native_object_set_sun", {
    description = "Test set_sun using native call - /native_object_set_sun",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local sun_params = {
            visible = true,
            texture = "some_texture.png",
            tonemap = "some_tonemap.png",
            sunrise = "some_sunrise.png",
            sunrise_visible = true,
            scale = 1.0
        }
        player:native_set_sun(sun_params)
        return true, "Sun parameters set using native_object_set_sun"
    end,
})

-- Native Testing for get_sun
minetest.register_chatcommand("native_object_get_sun", {
    description = "Test get_sun using native call - /native_object_get_sun",
    func = function(name, _)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local sun_params = player:native_get_sun()
        -- Here, you can either print the parameters or use them further
        return true, "Got sun parameters using native_object_get_sun"
    end,
})

-- Native Testing for set_moon
minetest.register_chatcommand("native_object_set_moon", {
    description = "Test set_moon using native call - /native_object_set_moon",
    func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local moon_params = {
            visible = true,
            texture = "some_moon_texture.png",
            tonemap = "some_moon_tonemap.png",
            scale = 1.0
        }
        player:native_set_moon(moon_params)
        return true, "Moon parameters set using native_object_set_moon"
    end,
})

-- Native Testing for get_moon
minetest.register_chatcommand("native_object_get_moon", {
    description = "Test get_moon using native call - /native_object_get_moon",
    func = function(name, _)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found"
        end

        local moon_params = player:native_get_moon()
        -- Here, you can either print the parameters or use them further
        return true, "Got moon parameters using native_object_get_moon"
    end,
})


