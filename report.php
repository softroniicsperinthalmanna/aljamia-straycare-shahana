<?php
include 'connect.php';
$description=$_POST['description'];
$location=$_POST['location'];
$dateandtime=$_POST['dateandtime'];
// $phone=$_POST['phone'];
// $image=$_POST['image'];
$case_type=$_POST['case_type'];
$user_id=$_POST['user_id'];

$img=$_FILES['img1']['name'];                  //img--->php;    img1---->from flutter...use this in postman
$imagepath='reportCase/'.$img;
$tmp_name=$_FILES['img1']['tmp_name'];
move_uploaded_file($tmp_name,$imagepath);


$sql1=mysqli_query($conn,"INSERT INTO report(description,location,dateandtime,image,case_type,user_id)values('$description','$location','$dateandtime','$img','$case_type','$user_id')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>