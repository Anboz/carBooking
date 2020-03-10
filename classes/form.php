<?php
    require_once "db.php";
     $db = new DB("booking");
     $db->insertInfo("INSERT INTO tbl_comment (id, user_commented, commentText, isTaxi, comment_date) VALUES('".$_POST['commentId']."', '".$_POST['commented']."', '".$_POST['commentText']."', '".$_POST['isTaxi']."', '".date('Y-m-d H:i:s')."')");   
?>