import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["action", "icon"];

    connect() {}

    disableBtn() {
        this.iconTarget.classList.add("fa-shake");
        this.actionTarget.classList.add("pointer-events-none");
    }
}
