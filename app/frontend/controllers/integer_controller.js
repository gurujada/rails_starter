import { Controller } from "stimulus";
import Cleave from "cleave.js";

/* eslint-disable no-new */

export default class extends Controller {
  connect() {
    new Cleave(this.element, {
      numeral: true,
      numeralDecimalMark: "",
      delimiter: ""
    });
  }
}
