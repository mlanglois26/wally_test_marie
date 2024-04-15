// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

import DynamicBookingPriceController from "./dynamic_booking_price_controller"
application.register("dynamic-booking-price", DynamicBookingPriceController)

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)
