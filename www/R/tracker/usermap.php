<?php 

shell_exec('Rscript plotUsers.R');

?>

<!DOCTYPE html>
<html>

  <head>
    
    <title>Plot of User Locations</title>
    <style>
     html, body {
       width: 100%;
     }
     img {
       width: 100%;
     }
    </style>

  </head>

  <body>
    <a href="userMap.jpg"><img src="userMap.jpg"></a>
  </body>
</html>
