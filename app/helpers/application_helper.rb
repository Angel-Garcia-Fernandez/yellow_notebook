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
    selected = object.send( enum_symbol ).try(:to_sym)
    options_for_select collection.collect { |key, index|
                         [ model.send( :human_enum_name, enum_symbol, key), key ] } ,
                       #selected: ( collection[ selected ] || 0 )
                       selected: ( selected || collection.keys.first )
  end

  def enum_humanize object, enum_symbol
    model = object.class
    key = object.send( enum_symbol )
    #model.human_enum_name enum_symbol, key
    model.send( :human_enum_name, enum_symbol, key )
  end

  def time_format date_time
    date_time.try( :strftime, '%H:%M' )
  end

  def date_format date_time
    date_time.try( :strftime, '%d/%m/%Y' )
  end

  def datetime_format date_time
    #l date_time, format: long if date_time.present?
    date_time.try(:strftime,'%d/%m/%Y %H:%M')
  end

end
