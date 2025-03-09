import * as Rails from "@rails/ujs"
document.addEventListener("DOMContentLoaded", () => {
  window.Rails = Rails;
  Rails.start();
});