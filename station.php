<?php
include 'connect.php';
$station_name=$_POST['station_name'];
$phone=$_POST['phone'];
$type=$_POST['type'];
$sql1=mysqli_query($conn,"INSERT INTO station(station_name,phone,type)values('$station_name','$phone','type')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>