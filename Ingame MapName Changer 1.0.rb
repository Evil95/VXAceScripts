#==============================================================================
# Ingame MapName Changer
# -----------------------------------------------------------------------------
# Version 1.0 (28.06.2020)
# Von Evil95
#==============================================================================
# How to:
# Right before a Teleport-Call insert a script with the following text:
# IMNC::NEW_NAME = "New Mapname"
# 
# In the event contents list is should look like this:
#
# Script: IMNC::NEW_NAME = "New Mapname"
# Control Switches: [0001:Mapname_Switch] = ON
# Transfer Player:[001:MAP001] (001,001)
# Control Switches: [0001:Mapname_Switch] = OFF
#
#==============================================================================
module IMNC
  # Switch ID to turn the new Mapname on and off
  SID = 1
  # alternative name
  NEWNAME = ""
end

class Window_MapName < Window_Base
  def refresh
    contents.clear
    unless $game_map.display_name.empty?
      draw_background(contents.rect)
      if $game_switches[IMNC::SID] == false
        draw_text(contents.rect, $game_map.display_name, 1)
      else
        draw_text(contents.rect, IMNC::NEW_NAME, 1)
      end
    end
  end
end
