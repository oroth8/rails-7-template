import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-toggle"
export default class extends Controller {
    static targets = [ "button", "span"]
    switch () {
        const buttonClass = this.buttonTarget.classList
        const spanClass = this.spanTarget.classList

        // if disabled
        if(buttonClass.contains("bg-gray-200")){
            buttonClass.remove("bg-gray-200")
            spanClass.remove("translate-x-0")
            
            buttonClass.add("bg-indigo-600")
            spanClass.add("translate-x-5")
        }else{
            buttonClass.remove("bg-indigo-600")
            spanClass.remove("translate-x-5")

            buttonClass.add("bg-gray-200")
            spanClass.add("translate-x-0")
        }
    }

}