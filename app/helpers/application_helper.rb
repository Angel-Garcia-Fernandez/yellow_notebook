module ApplicationHelper

  def boolean_glyph boolean
    case boolean
      when nil
        glyph 'question-sign'
      when true
        glyph 'ok'
      when false
        glyph 'remove'
    end
  end

  def enum_options_for_select object, enum_symbol
    model = object.class
    collection = model.send( enum_symbol.to_s.pluralize )
    selected = object.send( enum_symbol ).to_sym
    options_for_select collection.collect { |key, index|
                         [ model.send( :human_enum_name, enum_symbol, key), key ] } ,
                       #selected: ( collection[ selected ] || 0 )
                       selected: ( selected || collection.keys.first )
  end

end
