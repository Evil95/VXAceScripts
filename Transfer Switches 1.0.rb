#==============================================================================
# Transfer Switches
# -----------------------------------------------------------------------------
# Version 1.0 (21.06.2020)
# Von Evil95
#==============================================================================
class Scene_Map < Scene_Base
  alias :switches_transfer :pre_transfer
  def pre_transfer
  switches_transfer
  # Hier die Switches für die ganzen Mobs eintragen
  $game_switches[140] = true
  $game_switches[141] = true
  $game_switches[142] = true
  $game_switches[143] = true
  $game_switches[144] = true
  $game_switches[145] = true
  $game_switches[146] = true
  $game_switches[147] = true
  $game_switches[151] = true
  $game_switches[152] = true
  end
end
