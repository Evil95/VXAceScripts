#==============================================================================
# Help Window
# ----------------------------------------------------------------------------
# Version 2.0  (12.06.20)
# Von Evil95
#==============================================================================

# ----------------------------------------------------------------------------
# Aufrufen mit "$help = Help.new" via Skript...(Eventseite 3)
# Entfernen mit "$help.dispose" via Skript...(Eventseite 3)
# ----------------------------------------------------------------------------

class Help < Window_Base
  def initialize
    super(200, 15, 253, 365) #(X position, Y position, width, height) 
    self.back_opacity = 255
    self.contents = Bitmap.new(width - 32, height - 32)
    if $game_variables[90] == 0
      text
    end
    if $game_variables[90] == 1
      text2
    end
    if $game_variables[90] == 2
      text3
    end
  end
  def text
    self.contents.clear
    self.contents.draw_text(0, 0, 256, 32, "  Erklärung Abkürzungen")
    self.contents.draw_text(0, 40, 256, 32, "HP = Lebenspunkte")
    self.contents.draw_text(0, 60, 256, 32, "MP = Magiepunkte")
    self.contents.draw_text(0, 80, 256, 32, "TP = Technikpunkte")
    self.contents.draw_text(0, 100, 256, 32, "ATK = Angriffswert")
    self.contents.draw_text(0, 120, 256, 32, "DEF = Verteidigungswert")
    self.contents.draw_text(0, 140, 256, 32, "MAT = Magischer Angriff")
    self.contents.draw_text(0, 160, 256, 32, "MDF = Magische Verteitigung")
    self.contents.draw_text(0, 180, 256, 32, "AGI = Schnelligkeit")
    self.contents.draw_text(0, 200, 256, 32, "LUK = Glück")
    self.contents.draw_text(0, 220, 256, 32, "LV = Level")
    self.contents.draw_text(0, 240, 256, 32, "Exp = Erfahrungspunkte")
    self.contents.draw_text(0, 280, 256, 32, "       Drücke Enter um")
    self.contents.draw_text(0, 300, 256, 32, "         fortzufahren.")
  end
  def text2
    self.contents.clear
    self.contents.draw_text(0, 0, 256, 32, "          Steuerung")
    self.contents.draw_text(0, 40, 256, 32, "Pfeil Hoch = Hoch")
    self.contents.draw_text(0, 60, 256, 32, "Pfeil Links = Links")
    self.contents.draw_text(0, 80, 256, 32, "Pfeil Rechts = Rechts")
    self.contents.draw_text(0, 100, 256, 32, "Pfeil Runter = Runter")
    self.contents.draw_text(0, 120, 256, 32, "")
    self.contents.draw_text(0, 140, 256, 32, "Enter = Bestätigen")
    self.contents.draw_text(0, 160, 256, 32, "ESC = Abbrechen")
    self.contents.draw_text(0, 200, 256, 32, "F5 = Vollbid an/aus")
    self.contents.draw_text(0, 220, 256, 32, "F6 = Auslösung ändern")
    self.contents.draw_text(0, 180, 256, 32, "ESC = Menü aufrufen")
    self.contents.draw_text(0, 240, 256, 32, "")
    self.contents.draw_text(0, 280, 256, 32, "       Drücke Enter um")
    self.contents.draw_text(0, 300, 256, 32, "          fortzufahren.")
  end
    def text3
    self.contents.clear
    self.contents.draw_text(0, 0, 256, 32, "        Pad-Steuerung")
    self.contents.draw_text(0, 40, 256, 32, "Stick Hoch = Hoch")
    self.contents.draw_text(0, 60, 256, 32, "Stick Links = Links")
    self.contents.draw_text(0, 80, 256, 32, "Stick Rechts = Rechts")
    self.contents.draw_text(0, 100, 256, 32, "Stick Runter = Runter")
    self.contents.draw_text(0, 120, 256, 32, "")
    self.contents.draw_text(0, 140, 256, 32, "A = Bestätigen")
    self.contents.draw_text(0, 160, 256, 32, "B = Abbrechen")
    self.contents.draw_text(0, 200, 256, 32, "F5 = Vollbid an/aus")
    self.contents.draw_text(0, 220, 256, 32, "F6 = Auslösung ändern")
    self.contents.draw_text(0, 180, 256, 32, "Start = Menü aufrufen")
    self.contents.draw_text(0, 240, 256, 32, "")
    self.contents.draw_text(0, 280, 256, 32, "         Drücke A um")
    self.contents.draw_text(0, 300, 256, 32, "          fortzufahren.")
  end
end