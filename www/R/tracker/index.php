<?php 

// are we tracking this request?
$track = isset($_GET["track"]);

// database info

include "con.php";

$con = new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
  die();//"Connection failed: " . $con->connect_error);
}

if ($track) {
  // Grab their IP address
  $ipaddr = (string)$_SERVER["REMOTE_ADDR"];
  $ipaddr = "188.105.247.193";

  // get information about them:
  $ipinfo  = json_decode(file_get_contents("http://ipinfo.io/{$ipaddr}/json"));
  $city    = $ipinfo->city;
  $region  = $ipinfo->region;
  $country = $ipinfo->country;

  include "codes.php";
  if (array_key_exists($country, $countries)) {
    $country = ucwords(strtolower($countries[$country]));
  }
  $loc     = $ipinfo->loc;  

  // version
  $version = $con->real_escape_string($_GET["v"]);
  $os      = $con->real_escape_string($_GET["os"]);
  $hash    = $con->real_escape_string($_GET["hash"]);

  if ($hash == "new") {
    // generate a new hash code
    $match = TRUE;
    while($match) {
      $hash = uniqid();
      $match = $con->query("SELECT ID FROM users WHERE ID='$hash'")->num_row > 0;
    }
    echo $hash . "\n";  // echo it out so R can save it
  }
  
  // get date
  $now = new DateTime();
  $date = $now->format('Y-m-d H:i:s');

  // try to select the IP address from the database:
  $sql = "SELECT ip, version, visits FROM users WHERE id='$hash'";
  $result = $con->query($sql);

  if ($result->num_rows == 0) {
    // INSERT A NEW USER:
    $sql = "INSERT INTO users (id, ip, start, version, os, city, region, country, location) " . 
           "VALUES ('$hash', '$ipaddr', '$date', '$version', '$os', '$city', '$region', '$country', '$loc')";
    if ($con->query($sql) === TRUE) {
      die();
    }
  } else if ($result->num_rows == 1) {
    // UPDATE AN EXISTING USER:
    $row = $result->fetch_assoc();
    $visits = $row["visits"] + 1;
    $sql = "UPDATE users " .
           "SET ip='$ipaddr', version='$version', visits='$visits', " . 
           "    city='$city', region='$region', country='$country', location='$loc' " .
           "WHERE id='$hash'";
    if ($con->query($sql) == TRUE) {
      die();
    }
  }

  die();
  
} else { 

  // the number of rows in the database
  $sql = "SELECT CONCAT(region, ' - ', country), version, os, start, lastvisit, visits " .
         "FROM users ORDER BY lastvisit DESC";
  $result = $con->query($sql);
  $nrow = $result->num_rows;

?>

<!DOCTYPE html>

<html>
  <head>
    <title>iNZightVIT User Tracking</title>
    <link rel="stylesheet" type="text/css" href="style.css">
  </head>
  
  <body>
    <h1>User Tracking Information for iNZightVIT Updater</h1>
    
    <p>This page displays information related to the number of unique users running the update
      script.</p>
    
    <p>
      Number of unique users: <?php echo $nrow; ?>
    </p>
    <p>
      <a href="userMap.jpg">Map of location data</a>
    </p>
    
    <?php 
    if ($nrow > 0) {
      echo "<table>";
      
      echo "<tr class='head'><th>Location</th><th>Version</th><th>Operating System</th>" .
	   "<th>Start Date</th>" .
	   "<th>Last Update</th><th>Number of visits</th></tr>";
      
      while($row = $result->fetch_assoc()) {
	echo "<tr>";
	foreach($row as $col) {
	  echo "<td>" . $col . "</td>";
	}
	echo "</tr>";
      }
      
      echo "</table>";
    }
    ?>

  </body>
</html>


<?php } 

$con->close();

?>

