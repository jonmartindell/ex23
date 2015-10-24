class CarRepair
  class << self
    def run
      car_silent?.resolve
    end

    private
    def clean_terminals
      Tell.new("Clean terminals and try starting again.")
    end

    def replace_cables
      Tell.new("Replace cables and try again.")
    end

    def replace_battery
      Tell.new("Replace the battery.")
    end

    def check_spark_plugs
      Tell.new("Check spark plug connections.")
    end

    def check_choke
      Tell.new("Check to ensure the choke is opening and closing.")
    end

    def get_service
      Tell.new("Get it in for service.")
    end

    def car_silent?
      Ask.new "Is the car silent when you turn the key?",
        { y: battery_corroded?, n: clicking_noise? }
    end

    def battery_corroded?
      Ask.new "Are the battery terminals corroded?",
        { y: clean_terminals, n: replace_cables }
    end

    def clicking_noise?
      Ask.new "Does the car make a clicking noise?",
        { y: replace_battery, n: car_crank? }
    end

    def car_crank?
      Ask.new "Does the car crank up but fail to start?",
        { y: check_spark_plugs, n: start_then_die? }
    end

    def start_then_die?
      Ask.new "Does the engine start and then die?",
        { y: fuel_injection? }
    end

    def fuel_injection?
      Ask.new "Does your car have fuel injection?",
        { n: check_choke, y: get_service }
    end

  end
end
