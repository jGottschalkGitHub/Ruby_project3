
class  CarCreator
    
    @@white_changed = false
    @@car_instances = []

    def init
        read_cars
    end
    
    def read_cars
        
        File.open('cars.txt', 'r') do |f|
            while line = f.gets
                line = line.chomp
                doors, cylinder, color = line.split('|')
                createCar(doors, cylinder, color)
            end           
        end
        print_cars 
    end
    
    def create_car(doors, cylinder, color)
       
        case color
        when "prime"
            color = "red"
        when "yellow"
            color = "grey"
        when "white"  
            @@white_changed == false ? color = "green" : color = "black"
            @@white_changed = true
        end

        @@car_instances << Car.new(doors, cylinder, color)
        
    end

    def print_cars
        @@car_instances.each do |instance|
    
            puts "#{instance.doors} | #{instance.cylinder} | #{instance.color}"
            #puts "#{instance.instance_variable_get(:@doors)} | #{instance.instance_variable_get(:@cylinder)} | #{instance.instance_variable_get(:@color)}
        end
    end

end

class Car

    attr_reader :doors
    attr_reader :cylinder
    attr_reader :color

    def initialize(doors, cylinder, color)
        @doors = doors
        @cylinder = cylinder
        @color = color
    end

end

CarCreator.new.init



