<?php 

// database info
include "con.php";

$con = new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
  die();//"Connection failed: " . $con->connect_error);
}

$sql = "SELECT id, country FROM users WHERE country != ''";
$result = $con->query($sql);

while($row = $result->fetch_assoc()) {
  
  $hash   = $row["id"];
  // get information about them:
  $country = $row["country"];
  
  include "codes.php";
  if (array_key_exists($country, $countries)) {
    $country = ucwords(strtolower($countries[$country]));
  }
  
  
  $sql = "UPDATE users " .
         "SET country='$country', lastvisit=lastvisit " .
         "WHERE id='$hash'";
  $con->query($sql);
}

$con->close();
?>
