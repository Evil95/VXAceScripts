#==============================================================================
# Ja / Nein Choice
# ----------------------------------------------------------------------------
# Version 1.0.1  (15.06.20)
# Von Evil95
#==============================================================================
class Window_Choice < Window_Command
  def initialize
    super(0, 0)
      update_placement
      self.openness = 0
      self.back_opacity = 255
      open
  end
  def window_width
    return 75
  end
  def alignment
    return 1
  end
    def update_placement
    self.x = (Graphics.width - width) / 2
    self.y = (Graphics.height - height) / 1.1
  end
  def make_command_list
    add_command("Ja", :ja)
    add_command("Nein", :nein)
  end
end

class Frage < Window_Base
  def initialize
    super(170, 48, 288, 80)
    self.back_opacity = 255
    self.contents = Bitmap.new(width - 32, height - 32)
    fragetext
  end
  def fragetext
    self.contents.clear
    self.contents.draw_text(20, 10, 256, 32, "Spielsteuerung erklären?")
  end
end

class Scene_Choice < Scene_Base
  alias start_old start
  def start
    start_old
    create_command_window
  end
  def pre_terminate
    super
    close_command_window
  end
  def update
    super
  end
  def create_command_window
    $frage = Frage.new
    @command_window = Window_Choice.new
    @command_window.set_handler(:ja, method(:ja_auswahl))
    @command_window.set_handler(:nein, method(:nein_auswahl))
  end
  def close_command_window
    $frage.dispose
    @command_window.close if @command_window
    update until @command_window.close?
  end
  def ja_auswahl
    $frage.dispose
    close_command_window
    Graphics.fadeout(40)
    Graphics.wait(20)
    $game_variables[90] = 1
    SceneManager.call(Scene_Map)
  end
  def nein_auswahl
    $frage.dispose
    close_command_window
    Graphics.fadeout(40)
    Graphics.wait(20)
    SceneManager.call(Scene_Map)
  end
end