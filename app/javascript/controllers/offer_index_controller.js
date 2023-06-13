import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="offer-index"
export default class extends Controller {
  connect() {
    console.log("Connecting.")
  }

  hoverButton(event) {
    console.log(event)
    event.currentTarget.querySelector('a').classList.remove('d-none');
  }

  hideButton(event) {
    event.currentTarget.querySelector('a').classList.add('d-none');
  }
}
