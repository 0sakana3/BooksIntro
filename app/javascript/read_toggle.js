document.addEventListener("turbo:load", function () {
    document.querySelectorAll(".toggle-button").forEach(toggleButton => {
        const bookId = toggleButton.dataset.bookId;
        const toggleElement = document.querySelector(`#toggle-element-${bookId}`);

        if (!toggleElement) return;

        toggleButton.addEventListener("click", (event) => {
            event.preventDefault();

            // ボタンを即座に無効化
            toggleButton.disabled = true;

            const isRead = toggleButton.dataset.toggleState === "read";
            const url = toggleButton.dataset.url;
            const method = isRead ? "DELETE" : "POST";

            // ボタンの状態を即時に反映させる
            fetch(url, {
                method: method,
                headers: {
                    "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
                    "Content-Type": "application/json",
                },
            })
            .then(response => response.text())
            .then(html => {
                const newButton = document.createElement("div");
                newButton.innerHTML = html;
                const newToggleButton = newButton.firstElementChild;

                if (!newToggleButton) return;

                // 新しいボタンに置き換え、data-url と data-toggle-state を更新
                toggleButton.replaceWith(newToggleButton);
                newToggleButton.dataset.url = url; // 新しいURLを設定
                newToggleButton.dataset.toggleState = isRead ? "unread" : "read"; // 状態を更新

                document.dispatchEvent(new Event("turbo:load"));
            })
            .catch(error => {
                console.error("Error:", error);
                // エラー時にボタンを再度有効化
                toggleButton.disabled = false;
            });
        });
    });
});