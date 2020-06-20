=begin
Disable Dash v1.1
by PK8
edited by Evil95
Created: 5/26/2012
Modified: 6/05/2020
==============================================================================
? Author's Notes
   I'm well aware of the "Map Properties" option, but what if one wanted to
   disable dash completely?
==============================================================================
? Introduction
   This script allows developers to disable VX's built-in dash completely
   without having to spend much time unchecking a checkbox in Map Properties.
==============================================================================
? Features
   - Disables dashing completely.
   - Creators can set which maps don't disable dash.
==============================================================================
? Changelog
   - v1     (05/26/2012): Initial Release
   - v1.0.1 (06/01/2012): Corrected a mistake I made in the alias listings.
   - v1.0.2  (06/05/2020): Converted to RGSS3
==============================================================================
? Methods Aliased
   Game_Player.dash?
=end
#==============================================================================
# ** Configuration
#==============================================================================
module PK8
  class Disable_Dash
    #--------------------------------------------------------------------------
    # * General Settings
    #--------------------------------------------------------------------------
    # Turns script on (TRUE) or off (FALSE).
    Switch  = true
    # Set which maps will not make this script disable the dash.
    # Integers and Ranges can be set.
    Map_IDs = []
    #--------------------------------------------------------------------------
    # * Do Not Modify
    #--------------------------------------------------------------------------
    if Map_IDs.include?(nil)
      load_data("Data/Mapinfos.rvdata2").keys.each { |item| Map_IDs.push(item) }
      Map_IDs.delete(nil)
    end
    Map_IDs.each { |item|
      if item.is_a?(Range)
        for i in item; Map_IDs.push(i); end
        Map_IDs.delete(item)
      elsif item.is_a?(Array)
        item.each { | i |
          if i.is_a?(Integer); Map_IDs.push[i]
          elsif i.is_a?(Range); for i2 in i; Map_IDs.push[i2]; end
          end
        }
        Map_IDs.delete(item)
      end
    }
    Map_IDs.compact
  end
end
#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles maps. It includes event starting determinants and map
# scrolling functions. The instance of this class is referenced by $game_map.
#==============================================================================
class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  unless method_defined?(:pk8_disabledash_dash?)
    alias_method(:pk8_disabledash_dash?, :dash?)
  end
  #--------------------------------------------------------------------------
  # * Determine if Dashing
  #--------------------------------------------------------------------------
  def dash?
    if PK8::Disable_Dash::Switch == true
      return false if !PK8::Disable_Dash::Map_IDs.include?($game_map.map_id)
    end
    pk8_disabledash_dash?
  end
end