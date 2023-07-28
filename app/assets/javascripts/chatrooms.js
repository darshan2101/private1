
document.getElementById("message_body").addEventListener("keypress", function(e) {
    if (e && e.key === "Enter") {
        this.submit();
        console.log(e.key);
    }
});