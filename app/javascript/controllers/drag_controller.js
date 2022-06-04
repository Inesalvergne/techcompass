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

  // static targets = ["wishlist", "applied", "interview", "decision", "offer", "rejected"]

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: "status",
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    let status = event.item.dataset.id
    console.log(status)
  }
}
