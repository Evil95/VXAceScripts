#============================================================
# ? [VXAce] ? Quick Face Border ? 1.6.1 ?
#------------------------------------------------------------
# ? Original by Woratana [woratana@hotmail.com]
# ? RGSS3 Conversion by Evil95
# ? Thaiware RPG Maker Community
# ? Original Released Date: 23/02/2008
# ? Conversion Release Date: 12/06/2020
#------------------------------------------------------------
# Version 1.6.1
# - Added Border in Skill Menu (VX doesn't have Faces in Skill Menu)
# Version 1.6
# - Changed Scenes to RGGS3 (by Evil95)
# - Removed Picture as Border
# - Optimized Border Position in Menu and Status
# - Removed Border in Message (use modern algebra's ATS Series instead)
# Version 1.5
# - Edited Window_Message Bug
# - You can use custom image for border
#============================================================
class Window_Base < Window
  #------------------------------
  # START SETUP SCRIPT
  #---------------------------
  BORDER_SKIN = "Window" # Name of Window Skin for Border
  BORDER_OPACITY = 255 # Face Border's Opacity (0 - 255)
  # (true/false)
  USE_BORDER_IN_SKILL_WINDOW = true
  USE_BORDER_IN_MENU = true
  USE_BORDER_IN_STATUS_WINDOW = true
  USE_BORDER_IN_NAME_WINDOW = true
  #------------------------------
  # END SETUP SCRIPT
  #---------------------------
  alias wor_facbor_winbas_ini initialize
  alias wor_facbor_winbas_dis dispose
  alias wor_facbor_winbas_draf draw_face
  def initialize(x, y, width, height)
    wor_facbor_winbas_ini(x, y, width, height)
    @border = Array.new
  end
  def dispose
    delete_border if @border != []
    wor_facbor_winbas_dis
  end
  def draw_face(face_name, face_index, x, y, size = 96)
    if (SceneManager.scene_is?(Scene_Menu) and USE_BORDER_IN_MENU) or (SceneManager.scene_is?(Scene_Status) and USE_BORDER_IN_STATUS_WINDOW) or (SceneManager.scene_is?(Scene_Name) and USE_BORDER_IN_NAME_WINDOW)
        @border.push Window_Border.new(self.x + x + 12,self.y + y + 12,96,96)
    end
    wor_facbor_winbas_draf(face_name, face_index, x, y, size)
  end
  def delete_border
      for i in 0..(@border.size - 1)
        if !@border[i].nil?
          @border[i].dispose
        end
      end
      @border = []
  end
end
$worale = {} if !$worale
$worale["FaceBorder"] = true
class Window_Border < Window_Base
  def initialize(x,y,width,height)
    super(x,y,width,height)
    self.windowskin = Cache.system(BORDER_SKIN)
    self.opacity = BORDER_OPACITY
    self.back_opacity = 0
    self.z = 500
  end
end
#============================================================
#-----------------ADDED BY EVIL95----------------------------
#============================================================
class Window_SkillStatus < Window_Base
  def refresh
    contents.clear
    return unless @actor
    if (SceneManager.scene_is?(Scene_Skill) and USE_BORDER_IN_SKILL_WINDOW)
      @border.push Window_Border.new(170,84,98,96)
    end
    draw_actor_face(@actor, 0, 0)
    draw_actor_simple_status(@actor, 108, line_height / 2)
  end
end
#============================================================