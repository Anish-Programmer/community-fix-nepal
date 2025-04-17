function validateLoginForm() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    let error = "";
    if (!username || username.length > 20) {
        error += "Username must be 1-20 characters.\n";
    }
    if (!password || password.length < 6) {
        error += "Password must be at least 6 characters.\n";
    }
    if (error) {
        alert(error);
        return false;
    }
    return true;
}

function validateRegisterForm() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirm-password").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    let error = "";

    // Username: alphanumeric, 3-20 chars
    if (!username || username.length < 3 || username.length > 20 || !/^[a-zA-Z0-9]+$/.test(username)) {
        error += "Username must be 3-20 alphanumeric characters.\n";
    }

    // Password: 6+ chars
    if (!password || password.length < 6) {
        error += "Password must be at least 6 characters.\n";
    }

    // Confirm Password: must match
    if (password !== confirmPassword) {
        error += "Passwords do not match.\n";
    }

    // Email: optional, but valid if provided
    if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        error += "Invalid email format.\n";
    }

    // Phone: optional, max 20 chars
    if (phone && phone.length > 20) {
        error += "Phone must be under 20 characters.\n";
    }

    if (error) {
        alert(error);
        return false;
    }
    return true;
}