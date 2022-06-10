import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "select"]

  connect() {
    // console.log(this.formTarget)
    // console.log(this.inputTarget)
    // console.log(this.listTarget)
    console.log(this.selectTarget.value)
  }

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&tags=${this.selectTarget.value}`
    console.log(url)
    fetch(url, { headers: { "Accept": "text/plain" } })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.outerHTML = data
      console.log("hello")
      console.log(this.selectTarget.value)
    })
  }
}
