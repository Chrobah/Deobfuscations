--[[
    apk.html.lua  —  organised by minimarchbleeding
    Original : Drop56796/Mayhem-mode-enity  ->  apk.html
    Not obfuscated; reproduced as-is.
--]]

<!DOCTYPE html>
<html>
<head>
<style>
  .button-container {
    display: flex;
    justify-content: space-around;
  }
  .link-button {
    padding: 10px 20px;
    margin: 5px;
    background-color: #4CAF50;
    color: white;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  .link-button:hover {
    background-color: #45a049;
  }
</style>
</head>
<body>

<div class="button-container">
  <a href="https://www.link1.com" class="link-button">Button 1</a>
  <a href="https://www.link2.com" class="link-button">Button 2</a>
  <a href="https://www.link3.com" class="link-button">Button 3</a>
  <!-- Add more buttons as needed -->
</div>

<!-- Assuming you have a table with id 'myTable' -->
<table id="myTable">
  <tr>
    <td>Row 1, Cell 1</td>
    <td>Row 1, Cell 2</td>
  </tr>
  <tr>
    <td>Row 2, Cell 1</td>
    <td>Row 2, Cell 2</td>
  </tr>
</table>

<button onclick="addColumn()">Add Column</button>

<script>
function addColumn() {
  var table = document.getElementById('myTable');
  for (var i = 0, row; row = table.rows[i]; i++) {
    var cell = row.insertCell(-1); // Inserts a cell at the end of the row
    cell.innerHTML = 'New Cell'; // Modify as needed
  }
}
</script>

</body>
</html>
