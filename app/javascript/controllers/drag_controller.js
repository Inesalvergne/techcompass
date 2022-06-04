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

  static targets = ["form", "status"]

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: "status",
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    // let id = event.item.dataset.id
    let new_status = event.item.parentElement.id
    console.log(new_status)

    let input_status = this.statusTarget
    input_status.value = new_status
    console.log(input_status)

    this.formTarget.submit()
  }
}

// Add the form to index page to change cards
// Add remote: :true pour pas refresh
// input.value = where we dropped the card
// submit the form
// hide form with f.hidden_field
