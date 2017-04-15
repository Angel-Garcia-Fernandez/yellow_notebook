module DatetimeDomain
  module_function

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

  def datetime_range_format date_time_start, date_time_end
    #l date_time, format: long if date_time.present?
    "#{l date_time_start, format: '%d/%m/%Y %A %H:%M'}-#{date_time_end.try(:strftime,'%H:%M')}" if date_time_end.present? and date_time_start.present?
  end
end