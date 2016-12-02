# require 'csv'

namespace :import_data do
  desc "import data from an csv file"
  task add_students: :environment do

    filename = 'db/alumnos.csv'
    #file = File.read( filename )
    array_actividades = Array.new
    array_colegios = Array.new

    #File.open( filename , "r").each_line do |line|
    File.open( filename , "r").each_with_index do |line, index|
      if index > 0 #skip headings
        ActiveRecord::Base.transaction do
          vector = line.split(';').map &:strip
          #NIE;Nombre;Bon.;Subgrupo;Actividad;Estado;F. Inicio;F. Fin;Cuenta Bancaria;NIF TIT.;Titular;Teléfono;Domicilio;CENTRO ;MONITOR

          #if vector[0].present? and vector[0] != "NIE"
          if vector[0].present?

            vector[13] = corregir_centro vector[13]

            hash = {
              nie: vector[0], #student.nic
              nombre: vector[1], #student.surname, student.name
              bon: vector[2], #student.default_discount / 100, #student_activity_sign_up.activity_discount / 100
              subgrupo: vector[3], #activity.classification
              actividad: vector[4], #activity.name
              estado: vector[5], #bye bye
              f_inicio: vector[6], #student_activity_sign_up.started_at
              f_fin: vector[7], #student_activity_sign_up.ended_at
              cuenta_bancaria: vector[8], #student.iban
              nif_titular: vector[9], #student.account_holder
              titular: vector[10], #student.account_holder_nic
              telefono: vector[11],#student.phone_number
              domicilio: vector[12],#student.address
              centro: vector[13], #school.name
              monitor: vector[14] #teacher.name
            }

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
            end

            school = School.find_by name: hash[:centro]

            if school.blank?
              school = School.new( name: hash[:centro])
              # if not school.save
              #   puts school.errors.messages
              # end
              school.save!
              unless array_colegios.include? hash[:centro]
                array_colegios << hash[:centro]
              end
            end

            activity = Activity.find_by name: hash[:actividad], school: school
            if activity.blank?
              activity = Activity.new( name: hash[:actividad], school: school, classification: "#{hash[:subgrupo]} - CREADA AUTOMÁTICA" )
              # if not activity.save
              #   puts activity.errors.messages
              # end
              activity.save!
              unless array_actividades.include? [ hash[:actividad], hash[:centro] ]
                array_actividades << [ hash[:actividad], hash[:centro] ]
              end
            end

            sign_up = StudentActivitySignUp.find_by activity: activity, student: student
            if sign_up.blank?
              sign_up = StudentActivitySignUp.new( activity: activity, student: student,
                                                   started_at: hash[:f_inicio], ended_at: hash[:f_fin],
                                                   activity_discount: hash[:bon].to_i/100 )
              # if not sign_up.save
              #   puts sign_up.errors.messages
              # end
              sign_up.save!
            end

          else
            puts "línea en blanco" #blank line
          end
        end
      end
    end

    puts "--------------------"

    array_actividades.each { |x|  puts "#{x}  - actividad no encontrada - se ha intentado crear automáticamente" }

    puts "--------------------"

    array_colegios.each { |x|  puts "#{x} - colegio no encontrado - se ha intentado crear automáticamente" }

  end

  private
  def corregir_centro centro
    centro_ = centro
    case centro
      when "CEIP EL ALBAICIN"
        centro_ = "CEIP ALBAICIN"
      when "CEIP FERNÁNDEZ PÓZAR"
        centro_ = "CEIP FRANCISCO FERNANDEZ POZAR"
      when "ISABEL LA CATÓLICA"
        centro_ = "CEIP ISABEL LA CATOLICA"
      when "JOSÉ DE LA VEGA"
        centro_ = "CEIP JOSE DE LA VEGA BARRIOS"
      when "NTRA. SRA DE LA LUZ", "NTRA. SRA DE LUZ", "CEIP NTRA SRA DE LA LUZ"
        centro_ = "CEIP NUESTRA SEÑORA DE LA LUZ"
      when "NTRA. SRA DE LOS REMEDIOS", "CEIP NTRA SRA DE LOS REMEDIOS"
        centro_ = "CEIP NUESTRA SEÑORA DE LOS REMEDIOS"
      when "PERAFAN DE RIVERA", "CEIP PERAFÁN DE RIBERA", "PERAFÁN DE RIVERA"
        centro_ = "CEIP PERAFAN DE RIVERA"
      when "REGGIO"
        centro_ = "CEIP REGGIO"
      when "RRCC", "CEIP RRCC"
        centro_ = "CEIP REYES CATOLICOS"
      when "SERAFINA ANDRADES"
        centro_ = "CEIP SERAFINA ANDRADES"
    end
    centro_
  end

end
