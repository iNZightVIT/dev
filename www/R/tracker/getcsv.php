<?php 
// database info

header("Content-type: text/csv");
header("Content-Disposition: attachment; filename=userlocation.csv");

include "con.php";

$con = new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
  die();//"Connection failed: " . $con->connect_error);
}

if ($_GET['r'] != "imfromiNZight") {
  die("There's nothing to show.");
}

$sql = "SELECT location, country, os FROM users";
$result = $con->query($sql);

echo "Location,country,OS\n";
while($row = $result->fetch_assoc()) {
  echo "\"" . $row["location"] . "\"" . "," . "\"" . $row["country"] . "\"" . "," . $row["os"] . "\n";
}

$con->close();


?>
