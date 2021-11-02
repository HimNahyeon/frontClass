<?php
    include "../include/sessioncheck.php"; //로그인 안했을경우 직접접근못함
    include "../include/dbconn.php";  // 데이터베이스 연결

    $b_idx = $_GET['b_idx'];
    $sql = "update tb_board set b_like = b_like + 1 where b_idx=$b_idx"; //이건 좋아요버튼이 누르자마자 바뀌어야됨.
    $result = mysqli_query($conn, $sql);
    
    $sql = "select b_like from tb_board where b_idx=$b_idx"; //다시 select해줘서 해당글의 like를 보여줌
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result); //여기 이제 해당글의like가 들어가있음
    echo $row['b_like'];

?>