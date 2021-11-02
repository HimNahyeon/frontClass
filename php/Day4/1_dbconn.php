<?php
    $conn = mysqli_connect("localhost:3306", "root", "0000", "front_class") or die("데이터베이스 연결 실패!");

    if($conn){
        echo("DB연결 성공!");
    }else{
        echo("🤬");
    }
?>