// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"

import * as bootstrap from "bootstrap"
document.getElementById("new_message").addEventListener("keypress", function(e) {
    if (e && e.key === "Enter") {
        e.stopPropagation();
        e.preventDefault();
        this.submit();
        console.log(e.key);
    }
});