import Rails from '@rails/ujs';
Rails.start();


import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"


const application = Application.start()

application.debug = false
window.Stimulus   = application

export { application }
