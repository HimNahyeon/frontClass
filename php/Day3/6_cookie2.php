<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<?php
  if(!isset($_COOKIE['userid'])){
      echo "<p>쿠키가 존재하지 않습니다.</p>";
  }else{
      echo "<p>쿠키가 존재합니다.</p>";
      echo "<p>저장된 쿠키의 값 : {$_COOKIE['userid']} </p>";
  }
?>
</body>
</html>