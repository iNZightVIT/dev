<?php 

// database info
include "con.php";

$con = new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
  die();//"Connection failed: " . $con->connect_error);
}

$sql = "SELECT id, ip FROM users WHERE location IS NULL";
$result = $con->query($sql);

while($row = $result->fetch_assoc()) {
  
  $ipaddr = $row["ip"];
  $hash   = $row["id"];
  // get information about them:
  $ipinfo  = json_decode(file_get_contents("http://ipinfo.io/{$ipaddr}/json"));
  $city    = $ipinfo->city;
  $region  = $ipinfo->region;
  $country = $ipinfo->country;
  $loc     = $ipinfo->loc;
  
  $sql = "UPDATE users " .
         "SET city='$city', region='$region', country='$country', location='$loc', " .
         "    lastvisit=lastvisit " .
         "WHERE id='$hash'";
  $con->query($sql);
}

$con->close();
?>
