function post (){
  const form = document.getElementById("form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();

    const bookId = form.dataset.bookId;
    const url = `/books/${bookId}/comments`;

    XHR.open("POST", url, true);
    XHR.responseType = "json";
    XHR.send(formData);
  });
 };

 window.addEventListener('turbo:load', post);