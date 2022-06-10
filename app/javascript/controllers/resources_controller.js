import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = [ "blur", "pop_up", "rich_content" ]

  connect() {
    // console.log(this.data.get("idValue"))
    // console.log(this.data.get("viewedValue"))
    // console.log(this.data.get("checkValue"))
    const viewed = (this.data.get("viewedValue") == 'true') ? true : false;
    const check = (this.data.get("checkValue") == 'true') ? true : false;
    console.log(viewed)
    console.log(check)
    // console.log(typeof viewed)
    if(viewed || check){
      this.blurTarget.classList.remove("background_blur");
      this.pop_upTarget.classList.add("d-none");
      this.testTarget.classList.remove("hidden_text_container");
    }
    // console.log(this.blurTarget.dataset.info)
  }

  viewResource() {
    fetch(`/resources/${this.data.get("idValue")}/purchase_resource`, {
      method: 'PATCH',
      headers: {
        "Accept": "application/json", "X-CSRF-Token": csrfToken()
        }
    })
    .then(response => response.json())
    .then(data => {
      if(data){
        this.blurTarget.classList.remove("background_blur");
        this.pop_upTarget.classList.add("d-none");
        this.rich_contentTarget.classList.remove("hidden_text_container");
      }
    })

  }
}
