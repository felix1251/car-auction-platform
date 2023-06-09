import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["input", "image", "partial"];

    connect() {
        console.log("connected", this.element);
    }

    display() {
        let input = this.inputTarget;
        let image = this.imageTarget;
        let partial = this.partialTarget;
        let file = input.files[0];
        let reader = new FileReader();

        reader.onloadend = function () {
            image.src = reader.result;
        };

        if (file) {
            reader.readAsDataURL(file);
            partial?.classList.add("hidden");
            image.classList.remove("hidden");
        } else {
            image.src = "";
        }
    }
}
