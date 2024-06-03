#!/bin/bash

# Your OpenWeatherMap API key
API_KEY="65a78f9e380976f5b143a33d1323e8b1"

# Location for which you want to get the weather (e.g., city name, city id, geographical coordinates)
LOCATION="Argyle"

# Units: metric for Celsius, imperial for Fahrenheit
UNITS="imperial"

# API endpoint
URL="http://api.openweathermap.org/data/2.5/weather?q=${LOCATION}&units=${UNITS}&appid=${API_KEY}"

# Make the API request and store the response
response=$(curl -s "${URL}")

# Check if the response is valid
if [ "$(echo "$response" | jq -r '.cod')" != "200" ]; then
  echo "Error fetching weather data: $(echo "$response" | jq -r '.message')"
  exit 1
fi

# Extract and display the desired information
city=$(echo "$response" | jq -r '.name')
country=$(echo "$response" | jq -r '.sys.country')
temp=$(echo "$response" | jq -r '.main.temp')
weather=$(echo "$response" | jq -r '.weather[0].description')

file="/home/thegassyninja/.local/bin/Crons/weather.txt"

echo "Weather in ${city}, ${country}:" > $file
echo "Temperature: ${temp}°F" >> $file
echo "Conditions: ${weather}" >> $file
echo "Last updated: $(date)" >> $file