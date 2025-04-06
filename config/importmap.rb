# Pin npm packages by running ./bin/importmap
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.1.4/lib/assets/compiled/rails-ujs.js"
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "comment", to: "comment.js" 
pin "read_toggle", to: "read_toggle.js"