import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  editButton() {
    // Wait for the next tick to get the button element
    requestAnimationFrame(() => {
      const editButton = this.element.querySelector('#editProfileButton');
      editButton.hidden = true
      // console.log(editButton);
    });

    const elements = this.element.querySelectorAll('[readonly], [hidden]');
    elements.forEach((element) => {
      element.removeAttribute('readonly');
      element.removeAttribute('hidden');
    });

  }
}
