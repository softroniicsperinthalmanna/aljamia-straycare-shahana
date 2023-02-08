<?php
include 'connect.php';
$type=$_POST['type'];
$user_id=$_POST['user_id'];
$amount=$_POST['amount'];
$sql1=mysqli_query($conn,"INSERT INTO donation(type,user_id,amount)values('$type','$user_id','$amount')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>