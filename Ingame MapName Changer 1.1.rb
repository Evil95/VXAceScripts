#==============================================================================
# Ingame MapName Changer
# -----------------------------------------------------------------------------
# Version 1.1 (29.06.2020)
# Von Evil95
#==============================================================================
# IMPORTANT: 
# Not compatible with Yanflys Ace Save Engine. Original Mapname is still shown.
# -----------------------------------------------------------------------------
# HOW TO:
# Right before a Teleport-Call insert a script with the following text:
# $game_variables[MNC::VID] = "New Mapname"
# 
# In the event contents list it should look like this:
#
# Script: $game_variables[MNC::VID] = "New Mapname"
# Control Switches: [0001:Mapname_Switch] = ON
# Transfer Player:[001:MAP001] (001,001)
# Control Switches: [0001:Mapname_Switch] = OFF
#
#==============================================================================
module IMNC
  # Switch ID to turn the new Mapname on and off
  SID = 1
  # Variable ID to store the new name
  VID = 1
end
class Window_MapName < Window_Base
  def refresh
    contents.clear
    unless $game_map.display_name.empty?
      draw_background(contents.rect)
      if $game_switches[IMNC::SID] == false
        draw_text(contents.rect, $game_map.display_name, 1)
      else
        draw_text(contents.rect, $game_variables[IMNC::VID], 1)
      end
    end
  end
end
