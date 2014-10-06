local hudebug = {}

hudebug.active = false

hudebug.color = {}
hudebug.page = 1
hudebug.pageCount = 0
hudebug.color.r = 255
hudebug.color.g = 0
hudebug.color.b = 0
hudebug.color.a = 255

hudebug.posx = 5
hudebug.posy = 0

hudebug.scale = 1.2

hudebug.slots = {}

--[[
  function hudebug.setHudColor
  @param (number) r, (number) g, (number) b, (number) a
    -Values for red, green, blue, and alpha (opacity) respectively.
    
  Changes the color of the text displayed by HuDebug.
]]--

function hudebug.setHudColor(r,g,b,a)
  hudebug.color.r = r
  hudebug.color.g = g
  hudebug.color.b = b
  hudebug.color.a = a  
end

--[[
  function hudebug.setScale
  @param (number) scale
    -Value for scaling of text
    
  Scales the HuDebug text.
]]--

function hudebug.setScale(scale)
    hudebug.scale = scale
end

--[[
  function hudebug.setPosition
  @param (number) x, (number) y
    -Values for position of debugging.
    
  Moves the position of the top-left corner of the text.
]]--

function hudebug.setPosition(x,y)
    hudebug.posx = x
    hudebug.posy = y
end

--[[
  function hudebug.pageName
  @param (number) page, (string) name
    -Which page index and what name for the page
    
  Either creates or renames the page depending on whether or not hudebug.slots[page] existed.
]]--

function hudebug.pageName(page, name)
  if not hudebug.slots[page] then
    hudebug.slots[page] = {}
    hudebug.slots[page].name = name
    hudebug.pageCount = hudebug.pageCount + 1
  else
    hudebug.slots[page].name = name
  end
end

--[[
  function hudebug.updateMsg
  @param (number) page, (integer/string) slot, (string/integer) msg
  
  Stores the message msg to page page in the unique key slot

]]--

function hudebug.updateMsg(page,slot,msg)
    if msg == "" then 
      msg = nil end
    if not hudebug.slots[page] then
      hudebug.slots[page] = {}
    end
    hudebug.slots[page][slot] = msg
end

--[[
  function hudebug.reset
  
  Resets all pages and values.
  If you call this you need to create pages again. Maybe add a clear Page function
]]--

function hudebug.reset()
    hudebug.slots = nil
    hudebug.slots = {}
end

--[[
  function hudebug.toggle
  
  Sets active state of HuDebug to on/off

]]--

function hudebug.toggle()
    hudebug.active = not hudebug.active
end

--[[
  function hudebug.nextPage

  Iterates through the pages. Pages, like lua tables, start at index 1.
]]--

function hudebug.nextPage()
  local p = hudebug.page
  if p == hudebug.pageCount then
    hudebug.page = 1
  else
    hudebug.page = p + 1
  end
end

--[[
  function hudebug.draw
  
  Draws the text to the screen.

]]--
function hudebug.draw()
  if (not hudebug.active) then return end
    local c = 1
    local y = hudebug.posy
    local page = hudebug.page
    love.graphics.push()
    love.graphics.scale(hudebug.scale)
    love.graphics.reset()
    love.graphics.setColor(hudebug.color.r,hudebug.color.g,hudebug.color.b,hudebug.color.a)
    love.graphics.print("--Debug: " .. hudebug.slots[page].name .. "--",hudebug.posx,hudebug.posy)
    for i,v in pairs(hudebug.slots[page]) do
      if i ~= "name" then
        y = hudebug.posy+ c*20
        love.graphics.print(v,hudebug.posx,y)
        c = c+1
      end
    end
    love.graphics.pop()
end

return hudebug
