function post() {
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

    XHR.onload = function() {
      if (XHR.status === 201) {
        const newComment = XHR.response.post;
        const userNickname = XHR.response.user;

        if (newComment && userNickname) {
          const commentsContainer = document.querySelector('.comments')


          const commentElement = document.createElement('p');
          commentElement.classList.add('comment');
          commentElement.innerHTML = `
            <div class="comment-user">
            <strong>${userNickname}：</strong>
            </div>
            <div class="comment-text">
            ${newComment.text}
            </div>
          `;
          commentsContainer.appendChild(commentElement);

          const explanationMessage = document.querySelector('.explanation');
          if (explanationMessage) {
            explanationMessage.remove();
          }

          form.reset();
        }
      } else {
        alert("コメントの投稿に失敗しました: " + XHR.response.errors.join(", "));
      }
    };
  });
}

window.addEventListener('turbo:load', post);