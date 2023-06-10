import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["action", "icon"];

    connect() {}

    disableBtn() {
        this.iconTarget.classList.add("fa-shake");
        const target = this.actionTarget;
        target.classList.add("pointer-events-none");
        target.classList.remove(
            "bg-[conic-gradient(from_1turn,#87C1FF,#007BC5)]"
        );
        target.classList.add("bg-gray-400");
        const text = document.getElementById("text");
        if (text) text.innerHTML = "BIDDING";
    }
}
