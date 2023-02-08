<?php
include 'connect.php';
$local_name=$_POST['local_name'];
$institution_type=$_POST['institution_type'];
$sql1=mysqli_query($conn,"INSERT INTO localselfgovernment(local_name,institution_type)values('$local_name','$institution_type')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>