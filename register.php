<?php
include 'connect.php';
$name=$_POST['name'];
$phone=$_POST['phone'];
$password=$_POST['password'];
$sql1= mysqli_query($conn,"INSERT INTO userlogin(password,phone)values('$password','$phone')");
$user_id=mysqli_insert_id($conn);
$sql2=mysqli_query($conn,"INSERT INTO register_tb(name,log_id)values('$name','$user_id')");
if($sql1 && $sql2){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>