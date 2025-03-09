import * as Rails from "@rails/ujs"
document.addEventListener("DOMContentLoaded", () => {
  if (window.Rails === undefined) {
    window.Rails = Rails;
    Rails.start();
  }
});