import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["icon"]

  animate(event) {
    event.preventDefault();
    let emoji = event.currentTarget;
    emoji.classList.add("scale-125");
    setTimeout(() => emoji.classList.remove("scale-125"), 200);
  }
}
