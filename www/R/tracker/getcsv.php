<?php 
// database info

header("Content-type: text/csv");
header("Content-Disposition: attachment; filename=userlocation.csv");

include "con.php";

$con = new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
  die("Connection failed: " . $con->connect_error);
}

if ($_GET['r'] != "imfromiNZight") {
  die("There's nothing to show.");
}

//$sql = "SELECT location, country, os, DATE(lastvisit) AS date FROM users WHERE lastvisit >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)";
$sql = "SELECT location, country, os, DATE(lastvisit) AS date FROM users WHERE lastvisit >= '2015-10-19'";
$result = $con->query($sql);

echo "Location,country,OS,date\n";
while($row = $result->fetch_assoc()) {
  echo "\"" . $row["location"] . "\"" . "," . "\"" . $row["country"] . "\"" . "," . $row["os"] . "," . $row["date"] . "\n";
}

$con->close();


?>
