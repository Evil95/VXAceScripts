#==============================================================================
# Time and Mapname in Menu
# -----------------------------------------------------------------------------
# Version 1.1 (09.11.2022)
# Von Evil95
#==============================================================================
#
#-----------------------------------------------------------------------------
# Changelog:
#
# Version 1.0
#  - Initial Release
# Version 1.1
#  - added Time and Location text
#
#==============================================================================
 
class Scene_Menu
 alias :time_create :create_gold_window
    def create_gold_window
    time_create
    @mapname_window = Window_Mapname.new(0, 178)
    @playtime_window = Window_Time.new(0, 300)
  end
end

class Game_Map
  def mapname
    $mapname = load_data("Data/MapInfos.rvdata2") 
    $mapname[@map_id].name
  end
end

class Window_Mapname < Window_Base
  def initialize(x, y)
    super(0, 192, 160, 60)
    refresh
  end  
  def refresh
    self.contents.clear
    self.contents.font.color = system_color
    self.contents.font.size = 12
    self.contents.draw_text(0, -13, 120, 36, "Standort")
    self.contents.font.color = normal_color
    self.contents.font.size = 20
    self.contents.draw_text(0, 0, 135, 45, $game_map.display_name, 1)
  end
end

class Window_Time < Window_Base
  def initialize(x, y)
    super(0, 252, 160, 60)
    refresh
  end
  def refresh
    self.contents.clear
    self.contents.font.color = system_color
    self.contents.font.size = 12
    self.contents.draw_text(0, -13, 120, 36, "Spielzeit")
    @total_sec = Graphics.frame_count / Graphics.frame_rate
    hour = @total_sec / 60 / 60
    min = @total_sec / 60 % 60
    sec = @total_sec % 60
    text = sprintf("%02d:%02d:%02d", hour, min, sec)
    self.contents.font.color = normal_color
    self.contents.font.size = 20
    self.contents.draw_text(0, 0, 130, 45, text, 1)
  end
  def update
    super
    if Graphics.frame_count / Graphics.frame_rate != @total_sec
      refresh
    end
  end
end
