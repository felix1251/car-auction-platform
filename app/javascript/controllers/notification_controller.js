import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.removeNotification();
    }

    removeNotification(el) {
        setTimeout(() => this.removeElement(), 4000);
    }

    removeElement() {
        this.element.innerHTML = "";
        this.element.removeAttribute("class");
    }
}
