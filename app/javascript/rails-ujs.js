import * as Rails from "@rails/ujs";

document.addEventListener("DOMContentLoaded", () => {
  if (typeof window.Rails === 'undefined') {
    window.Rails = Rails;
    Rails.start();
  }
});