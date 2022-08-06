import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-toggle"
export default class extends Controller {
    static targets = [ "button", "span", "checkbox", "dateTypeSelect"]

    connect(){
        const checkbox = this.checkboxTarget
        const dateTypeSelect = this.dateTypeSelectTarget.classList
        const spanClass = this.spanTarget.classList
        const buttonClass = this.buttonTarget.classList
        if(checkbox.value === "1"){
            buttonClass.remove("bg-gray-200")
            spanClass.remove("translate-x-0")

            
            buttonClass.add("bg-indigo-600")
            spanClass.add("translate-x-5")

            dateTypeSelect.remove("hidden")
        }
    }


    switch () {
        const buttonClass = this.buttonTarget.classList
        const spanClass = this.spanTarget.classList
        const checkbox = this.checkboxTarget
        const dateTypeSelect = this.dateTypeSelectTarget.classList

        // if disabled
        if(buttonClass.contains("bg-gray-200")){
            buttonClass.remove("bg-gray-200")
            spanClass.remove("translate-x-0")

            
            buttonClass.add("bg-indigo-600")
            spanClass.add("translate-x-5")

            checkbox.value = "1"

            dateTypeSelect.remove("hidden")
        }else{
            buttonClass.remove("bg-indigo-600")
            spanClass.remove("translate-x-5")

            buttonClass.add("bg-gray-200")
            spanClass.add("translate-x-0")

            checkbox.value = "0"

            dateTypeSelect.add("hidden")
        }
    }

}