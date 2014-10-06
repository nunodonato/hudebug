HUDebug
=======

HUDebug - lövely and quick onscreen debugging

##Quick start
  
    hudebug = require("hudebug")
    
    function love.draw()
      -- draw code..
      
      hudebug.draw() -- should be the last thing
    end
    
    function love.update(dt)
      hudebug.updateMsg("dtinfo","dt = "..dt)
    end

##Message slots

  The Paged version of HUDebug uses two values for messages: page, and slot. The page is always an integer value and the   slot may be either an integer or string. Below is an example of an updateMsg call.
    
      hudebug.updateMsg(page, slot, message)
      
  * If the slot_id does not exist, it is created. 
  * An empty message ("") will delete the slot.
  
Use reset() to delete all slots and messages. If this is done, you will need to initialize any pages you intend to use. Also, if this is done while HUDebug is on, it will be turned off to prevent crashes.

      hudebug.reset()

##Working with HUDebug Pages

  To manage this library it is very simple. In your love.load() function, have a separate function call do something like this:
  
    function DebugPages()
      hudebug.pageName(1, "Your Page 1")
      hudebug.pageName(2, "Your Page 2")
      hudebug.pageName(3, "Your Page 3")
      hudebug.pageName(4, "Your Page 4")
    end
  
  When you are updating a message on a page, use the following format:
  
    function FooBar()
     hudebug.updateMsg(1, "Test", "X: " .. unit.x)
     hudebug.updateMsg(2, 12, "Y: " .. unit.y)
    end
      
##Configuration

These are things that can be modified at run time on HUDebug.

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


