<?php
include 'connect.php';
$date=$_POST['date'];
$user_id=$_POST['user_id'];
$animal_id=$_POST['animal_id'];
$img=$_FILES['img1']['name'];                  //img--->php;    img1---->from flutter...use this in postman
$imagepath='reportCase/'.$img;
$tmp_name=$_FILES['img1']['tmp_name'];
move_uploaded_file($tmp_name,$imagepath);
$sql1=mysqli_query($conn,"INSERT INTO adoption(date,user_id,animal_id)values('$date','$user_id','$animal_id')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>