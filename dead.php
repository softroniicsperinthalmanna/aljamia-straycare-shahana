<?php
include 'connect.php';
$reason=$_POST['reason'];
$date=$_POST['date'];
$animal_id=$_POST['animal_id'];
$office_id=$_POST['office_id'];
$img=$_FILES['img1']['name'];                  //img--->php;    img1---->from flutter...use this in postman
$imagepath='reportCase/'.$img;
$tmp_name=$_FILES['img1']['tmp_name'];
move_uploaded_file($tmp_name,$imagepath);
$sql1=mysqli_query($conn,"INSERT INTO dead(reason,date,animal_id,office_id)values('$reason','$date','$animal_id','$office_id')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>