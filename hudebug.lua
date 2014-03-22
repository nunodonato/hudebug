-- hudebug 22 March 2014
-- https://github.com/nunodonato/hudebug

local hudebug = {}

local active = true

hudebug.color = {}
hudebug.color.r = 0
hudebug.color.g = 0
hudebug.color.b = 0
hudebug.color.a = 255

hudebug.posx = 100
hudebug.posy = 100

hudebug.scale = 1.2

hudebug.slots = {}

function hudebug.setHudColor(r,g,b,a)
  hudebug.color.r = r
  hudebug.color.g = g
  hudebug.color.b = b
  hudebug.color.a = a  
end

function hudebug.setScale(scale)
    hudebug.scale = scale
end


function hudebug.updateMsg(slot,msg)
    if msg == "" then 
      msg = nil end
    hudebug.slots[slot] = msg
end

function hudebug.reset()
    hudebug.slots = nil
    hudebug.slots = {}
end


function hudebug.draw()
  if (not active) then return end
    local c = 1
    local y = hudebug.posy
    love.graphics.scale(hudebug.scale)
    love.graphics.reset()
    love.graphics.setColor(hudebug.color.r,hudebug.color.g,hudebug.color.b,hudebug.color.a)
    love.graphics.print("--HUDEBUG ON--",hudebug.posx,hudebug.posy)
    for i,v in pairs(hudebug.slots) do
      y = hudebug.posy+ c*20
      love.graphics.print(v,hudebug.posx,y)
      c = c+1
    end
    
end

return hudebug
