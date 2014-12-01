<?php 

// are we tracking this request?
$track = isset($_GET["track"]);

// database info
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "inzightvit";

$con = new mysqli($servername, $username, $password, $dbname);
if ($con->connect_error) {
  die();//"Connection failed: " . $con->connect_error);
}

if ($track) {
  // Grab their IP address
  $ipaddr = (string)$_SERVER["REMOTE_ADDR"];

  // version
  $version = $_GET["v"];
  $os      = $_GET["os"];
  
  // get date
  $now = new DateTime();
  $date = $now->format('Y-m-d H:i:s');

  // try to select the IP address from the database:
  $sql = "SELECT ip, version, visits FROM users WHERE ip='$ipaddr' AND os='$os'";
  $result = $con->query($sql);

  if ($result->num_rows == 0) {
    $sql = "INSERT INTO users (ip, start, version, os) VALUES ('$ipaddr', '$date', '$version', '$os')";
    if ($con->query($sql) === TRUE) {
      die();
    }
  } else if ($result->num_rows == 1) {
    $row = $result->fetch_assoc();
    $visits = $row["visits"] + 1;
    $sql = "UPDATE users SET version='$version', visits='$visits' WHERE ip='$ipaddr' AND os='$os'";
    if ($con->query($sql) == TRUE) {
      die();
    }
  }

  die();
  
} else { 

  // the number of rows in the database
  $sql = "SELECT ip, version, os, start, lastvisit, visits FROM users ORDER BY lastvisit DESC";
  $result = $con->query($sql);
  $nrow = $result->num_rows;

  // the number of unique IP addresses:
  $sql = "SELECT COUNT(DISTINCT ip) as count FROM users";
  $result2 = $con->query($sql);
  $countrow = $result2->fetch_assoc();

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
    
    <p>Number of unique users: <?php echo $nrow; ?></p>
    <p>Number of unique IP addresses: <?php echo $countrow["count"]; ?></p>
    
    
    <?php 
    if ($nrow > 0) {
      echo "<table>";
      
      echo "<tr class='head'><th>IP Address</th><th>Version</th><th>Operating System</th>" .
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

