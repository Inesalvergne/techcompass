import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "edit", "kpi", "description", "jobcount" ]

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
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        // console.log(data)
        this.formTarget.classList.add("d-none");
        this.editTarget.classList.remove("d-none");
        this.descriptionTarget.innerHTML = data.goal_description;
        this.jobcountTarget.innerHTML = data.goal_target;
        this.kpiTarget.innerHTML = data.kpi;
        console.log(this.kpiTarget);
        console.log(data.kpi)
      })
  }
}
