import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"
export default class extends Controller {
  connect() {
    const upvoteButtons = document.querySelector(".all-resources").querySelectorAll(".upvote-button")
    upvoteButtons.forEach(button => {
      button.addEventListener("click",(event) => {
        event.preventDefault()
        console.log("im here")
        button.style.backgroundColor = "#6F3BE3"
        button.style.color = "white"
        button.disable = true
        //button.classList.add(".myclass")
        fetch(`/resources/${button.dataset.resourceid}/upvote`, {
          method: 'PATCH',
          headers: {
            "Accept": "application/json",
            "X-CSRF-Token": csrfToken()
          }
        })
        .then(response => response.json())
        .then(data => {
          console.log(data)
          button.querySelector(".button-votes").innerText= data
        })
      })
    })
  }
}
