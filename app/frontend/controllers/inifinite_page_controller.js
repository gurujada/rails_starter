import { Controller } from "stimulus";
import Waypoint from "waypoints/lib/noframework.waypoints";
import "waypoints/lib/shortcuts/infinite";

export default class extends Controller {
  static targets = ["container"];
  /* eslint-disable no-new */

  connect() {
    new Waypoint.Infinite({
      element: this.containerTarget,
      items: "[data-target='infinite-page.item']",
      more: "a[data-target='infinite-page.more']",
      loadingClass: "loading"
    });
  }
}
