module ApplicationHelper

  def boolean_glyph boolean
    if boolean
      glyph 'ok'
    else
      glyph 'remove'
    end
  end

end
