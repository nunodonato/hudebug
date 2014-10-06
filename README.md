hudebug
=======

HUDebug - lövely and quick onscreen debugging

##quick start
  
    hudebug = require("hudebug")
    
    function love.draw()
      -- draw code..
      
      hudebug.draw() -- should be the last thing
    end
    
    function love.update(dt)
      hudebug.updateMsg("dtinfo","dt = "..dt)
    end

## the message slots

  The Paged version of HuDebug uses two values for messages: page, and slot. The page is always an integer value and the   slot may be either an integer or string. Below is an example of an updateMsg call.
    
      hudebug.updateMsg(page, slot, message)
      
  * If the slot_id does not exist, it is created. 
  * An empty message ("") will delete the slot.
  
Use reset() to delete all slots and messages. If this is done, you will need to initialize any pages you intend to use. Also, if this is done while hudebug is on, it will be turned off to prevent crashes.

      hudebug.reset()

      
##Configuration

These are things that can be modified at run time on HuDebug.

#### Set HUD color

    hudebug.setHudColor(r,g,b,a)
  self explanatory, no?

#### Set Text size

    hudebug.setScale(scale)
  Scale text by the 'scale' value.
  
#### Set HUD position

    hudebug.setPosition(x,y)
  Start printing text from x,y position on the screen.
  
#### Toggle HUD visibility

    hudebug.toggle()
  
## Screenshots?

This is an old img from the master source, new ones will be uploaded later.

[Imgur](http://i.imgur.com/m9leK4R.png)


