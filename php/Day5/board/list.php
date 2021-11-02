<?php
    include "../include/sessioncheck.php";
    include "../include/dbconn.php";

    $sql = "select count(b_idx) as total from tb_board";
    $result = mysqli_query($conn, $sql);

    
    $row = mysqli_fetch_array($result);
    $total = $row['total']; //총 글 갯수를 가져옴

    $pagePerCount = 10; //페[ㅇ이지당 보여질 게시물의 수
    $start = 0; //데이터의 시작
    $page = 1; //페이지를 정하지 않으면 1페이지

    if(isset($_GET['page'])){
        $page = $_GET['page'];
        $start = ($page-1) * $pagePerCount;
    }

    $sql = "select b_idx, b_title, b_userid, b_hit, b_regdate, b_like from tb_board order by b_idx desc limit $start, $pagePerCount";
    $result = mysqli_query($conn, $sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리스트</title>
</head>
<body>
    <h2>리스트</h2>
    <p>전체 글 개수 : <?=$total?></p>
    <table border ="1" width="800">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>조회수</th>
            <th>좋아요</th>
            <th>날짜</th>
        </tr>

<?php
    while($row = mysqli_fetch_array($result)){
        $b_idx = $row['b_idx'];
        $b_title = $row['b_title'];
        $b_userid = $row['b_userid'];
        $b_hit = $row['b_hit'];
        $b_regdate = $row['b_regdate'];
        $b_like = $row['b_like'];

        $sql = "select count(re_idx) as replycount from tb_reply where re_boardidx = $b_idx";
        $row_reply = mysqli_query($conn,$sql);
        $row_reply_count = mysqli_fetch_array($row_reply);
   
        $resultcountstr = "";
        if($row_reply_count['replycount'] > 0) {
            $resultcountstr = "[".$row_reply_count['replycount']."]";
        }
?>

        <tr>
            <td><?=$b_idx?></td>
            <td><a href="./detail.php?b_idx=<?=$b_idx?>"><?=$b_title?></a> <?=$resultcountstr?></td>
            <td><?=$b_userid?></td>
            <td><?=$b_hit?></td>
            <td><?=$b_regdate?></td>
            <td><?=$b_like?></td>
        </tr>
   
<?php
     }

     $pageNum = ceil($total / $pagePerCount); //ceil -> 올림임  따라서 23의 데이터는 3페이지까지 존재하게됨

?>
    <tr>
        <td colspan="6" align="center">
<?php
    for($i=1; $i <= $pageNums; $i++){
        echo "<a href='./list.php?page=".$i."'>".$i." ";
    }
?>
        </td>
    </tr>

    </table>
    <p><a href="./write.php">글쓰기</a></p>
</body>
</html>