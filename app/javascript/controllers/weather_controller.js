import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  initialize() {
    this.apiKey = "ad3a393a813635e6129c115cc1563088"
  }

  static targets = ["latitude", "longitude", "icon", "temperature", "description"]

  connect() {
    this.fetchWeatherByCoordinates()
  }

  fetchWeatherByCoordinates() {
      const url =`https://api.openweathermap.org/data/2.5/weather?lat=${this.latitudeTarget.textContent}&lon=${this.longitudeTarget.textContent}&appid=${this.apiKey}&units=metric`
      fetch(url)
        .then(response => response.json())
        .then(data => this.displayWeather(data))
  }

  displayWeather(data) {
    console.log(data)
    this.iconTarget.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`
    this.temperatureTarget.innerText = `${Math.round(parseInt(data.main.temp))} °C`
    this.descriptionTarget.innerText = data.weather[0].description

  }

}
