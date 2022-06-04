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

export default class extends Controller {

  // static targets = ["wishlist", "applied", "interview", "decision", "offer", "rejected"]

  connect() {
    console.log('Hello, Stimulus!')
    this.sortable = Sortable.create(this.element, {
      group: "status",
    })

    //  Sortable.create(this.wishlist, {
    //   group: 'shared', // set both lists to same group
    //   animation: 150
    //  });

    // Sortable.create(this.applied, {
    //     group: 'shared',
    //     animation: 150
    // });
  }
}
