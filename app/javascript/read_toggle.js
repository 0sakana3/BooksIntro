document.addEventListener("turbo:load", function () {
    document.querySelectorAll(".toggle-button").forEach(toggleButton => {
      const bookId = toggleButton.dataset.bookId;
      const toggleElement = document.querySelector(`#toggle-element-${bookId}`);
  
      if (!toggleElement) return;
  
      function updateVisibility(isRead) {
        toggleElement.style.display = isRead ? "block" : "none";
      }
  
      toggleButton.addEventListener("click", (event) => {
        event.preventDefault();
  
        const isRead = toggleButton.dataset.toggleState === "read";
        const url = toggleButton.dataset.url;
        const method = isRead ? "DELETE" : "POST";
  
        fetch(url, {
          method: method,
          headers: {
            "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
            "Content-Type": "application/json",
          },
        }).then(response => response.text())
          .then(html => {
            const newButton = document.createElement("div");
            newButton.innerHTML = html;
            const newToggleButton = newButton.firstElementChild;
  
            if (!newToggleButton) return;
  
            // 新しいボタンの data-url を取得
            const newDataUrl = newToggleButton.dataset.url;
            if (newDataUrl) {
              toggleButton.dataset.url = newDataUrl;
            }
  
            // ボタンを更新
            toggleButton.replaceWith(newToggleButton);
            document.dispatchEvent(new Event("turbo:load"));
          })
          .catch(error => {
            console.error("Error:", error);
          });
      });
    });
  });