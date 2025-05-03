 function updateCharCount(textarea) {
    const charCount = textarea.value.length;
    document.getElementById("charCount").textContent = charCount;
    if (charCount > 500) {
    textarea.value = textarea.value.substring(0, 500);
    document.getElementById("charCount").textContent = 500;
}
}
    document.addEventListener("DOMContentLoaded", function() {
    const imageInput = document.getElementById("image");
    const imagePreview = document.getElementById("image-preview");

    imageInput.addEventListener("change", function() {
    const file = this.files[0];
    if (file) {
    const reader = new FileReader();
    reader.onload = function(e) {
    imagePreview.innerHTML = `<img src="${e.target.result}" alt="Image Preview">`;
};
    reader.readAsDataURL(file);
} else {
    imagePreview.innerHTML = "";
}
});
});
