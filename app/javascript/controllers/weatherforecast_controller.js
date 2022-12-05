import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weatherforecast"
export default class extends Controller {

  initialize() {
    this.apiKey = "ad3a393a813635e6129c115cc1563088"
  }

  static targets = ["latitude", "longitude", "icon1", "icon2", "icon3", "icon4", "icon5", "td1", "td2", "td3", "td4", "td5", "d1", "d2", "d3", "d4", "d5" ]

  connect() {
    this.fetchFiveDaysForecast()
  }

  fetchFiveDaysForecast () {
    const url =`https://api.openweathermap.org/data/2.5/forecast?lat=${this.latitudeTarget.textContent}&lon=${this.longitudeTarget.textContent}&appid=${this.apiKey}&units=metric`
    fetch(url)
      .then(response => response.json())
      .then(data => this.displayFiveDaysWeather(data))
}

  displayFiveDaysWeather(data) {
    // Temperatures
    this.td1Target.innerText = `${data.list[0].main.temp} °C`
    this.td2Target.innerText = `${data.list[8].main.temp} °C`
    this.td3Target.innerText = `${data.list[16].main.temp} °C`
    this.td4Target.innerText = `${data.list[24].main.temp} °C`
    this.td5Target.innerText = `${data.list[32].main.temp} °C`

    // Days
    const weekday = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
    this.d1Target.innerText = weekday[new Date(`${data.list[0].dt_txt}`).getDay()]
    this.d2Target.innerText = weekday[new Date(`${data.list[8].dt_txt}`).getDay()]
    this.d3Target.innerText = weekday[new Date(`${data.list[16].dt_txt}`).getDay()]
    this.d4Target.innerText = weekday[new Date(`${data.list[24].dt_txt}`).getDay()]
    this.d5Target.innerText = weekday[new Date(`${data.list[32].dt_txt}`).getDay()]

    // Icons
    this.icon1Target.src = `https://openweathermap.org/img/w/${data.list[0].weather[0].icon}.png`
    this.icon2Target.src = `https://openweathermap.org/img/w/${data.list[8].weather[0].icon}.png`
    this.icon3Target.src = `https://openweathermap.org/img/w/${data.list[16].weather[0].icon}.png`
    this.icon4Target.src = `https://openweathermap.org/img/w/${data.list[24].weather[0].icon}.png`
    this.icon5Target.src = `https://openweathermap.org/img/w/${data.list[32].weather[0].icon}.png`
  }
}
