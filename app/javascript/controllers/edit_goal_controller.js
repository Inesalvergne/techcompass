import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "info", "edit", "kpi" ]

  connect() {
  //  console.log(this.formTarget);
  //  console.log(this.infoTarget);
  }

  displayForm() {
    this.formTarget.classList.remove("d-none");
    this.editTarget.classList.add("d-none");
  }

  update(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.infoTarget.outerHTML = data;
        this.formTarget.classList.add("d-none");
        this.editTarget.classList.remove("d-none");
      })

    fetch('dashboard', {
      method: "GET",
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        // this.kpiTarget.outerHTML = data;
      })

  }
}
