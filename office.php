<?php
include 'connect.php';
$location=$_POST['location'];
$phone=$_POST['phone'];
$sql1=mysqli_query($conn,"INSERT INTO office(location,phone)values('$location','$phone')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>