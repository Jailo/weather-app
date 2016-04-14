require 'barometer'
    puts "Where are you? (Zip code/City/State/Country)"
    location = gets  

    def get_locations_weather(location)
      Barometer.new(location).measure
      end
  
    def determine_weather(location)
      barometer = Barometer.new(location)
      weather = barometer.measure
      puts "Today is #{weather.current.condition.downcase} with a temperature of #{weather.current.temperature.f}°F"
 
        if weather.current.condition.downcase == "clear"
          puts "Bust out the sunscreen! Its a sunny day today!"
      
        elsif weather.current.condition.downcase == "mostly cloudy"
          puts "Its mostly cloudy out today"
        
        elsif weather.current.condition.downcase == "partly cloudy"
          puts "Its a bit cloudy out today"
         
        elsif  weather.current.condition.downcase =="rain"
          puts"Grab your umbrella, its raining today!"
      
        elsif  weather.current.condition.downcase =="rain mist"
        puts"its misty out today"
      
        elsif  weather.current.condition.downcase =="light rain"
          puts"a little rain"
      
        elsif  weather.current.condition.downcase =="snow"
          puts"Time to get out your gloves and shovel, its snowing!"
      
        elsif  weather.current.condition.downcase =="overcast"
          puts"its a bit gloomy out. Try to find a way to brighten someones elses day!"
      
        elsif  weather.current.condition.downcase =="thunderstorm"
          puts"Its a thunderstorm! keep some candles &/or flashlights nearby just in case!"
      
        elsif  weather.current.condition.downcase =="blowing sand"
          puts"Its a sandstorm!"
        else
        	puts"You know what im not sure..."
        end
       end
  
  determine_weather(location)
  
    weather = get_locations_weather(location)
    tomorrow = Time.now.strftime('%d').to_i + 1
 
    weather.forecast.each do |forecast|
    day = forecast.starts_at.day
  
      if day == tomorrow
      dayName = 'Tomorrow'
      else
      dayName = forecast.starts_at.strftime('%A')
      end
 
  puts dayName + ' is going to be ' + forecast.icon + ' with a low of ' + forecast.low.f.to_s + '°F and a high of ' + forecast.high.f.to_s + '°F'
      end
 
