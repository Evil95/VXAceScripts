#==============================================================================
# Show Game Version on Title Screen
# ----------------------------------------------------------------------------
# Version 2.2 (19.06.2020)
# Von Evil95
#==============================================================================
# Version 1.0
#   - Release
# Version 2.0
#   - Skript konfigurierbar gemacht
# Version 2.1
#   - Anzeigeort veränderbar
# Version 2.2
#   - Version nun in Major, Minor und Bugfix unterteilt
#   - Version kann nun in drei Variablen gespeichert werden
#     - für Major: Variable einzeln, Setzen, Skript: SGVOTS::MAJOR
#     - für Minor: Variable einzeln, Setzen, Skript: SGVOTS::MINOR
#     - für Bufgix: Variable einzeln, Setzen, Skript: SGVOTS::BUGFIX
#----------------------------------------------------------------------------
#                          CONFIG START
#----------------------------------------------------------------------------
module SGVOTS
  # Wenn auf true dann wird zusätzlich "Version:" angezeigt.
    VERSIONSTEXT = false 
    
  # Hier ein Text eintragen, der vor der Spielversion angezeigt wird,
  # wie zum Beispiel Alpha, Beta ect.
    VERSIONTEXT = "Version:"
    
  # Hier die derzeitige Spielversion eintragen:
    MAJOR = "0" 
    MINOR = "18"
    BUGFIX = "3"
  # Wenn auf true, dann wird die Anzeige mit 3 Zahlen angegeben zb: 1.0.5
    BUGFIXANZEIGE = true
  
  # Hier die Größe der Font eintragen. Standard ist 16.
    FONT_GROESSE = 16
  
  # Hier kannst du Fette Schrift (Bold) deaktivieren oder aktivieren:
    FETTE_FONT = true
  
  # Hier kannst du die Schrift-Schatten deaktivieren oder aktivieren:
    FONT_SCHATTEN = true
  
  # Hier kannst du Schriftfarbe bearbeiten:
    FONT_FARBE = 255,255,255,255
  
  # Hier kannst du Schriftart bearbeiten:
    FONT_NAME = "Verdana"
  
  # Hier kannst du den Anzeigeort ändern
  # 1 = Oben Links, 2 = Unten Links, 3 = Oben rechts, 4 = Unten rechts
    ORT = 4
end
#----------------------------------------------------------------------------
#                          CONFIG ENDE
#----------------------------------------------------------------------------

class Scene_Title
 alias :sgvots_create :create_background
 alias :sgvots_dispose :dispose_background
 def create_background
  sgvots_create
  $sgvots = Gameversion.new
 end
 def dispose_background
   sgvots_dispose
   $sgvots.dispose
 end
end

class Gameversion < Window_Base
  def initialize
    super(0, 0, 544, 416)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.opacity = 0
    refresh
  end
  def refresh
    self.contents.clear
    self.contents.font.name = SGVOTS::FONT_NAME
    self.contents.font.size = SGVOTS::FONT_GROESSE
    self.contents.font.color = Color.new(SGVOTS::FONT_FARBE[0],SGVOTS::FONT_FARBE[1],SGVOTS::FONT_FARBE[2],SGVOTS::FONT_FARBE[3])
    self.contents.font.shadow = SGVOTS::FONT_SCHATTEN
    self.contents.font.bold = SGVOTS::FETTE_FONT
    if SGVOTS::VERSIONSTEXT
      if SGVOTS::ORT == 1 #Oben Links
        if SVGOTS::BUGFIXANZEIGE
          self.contents.draw_text(0, 0, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX)
        else
          self.contents.draw_text(0, 0, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR)
        end
      end
    if SGVOTS::ORT == 2 #Unten Links
      if SGVOTS::BUGFIXANZEIGE
        self.contents.draw_text(0, 356, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX)
      else
        self.contents.draw_text(0, 356, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR)
      end
    end    
    if SGVOTS::ORT == 3 #Oben rechts
      if SGVOTS::BUGFIXANZEIGE
        self.contents.draw_text(350, 0, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX, 2)
      else
        self.contents.draw_text(350, 0, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR, 2)
      end
    end
    if SGVOTS::ORT == 4 #Unten rechts
      if SGVOTS::BUGFIXANZEIGE
        self.contents.draw_text(350, 356, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX, 2)
      else
        self.contents.draw_text(350, 356, 150, 34, " " + SGVOTS::VERSIONTEXT + " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR, 2)
      end
    end    
    else
      if SGVOTS::ORT == 1 #Oben Links
        if SGVOTS::BUGFIXANZEIGE
          self.contents.draw_text(0, 0, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX)
        else
          self.contents.draw_text(0, 0, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR)
        end
      end      
      if SGVOTS::ORT == 2 #Unten Links
        if SGVOTS::BUGFIXANZEIGE
          self.contents.draw_text(0, 356, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX)
        else
          self.contents.draw_text(0, 356, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR)
        end
      end      
      if SGVOTS::ORT == 3 #Oben rechts
        if SGVOTS::BUGFIXANZEIGE
          self.contents.draw_text(446, 0, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX, 2)
        else
          self.contents.draw_text(446, 0, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR, 2)
        end
      end      
      if SGVOTS::ORT == 4 #Unten rechts
        if SGVOTS::BUGFIXANZEIGE
          self.contents.draw_text(446, 356, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR + "." + SGVOTS::BUGFIX, 2)
        else
          self.contents.draw_text(446, 356, 150, 34, " " + SGVOTS::MAJOR + "." + SGVOTS::MINOR, 2)
        end        
      end
    end
  end
end