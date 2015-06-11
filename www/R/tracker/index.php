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
  $sql = "SELECT ip, version, updates, times_used FROM users WHERE id='$hash'";
  $result = $con->query($sql);

  if ($result->num_rows == 0) {
    // INSERT A NEW USER:
    $sql = "INSERT INTO users (id, ip, start, version, os, city, region, country, location, times_used) " . 
           "VALUES ('$hash', '$ipaddr', '$date', '$version', '$os', '$city', '$region', '$country', '$loc', 1)";
    if ($con->query($sql) === TRUE) {
      die();
    }
  } else if ($result->num_rows == 1) {
    // UPDATE AN EXISTING USER:
    $row = $result->fetch_assoc();
    // only update if version changes:
    $prev_version = $row["version"];
    $nupdates = $row["updates"] + ($prev_version != $version);

    $times = $row["times_used"] + 1;

    $sql = "UPDATE users " .
           "SET ip='$ipaddr', version='$version', updates='$nupdates', " . 
           "    city='$city', region='$region', country='$country', location='$loc', " .
	   "    times_used='$times' " .
           "WHERE id='$hash'";
    if ($con->query($sql) == TRUE) {
      die();
    }
  }

  die();
  
} else {  

  // the number of rows in the database

  if (isset($_GET["s"]) === true) {
    if ($_GET["s"] == "country") {
      $orderby = "country, region";
    }
    else {
      $orderby = $con->real_escape_string($_GET["s"]);
    }
  } else {
    $orderby = "lastvisit";
  }
  $orderby .= (isset($_GET["rev"]) === true || isset($_GET["s"]) === false) ? " DESC" : "";

  $sql  = "SELECT region, country, version, os, start, lastvisit, updates, times_used";
  $sql .= (isset($_GET["ip"]) === true) ? ", ip " : " ";
  $sql .=  "FROM users ORDER BY $orderby";

  $result = $con->query($sql);
  $nrow = $result->num_rows;

  $tabHeader = array("loc"         => "Location",
                     "version"     => "Version",
                     "os"          => "Operating System",
                     "start"       => "Active Since",
                     "lastvisit"   => "Last Update",
                     "updates"     => "# Updates",
		     "times_used"  => "# Uses");
  if (isset($_GET["ip"]) === true) {
    $tabHeader["ip"] = "IP Address";
  }


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

      $showip = (isset($_GET["ip"]) === true) ? "ip&" : "";

      echo "<tr class='head'>";
      foreach($tabHeader as $lab => $val) {
        $labb = ($lab == "loc") ? "country" : $lab;
        $rev  = (isset($_GET["rev"]) === true || $_GET["s"] != $labb) ? "" : "&rev";
        echo "<th><a href='./?".$showip."s=".$labb.$rev."'>$val</a></th>";
      }
      echo "</tr>";
      
      while($row = $result->fetch_assoc()) {
	echo "<tr>";
        
        if (strlen($row["region"]) > 0) {
          $row["loc"] = $row["region"] . " - " . $row["country"];
        } else if (strlen($row["country"]) > 0) {
          $row["loc"] = $row["country"];
        } else {
          $row["loc"] = "-";
        }

	foreach($tabHeader as $key => $val) {
	  echo "<td>" . $row[$key] . "</td>";
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

