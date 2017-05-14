
module FeedingDomain
  module_function

  def feed parse
    ActiveRecord::Base.transaction do
      parse.status = :converting
      parse.csv_conversion_started_at = Time.current
      parse.save!
    end
    path = parse.xls_file.file.path

    spreadsheet = open_spreadsheet path

    parse.output += "CSV conversion stating time #{DatetimeDomain.datetime_format( parse.csv_conversion_started_at )} \n"
    parse.save

    ActiveRecord::Base.transaction do
      parse.status = :convert_succeed
      parse.csv_conversion_ended_at = Time.current
      parse.save!
    end

    parse.output += spreadsheet.info + "\n"
    parse.output += "CSV conversion ending time #{DatetimeDomain.datetime_format( parse.csv_conversion_ended_at )} \n"
    parse.save

    ActiveRecord::Base.transaction do
      parse.status = :parsing
      parse.parsing_started_at = Time.current
      parse.save!
    end

    parse.output += "Parsing starting time #{DatetimeDomain.datetime_format( parse.parsing_started_at  )} \n"
    parse.save

    feeding_output = String.new
    ActiveRecord::Base.transaction do
      parse.status = :parse_succeed
      feeding_output += feed_db( spreadsheet, parse )
      parse.parsing_ended_at = Time.current
      parse.save!
    end

    parse.output += "Parsing ending time #{DatetimeDomain.datetime_format( parse.parsing_ended_at  )} \n"
    parse.save

  end

  def open_spreadsheet path
    case File.extname(path)
      when '.csv' then Roo::Spreadsheet.open( path, extension: :csv )
      when '.xls' then Roo::Spreadsheet.open( path, extension: :xls )
      when '.xlsx' then Roo::Spreadsheet.open( path, extension: :xlsx )
      else raise "Unknown file type"
    end
  end


  def feed_db spreadsheet, parse

    output = String.new

    array_actividades = Array.new
    array_colegios = Array.new
    array_estudiantes = Array.new
    array_apuntados = Array.new

    ActiveRecord::Base.transaction do

      spreadsheet.parse( #NIE;Nombre;Bon.;Subgrupo;Actividad;Estado;F. Inicio;F. Fin;Cuenta Bancaria;NIF TIT.;Titular;Teléfono;Domicilio;CENTRO ;MONITOR
          # clean: true,
          nie: /NIE/,
          nombre: /Nombre/ ,
          bon: /Bon\./,
          subgrupo: /Subgrupo/,
          actividad: /Actividad/,
          estado: /Estado/,
          f_inicio: /F\. Inicio/,
          f_fin: /F\. Fin/,
          cuenta_bancaria: /Cuenta Bancaria/,
          nif_titular: /NIF TIT\./,
          titular: /Titular/,
          telefono: /Teléfono/,
          domicilio: /Domicilio/,
          centro: /CENTRO/,
          monitor: /MONITOR/) do |hash|

        if hash[:nie].present? and hash[:nie] != 'NIE'

          student = Student.find_by nic: hash[:nie]


          if student.blank?
            hash[:nombre] = hash[:nombre].split(', ')
            name = hash[:nombre][1]
            surname = hash[:nombre][0]
            student = Student.new( nic: hash[:nie], name: name, surname: surname,  address: hash[:domicilio], phone_number: hash[:telefono],
                                   iban: hash[:cuenta_bancaria], account_holder: hash[:titular], account_holder_nic: hash[:nif_titular] )
            # if not student.save
            #   puts student.errors.messages
            # end
            student.save!
            array_estudiantes << hash[:nie]
          end

          school = School.find_by( name: hash[:centro] ) || SchoolExcelName.find_by( name: hash[ :centro ] ).try( :school )

          if school.blank?
            school = School.new( name: hash[:centro])
            # if not school.save
            #   puts school.errors.messages
            # end
            school.save!
            # unless array_colegios.include? hash[:centro]
              array_colegios << hash[:centro]
            # end
          end

          activity = Activity.find_by name: hash[:actividad], school: school, course: parse.course
          if activity.blank?
            activity = Activity.new( name: hash[:actividad], school: school, course: parse.course, classification: "#{hash[:subgrupo]} - CREADA AUTOMÁTICA\n" )
            # if not activity.save
            #   puts activity.errors.messages
            # end
            activity.save!
            # unless array_actividades.include? [ hash[:actividad], hash[:centro], parse.course.name ]
              array_actividades << [ hash[:actividad], hash[:centro], parse.course.name ]
            # end
          end

          sign_up = StudentActivitySignUp.find_by activity: activity, student: student
          if sign_up.blank?
            sign_up = StudentActivitySignUp.new( activity: activity, student: student,
                                                 started_at: hash[:f_inicio], ended_at: hash[:f_fin],
                                                 activity_discount: hash[:bon].to_i/100.0 )
            # if not sign_up.save
            #   puts sign_up.errors.messages
            # end
            sign_up.save!
            array_apuntados << [ hash[:actividad], hash[:centro], hash[:nie] ]
          end

        # else
        #   output << 'línea en blanco\n'
        end
      end

      raise ActiveRecord::Rollback
    end



    output << "\nActividades no encontradas - se crean automáticamente\n--------------------\n"

    array_actividades.each { |x|  output << "#{x}\n" }

    output << "\nColegios no encontrado - se ha creado automáticamente\n--------------------\n"

    array_colegios.each { |x|  output << "#{x}\n" }

    output << "\nEstudiantes no encontrado - se ha creado automáticamente\n--------------------\n"

    array_estudiantes.each { |x|  output << "#{x}\n" }

    output << "\nApuntado no encontrado - se ha creado automáticamente\n--------------------\n"

    array_apuntados.each { |x|  output << "#{x}\n" }

    output
  end

end