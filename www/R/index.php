<?php
  $path = substr($_SERVER['SCRIPT_FILENAME'], 0, strrpos($_SERVER['SCRIPT_FILENAME'], '/') + 1);
  $icondir = "/R/icons";

  $current = explode("www/R", $path)[1];
  $showup = $current != "/";

/** 
* Converts bytes into human readable file size. 
* 
* @param string $bytes 
* @return string human readable file size (2,87 Мб)
* @author Mogilev Arseny 
*/ 
function FileSizeConvert($bytes)
{
    if ($bytes == 0) {
       return "0 B";
    } 
    $bytes = floatval($bytes);
        $arBytes = array(
            0 => array(
                "UNIT" => "TB",
                "VALUE" => pow(1024, 4)
            ),
            1 => array(
                "UNIT" => "GB",
                "VALUE" => pow(1024, 3)
            ),
            2 => array(
                "UNIT" => "MB",
                "VALUE" => pow(1024, 2)
            ),
            3 => array(
                "UNIT" => "KB",
                "VALUE" => 1024
            ),
            4 => array(
                "UNIT" => "B",
                "VALUE" => 1
            ),
        );

    foreach($arBytes as $arItem)
    {
        if($bytes >= $arItem["VALUE"])
        {
            $result = $bytes / $arItem["VALUE"];
            $result = round($result, 2)." ".$arItem["UNIT"];
            break;
        }
    }
    return $result;
}
?>

<!DOCTYPE html>
<html>

<head>
  <title>iNZight Package Repository</title>

  <style type="text/css">
    body {
      font-family: Verdana, Arial, sans-serif;    
    } 

    #container {
      max-width: 940px;
      margin: 0 auto;
    }

    a, a:visited, a:active {
      font-family: Monospace;
      color: #0000cc;
    }
    a:hover {
      color: #cc0000;
    }

    table {
      text-align: left;
    }

    td, th {
      padding-right: 30px;
    }

    .nopad {
      padding: 0;
    }
  </style>
</head>

<body>
  <div id="container">
    <h1>iNZight Package Repository</title>

    <h3>Index of <?php echo $current; ?></h3>

    <table>
      <tr class="header">
        <th></th>
        <th>Name</th>
        <th>Last Modified</th>
        <th>Size</th>
      </tr>
<?php
$dirs = array();
$files = array();

$dir = dir($path);
while ($entry = $dir->read()) {
    if (($entry != '.') and (substr($entry, -4) != '.php') and ($entry != 'icons')) {
        if (is_dir($entry)) {
            if (($entry != '..')){
                $dirs[] = $entry;
            }
        } else {
            $files[] = $entry;
        }
    }
}
$dir->close();

if ($showup) {
  echo "<tr>";
  echo '<td class="nopad"><img src="'.$icondir.'/updir.png"></td>';
  echo '<td><a href="..">Parent Directory</a></td>';
  echo "<td> - </td>";
  echo "<td> - </td>";
  echo "</tr>";
}

sort($dirs);
foreach($dirs as $dir) {
  $stat = stat($path.$dir);
  $mod = date("j-M-Y H:i", $stat['mtime']);
  echo "<tr>";
  echo '<td class="nopad"><img src="'.$icondir.'/folder.png"></td>';
  printf('<td><a href="%s">%s/</a></td>', $dir, $dir);
  echo "<td>" . $mod . "</td>";
  echo "<td> - </td>";
  echo "</tr>";
}

sort($files);
foreach($files as $file) {
  $stat = stat($path.$file);
  $mod = date("j-M-Y H:i", $stat['mtime']);
  $size = FileSizeConvert($stat['size'] . " bytes");
  echo "<tr>";
  echo '<td class="nopad"><img src="'.$icondir.'/file.png"></td>';
  printf('<td><a href="%s">%s</a></td>', $file, $file);
  echo "<td>" . $mod . "</td>";
  echo "<td>" . $size . "</td>";
  echo "</tr>";
}
?>       
    </table>
  </div>
</body>
</html>
