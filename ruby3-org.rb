
class  CarCreator
    
    @@white_changed = false
    @@iterator_cars = 0
    @@car_instances = []

    def init
        readCars
    end

    #small_cars = cars.select{|car| car.doors ==2}
    
    def readCars
        #for small files
        #lines=File.read('cars.txt').split('\n')
        File.open('cars.txt', 'r') do |f|
            while line = f.gets
                line = line.chomp
                doors, cylinder, color = line.split('|')
                createCar(doors, cylinder, color)
            end           
        end
        printCars 
    end
    
    def createCar(doors, cylinder, color)
        #@@iterator_cars += 1  
        #carname = "car" + @@iterator_cars.to_s
        case color
        when "prime"
            color = "red"
        when "yellow"
            color = "grey"
        when "white"  
            @@white_changed == false ? color = "green" : color = "black"
            @@white_changed = true
        end

        #@@cars << { :car => @@iterator_cars, :doors => doors, :cylinder => cylinder, :color => color }
        @@car_instances << Car.new(doors, cylinder, color)
        
    end

    def printCars
        @@car_instances.each do |instance|
            if  instance != 0
                puts "#{instance.instance_variable_get(:@doors)} | #{instance.instance_variable_get(:@cylinder)} | #{instance.instance_variable_get(:@color)}"
            end
        end
    end

end

class Car
    #attr_reader :doors
    def initialize(doors, cylinder, color)
        @doors = doors
        @cylinder = cylinder
        @color = color
    end
end

CarCreator.new.init

#access from main scope instance mycar through attr_reader
=begin
mycar = Car.new( 2,3,"bla")
puts mycar.doors


       
       # @@cars.each do |car|
        #    car.each do |key,value|
         #       print "#{ key.to_s } : #{ value.to_s} | "
          #  end
           # print "\n"
        #end
       #end
=end



