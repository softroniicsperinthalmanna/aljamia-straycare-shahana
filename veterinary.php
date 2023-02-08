<?php
include 'connect.php';
$clinic_name=$_POST['clinic_name'];
$sql1=mysqli_query($conn,"INSERT INTO veterinary(clinic_name)values('$clinic_name')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>