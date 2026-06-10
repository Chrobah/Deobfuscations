--[[
    Node.js.lua  —  organised by minimarchbleeding
    Original : Drop56796/Keys  ->  Node.js
    Not obfuscated; reproduced as-is.
--]]

document.getElementById('generateKey').addEventListener('click', function() {
    var key = generateRandomKey();
    document.getElementById('keyDisplay').textContent = key;
    document.getElementById('message').textContent = '';
});

document.getElementById('copyKey').addEventListener('click', function() {
    var key = document.getElementById('keyDisplay').textContent;
    if (key !== 'Your key will appear here') {
        copyToClipboard(key);
        document.getElementById('message').textContent = 'Key copied to clipboard!';
    } else {
        document.getElementById('message').textContent = 'Please generate a key first.';
    }
});

function generateRandomKey() {
    return Math.random().toString(36).substring(2, 12) + Math.random().toString(36).substring(2, 12);
}

function copyToClipboard(text) {
    var tempInput = document.createElement('input');
    tempInput.value = text;
    document.body.appendChild(tempInput);
    tempInput.select();
    document.execCommand('copy');
    document.body.removeChild(tempInput);
}
