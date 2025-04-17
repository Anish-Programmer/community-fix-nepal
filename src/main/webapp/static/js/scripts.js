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
    const email = document.getElementById("email").value;
    let error = "";
    if (!username || username.length > 20 || !/^[a-zA-Z0-9]+$/.test(username)) {
        error += "Username must be 1-20 alphanumeric characters.\n";
    }
    if (!password || password.length < 6) {
        error += "Password must be at least 6 characters.\n";
    }
    if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        error += "Invalid email format.\n";
    }
    if (error) {
        alert(error);
        return false;
    }
    return true;
}