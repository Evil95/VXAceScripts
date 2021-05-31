#==============================================================================
# Ingame MapName Changer
# -----------------------------------------------------------------------------
# Version 1.2 (30.05.2021)
# Von Evil95
#==============================================================================
#
# -----------------------------------------------------------------------------
# Changelog:
#
# Version 1.0
#  - Initial Release
# Version 1.1
#  - Added the uses of a game variable to store the mapname
#  - Bugfix
# Version 1.1.1
#  - Bugfix
# Version 1.2
#  - Added compatible with Yanfly's Save Engine
#
# -----------------------------------------------------------------------------
# How to:
#
# Right before a Teleport-Call insert a script with the following text:
# $game_variables[IMNC::VID] = "New Mapname"
# 
# In the event contents list it should look like this:
# Script: $game_variables[IMNC::VID] = "New Mapname"
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

class Game_Map
  def display_name
    if $game_switches[IMNC::SID] == false
      @map.display_name
    else
      @map.display_name = $game_variables[IMNC::VID]
    end
  end
end
