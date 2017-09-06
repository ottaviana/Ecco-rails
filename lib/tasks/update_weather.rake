task :update_weather => :environment do
  def fetch_weather(city)
    api_key = ENV["OPENWEATHERMAP_API_KEY"]
    response = Curl.get(
      "http://api.openweathermap.org/data/2.5/weather",
      { q: city, appid: api_key }
    )
    response_body = response.body_str
    return JSON.parse(response_body)
  end

  def extract_temp_in_kelvin(response)
    return response['main']['temp']
  end

  def extract_weather(response)
    return response['weather'][0]['main']
  end

  def kelvin_to_celsius(kelvin)
    degree = (kelvin - 273.15).round
    return degree
  end

  capitals = [
    "London",
    "Milan",
    "Paris",
    "Tokyo",
    "Madrid",
    "Zurich",
    "Frankfurt",
    "Amsterdam",
    "Moscow",
    "Stockholm",
    "Oslo",
    "Istanbul",
    "Dublin",
    "Vien",
    "Athen",
    "Lisboa",
    "Rabat",
    "Copenhagen",
    "Warsaw",
    "Bucharest",
    "New York",
    "Münster"
  ]

  capitals.each { |city|
    response = fetch_weather(city)
    kelvin = extract_temp_in_kelvin(response)
    celsius = kelvin_to_celsius(kelvin)
    weather = extract_weather(response)

    puts "In #{city} it is #{weather} and #{celsius} degrees celsius"

    record = Weather.find_by(city: city)
    if record
      record.weather = weather
      record.temperature = celsius
    else
      record = Weather.new(
        city: city,
        weather: weather,
        temperature: celsius
      )
    end
    record.save
  }
end
