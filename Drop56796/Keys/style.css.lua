--[[
    style.css.lua  —  organised by minimarchbleeding
    Original : Drop56796/Keys  ->  style.css
    Not obfuscated; reproduced as-is.
--]]

body {
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    background: linear-gradient(135deg, #4a90e2, #50e3c2);
    color: #333;
}
.container {
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 30px;
    text-align: center;
}
.key-display {
    border: 1px solid #ccc;
    border-radius: 4px;
    padding: 10px;
    margin-top: 20px;
    font-size: 18px;
    background-color: #f9f9f9;
}
.copy-button, .generate-button {
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #4a90e2;
    color: #ffffff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}
.copy-button:active, .generate-button:active {
    background-color: #357abd;
}
.message {
    margin-top: 20px;
    color: #e74c3c;
    font-size: 14px;
}
