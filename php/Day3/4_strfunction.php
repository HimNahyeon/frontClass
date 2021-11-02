<?php
    $str1 = "abcdefghijklmn123345";
    $str1 = "가나다라마바사아자차카타파하";
    $str1 = "Hello/PHP/Hello/World";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문자열 함수</title>
</head>
<body>
    <h2>문자열 함수</h2>

<?php
    echo strlen($str1)."<br>";
    echo strlen($str2)."<br>"; // php는 한글을 한글자에 3byte로 본다. 글자수*3 해야됨
    echo "<br>";
    
    echo strcmp("abc", "ABC")."<br>";
    echo strcmp("10", "2")."<br>"; //문자열비교기때문에 앞자리부터 한자리씩 비교  2가 1보다 더크기때문에! -1이 나옴
    echo strcmp("abc", "abc")."<br>"; //두개가 같으니까 0
    echo "<br>";

    echo strstr($str1, "cd")."<br>";
    echo "<br>";

    echo strpos($str1, "abc")."<br>";
    echo "<br>";

    echo substr($str1, 3)."<br>";  //해당 문자열의 세번째 인덱스부터 잘라서 가져옴
    echo substr($str1, -3)."<br>"; //해당 문자열의 끝에서부터 세번째 인덱스부터 잘라서 가져옴
    echo substr($str1, 3, 10)."<br>"; // 인덱스 3번부터 시작해서 열글자

    $arr = explode("/", $str3);
    foreach($arr as $str){
        echo $str." ";
    }
    echo("<br>");
    echo str_replace("o","🌹", $str3)."<br>"; //str3에서 o를 찾아서 장미로 바꿔줌
    ?>
</body>
</html>