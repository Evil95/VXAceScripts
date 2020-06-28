#==============================================================================
# Can't Get Off Vehicle Sound
# ----------------------------------------------------------------------------
# Version 1.1  (19.05.2020)
# Von Evil95
#==============================================================================
class Game_Player
  alias_method :play_vehiclebuzzer_getoff, :get_off_vehicle
  def get_off_vehicle
    play_vehiclebuzzer_getoff
    Sound.play_buzzer if !@vehicle_getting_off
  end
end
