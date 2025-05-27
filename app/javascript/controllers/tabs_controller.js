import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab"];

  switch(event) {
    this.tabTargets.forEach(tab => {
      tab.classList.remove("border-purple-700", "text-purple-700");
      tab.classList.add("border-transparent", "text-gray-600");
    });
    event.currentTarget.classList.add("border-purple-700", "text-purple-700");
    event.currentTarget.classList.remove("border-transparent", "text-gray-600");
  }
}
