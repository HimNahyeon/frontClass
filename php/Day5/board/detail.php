<?php
    include "../include/sessioncheck.php"; //로그인 안했을경우 직접접근못함
    include "../include/dbconn.php";  // 데이터베이스 연결


    if(!isset($_GET['b_idx'])){
        echo "<script>alert('잘못된 접근입니다');location.href='./list.php';</script>";
    }; //if문으로 로그인안하고 detail로 접근하는걸 막아줌.  오류나지않게.

    $b_idx = $_GET['b_idx'];
    
    //조회수 1 올리기 - 클릭하는게 기준이아니라 해당페이지에 들어가서 업데이트되는게 기준.
    $sql = "update tb_board set b_hit = b_hit + 1 where b_idx=$b_idx";
    $result = mysqli_query($conn, $sql);

    //해당 글 보기
    $sql = "select b_idx, b_title, b_content, b_userid, b_hit, b_regdate, b_like from tb_board where b_idx =$b_idx"; //재사용
    $result = mysqli_query($conn, $sql); //재사용
    $row = mysqli_fetch_array($result);


    $id = $_SESSION['id'];  //로그인된 아이디
    $b_idx = $row['b_idx'];
    $b_title = $row['b_title'];
    $b_content = $row['b_content'];
    $b_userid = $row['b_userid']; //실제 글 작성아이디
    $b_hit = $row['b_hit'];
    $b_regdate = $row['b_regdate'];
    $b_like = $row['b_like'];


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글보기</title>
    <script>
        function like(){
            const xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function(){
                if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
                    alert('좋아요!');
                    document.getElementById("like").innerHTML = xhr.responseText;
                }
            }
            xhr.open("GET", "like_ok.php?b_idx=<?=$b_idx?>", true);
            xhr.send();
        }

    </script>
</head>
<body>
    <h2>글보기</h2>
    <table border="1" width="800">
        <tr>
            <th>제목</th>
            <th><?=$b_title?></th>
        </tr>
        <tr>
            <th>글쓴이</th>
            <th><?=$b_userid?></th>
        </tr>
        <tr>
            <th>날짜</th>
            <th><?=$b_regdate?></th>
        </tr>
        <tr>
            <th>조회수</th>
            <th><?=$b_hit?></th>
        </tr>
        <tr>
            <th>좋아요</th>
            <th><span id="like"><?=$b_like?></span></th>
        </tr>
        <tr>
            <th>내용</th>
            <th><?=$b_content?></th>
        </tr>
        <tr>
            <td colspan="2">

            <?php
                if($id == $b_userid){
            ?>
                <a href="./edit.php?b_idx=<?=$b_idx?>">수정</a>
                <a href="./delete.php?b_idx=<?=$b_idx?>">삭제</a>
            <?php
                }   
            ?>
                <a href="./list.php">리스트</a>
                <img src="./images/like.png" alt="좋아요버튼" width="20" onclick="like()">
            </td>
        </tr>
    </table>
    <hr/>
    <form method="post" action="reply_ok.php">
        <input type="hidden" name="b_idx" values="<?=$b_idx?>">
        <p><?=$id?> : <input type="text" name="re_content"><input type="submit" value="확인"></p>
    </form>
    <hr/>
    <?php
        $sql = "select re_idx, re_userid, re_content, re_regdate from tb_reply where re_boardidx=$b_idx order by re_idx desc;
        "
        $result = mysqli_query($conn, $sql);

        while($row = mysqli_fetch_array($result)){
            $re_idx          = $row['re_idx'];
            $re_userid         = $row['re_userid'];
            $re_regdate     = $row['re_regdate'];
            $re_content     = $row['re_content'];


        ?>
            <p>드래곤 푸잇 : 안녕하세요! (2021-10-31)</p>
        <?php
            }
        ?>
</body>
</html>