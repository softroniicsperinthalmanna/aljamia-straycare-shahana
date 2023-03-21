<?php
include 'connect.php';

if (isset($_GET['id'])) {
    $user_id = $_GET['id'];



   
        $sql1 = mysqli_query($con, "UPDATE  station set Status='1' where login_id='$user_id'");
        if ($sql1) {
            echo "Updated successfully";
            echo "<script>window.location.href='police-blocked.php'; </script>";
        } else {
            echo "Fail to update !!";
            header('location:police-blocked.php');
        }
    }

?>