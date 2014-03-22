hudebug
=======

HUDebug - lövely and quick onscreen debugging

##quick start
  
    hudebug = require("hudebug")
    
    function love.draw()
      -- all your stuff...
      
      hudebug.draw() -- should be the last thing
    end
    
    function love.update(dt)
      hudebug.updateMsg("dtinfo","dt = "..dt)
    end

## the message slots

  hudebug stores one message for each slot id. You add/update a message to a slot with
    
      hudebug.updateMsg(slot_id,message)
      
  * If the slot_id does not exist, it is created. 
  * An empty message ("") will delete the slot.
  
Use reset() to delete all slots and messages

      hudebug.reset()

      
##advanced config

stuff you can do after loading hudebug

#### Set HUD color

    hudebug.setHudColor(r,g,b,a)
  self explanatory, no?

#### Set Text size

    hudebug.setScale(scale)
  Scale text by the 'scale' value
  
## Screenshots?

[Imgur](http://i.imgur.com/m9leK4R.png)

amazing, huh?
