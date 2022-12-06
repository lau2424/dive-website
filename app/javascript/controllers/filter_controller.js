import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {

  static targets = ["snorkeling", "scubadiving", "snorkeling_scubadiving"]

  connect() {
  }

  filter(e) {
    const url = `spots?filter=${e.currentTarget.dataset.filterTarget}`
    const queryString = window.location.search
    const urlParams = new URLSearchParams(queryString);
    window.location.href = url;


    if(urlParams.has("Scubadiving")) {
      currentTarget.classList.toggle("highlighted")
    } else if(urlParams.has("Scuba Diving")) {
      currentTarget.classList.toggle("highlighted")
    } else if(urlParams.has("Scuba Diving & Snorkeling")) {
      currentTarget.classList.toggle("highlighted")
    }


    //window.history.replaceState(null, null, `spots?filter=${e.currentTarget.dataset.filterTarget}`);
    // fetch(url)
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })
  }
}

const cells = document.querySelectorAll(".clickable");
cells.forEach((element) => {
  element.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
  });
});
