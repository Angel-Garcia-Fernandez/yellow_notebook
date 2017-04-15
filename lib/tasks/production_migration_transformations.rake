namespace :db do
  namespace :transformations do
    
    desc 'add first course after migration of creating courses'
    task add_first_course: :environment do
      puts 'TRANSFORMATION:ADD_FIRST_COURSE started'
      
      ActiveRecord::Base.transaction do
        first_course = Course.create!( name: 'Estándar 2016/2017' )
        puts 'first course inserted'

        Activity.all.where( course: nil ).each do |activity|
          puts "activity #{activity.id}"
          activity.course = first_course
          activity.save!
        end
        puts 'activities updated'
      end
      
      puts 'TRANSFORMATION:ADD_FIRST_COURSE finished'
    end
    
    desc 'add all known excel alternative names to every school'
    task add_alternative_names: :environment do
      puts 'TRANSFORMATION:ADD_ALTERNATIVE_NAMES started'

      ActiveRecord::Base.transaction do
        array_of_school_names = [
            { school: 'CEIP ALBAICIN', alternatives: [  'CEIP EL ALBAICIN' ] },
            { school: 'CEIP FRANCISCO FERNANDEZ POZAR', alternatives: [  'CEIP FERNÁNDEZ PÓZAR' ] },
            { school: 'CEIP ISABEL LA CATOLICA', alternatives: [  'ISABEL LA CATÓLICA' ] },
            { school: 'CEIP JOSE DE LA VEGA BARRIOS', alternatives: [  'JOSÉ DE LA VEGA' ] },
            { school: 'CEIP NUESTRA SEÑORA DE LA LUZ', alternatives: [  'NTRA. SRA DE LA LUZ', 'NTRA. SRA DE LUZ', 'CEIP NTRA SRA DE LA LUZ' ] },
            { school: 'CEIP NUESTRA SEÑORA DE LOS REMEDIOS', alternatives: [  'NTRA. SRA DE LOS REMEDIOS', 'CEIP NTRA SRA DE LOS REMEDIOS' ] },
            { school: 'CEIP PERAFAN DE RIVERA', alternatives: [  'PERAFAN DE RIVERA', 'CEIP PERAFÁN DE RIBERA', 'PERAFÁN DE RIVERA' ] },
            { school: 'CEIP REGGIO', alternatives: [  'REGGIO' ] },
            { school: 'CEIP REYES CATOLICOS', alternatives: [  'RRCC', 'CEIP RRCC' ] },
            { school: 'CEIP SERAFINA ANDRADES', alternatives: [  'SERAFINA ANDRADES' ] }
        ]
        array_of_school_names.each do |hash|
          school = School.find_by name: hash[:school]

          hash[:alternatives].each do |alternative|
            SchoolExcelName.create!( school: school, name: alternative )
          end
        end
        puts 'school_excel_name updated'
      end

      puts 'TRANSFORMATION:ADD_ALTERNATIVE_NAMES finished'
    end
  end
end
