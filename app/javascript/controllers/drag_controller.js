// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import { end } from "@popperjs/core"

export default class extends Controller {

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: "status",
      onEnd: this.updateJob.bind(this)
    })
  }

  updateJob(event) {
    const id = event.item.dataset.id
    console.log(id)
    const new_status = event.item.parentElement.id
    console.log(new_status)

    fetch(`/jobs/${id}/set_status`, {
      method: 'PATCH',
      headers: { "Content-Type": "application/json"},
      body: JSON.stringify({ status: new_status })
    })

    const card = event.item.children[0].children[0]
    const colors = ["wishlist", "applied", "interview", "decision", "offer", "rejected"]
    colors.forEach(color => card.classList.replace(`border-${color}`,`border-${new_status}`))
    // card.classList.replace('border-wishlist',`border-${new_status}` )
  }
}



// OPTION 2
// grab card ID and where the card was droped
// fetch dans le stimulus controller
// case statement dans le rails controller
// methode dans le job controller pour edit status (patch) --> case statement
// create a route /jobs/edit/edit-status
