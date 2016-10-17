# require 'csv'

namespace :import_data do
  desc "import data from an csv file"
  task add_students: :environment do
    puts 'hello'
    filename = 'tmp/alumnos.csv'
    #file = File.read( filename )
    array_actividades = Array.new
    array_actividades_2 = Array.new
    array_colegios = Array.new
    array_colegios_2 = Array.new

    File.open( filename , "r").each_line do |line|
      vector = line.split(';').map &:strip
      #NIE;Nombre;Bon.;Subgrupo;Actividad;Estado;F. Inicio;F. Fin;Cuenta Bancaria;NIF TIT.;Titular;Teléfono;Domicilio;CENTRO ;MONITOR

      vector[13] = corregir_centro vector[13]

      hash = {
          nie: vector[0], #student.nic
          nombre: vector[1], #student.surname, student.name
          bon: vector[2], #student.default_discount / 100, #student_activity_sign_up.activity_discount
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

      school = School.find_by name: vector[centro]

      a = Activity.find_by name: hash[:actividad]
      if a.blank?
        if not array_actividades.include? [ hash[:actividad], hash[:centro] ]
          array_actividades << [ hash[:actividad], hash[:centro] ]
        end
      else
        if not array_actividades_2.include? [ hash[:actividad], hash[:centro] ]
          array_actividades_2 << [ hash[:actividad] , hash[:centro] ]
        end
      end

      a = School.find_by name: hash[:centro]
      if a.blank?
        if not array_colegios.include? hash[:centro]
          array_colegios << hash[:centro]
        end
      else
        if not array_colegios_2.include? hash[:centro]
          array_colegios_2 << hash[:centro]
        end
      end
      #student.default_payment_type
      #student.scholar_phone_number
      #student.town
      #student.province
      #student.zip_code
      #student.created_at
      #student.updated_at
      #student.details
      #student.school_id

      # Table name: student_activity_sign_ups
      #student_activity_sign_up.activity_discount
      #student_activity_sign_up.payment_type
      #student_activity_sign_up.created_at
      #student_activity_sign_up.updated_at
      #student_activity_sign_up.activity_id
      #student_activity_sign_up.student_id


      #activity.started_at
      #activity.ended_at
      #activity.default_price
      #activity.details
      #activity.created_at
      #activity.updated_at
      #activity.school_id

      #puts vector
    end

    array_actividades.each { |x|  puts "#{x}" }
    # puts "###############"
    # array_actividades_2.each { |x|  puts "#{x} - actividad encontrada" }
    #
    # puts "--------------------"
    #
    # array_colegios.each { |x|  puts "#{x} - colegio no encontrado" }
    # puts "###############"
    # array_colegios_2.each { |x|  puts "#{x} - colegio encontrado" }
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
      when "NTRA. SRA DE LA LUZ"
        centro_ = "CEIP NUESTRA SEÑORA DE LA LUZ"
      when "NTRA. SRA DE LUZ"
        centro_ = "CEIP NUESTRA SEÑORA DE LA LUZ"
      when "NTRA. SRA DE LOS REMEDIOS"
        centro_ = "CEIP NUESTRA SEÑORA DE LOS REMEDIOS"
      when "PERAFAN DE RIVERA"
        centro_ = "CEIP PERAFAN DE RIVERA"
      when "PERAFÁN DE RIVERA"
        centro_ = "CEIP PERAFAN DE RIVERA"
      when "REGGIO"
        centro_ = "CEIP REGGIO"
      when "RRCC"
        centro_ = "CEIP REYES CATOLICOS"
      when "SERAFINA ANDRADES"
        centro_ = "CEIP SERAFINA ANDRADES"
    end
    centro_
  end

end
