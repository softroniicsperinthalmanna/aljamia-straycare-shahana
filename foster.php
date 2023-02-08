<?php
include 'connect.php';
$image=$_POST['image'];
$description_vet=$_POST['description_vet'];
$veterinary_id=$_POST['veterinary_id'];
$place_collected=$_POST['place_collected'];
$date_collected=$_POST['date_collected'];
$img=$_FILES['img1']['name'];                  //img--->php;    img1---->from flutter...use this in postman
$imagepath='reportCase/'.$img;
$tmp_name=$_FILES['img1']['tmp_name'];
move_uploaded_file($tmp_name,$imagepath);
$sql1=mysqli_query($conn,"INSERT INTO foster(image,description_vet,veterinary_id,place_collected,date_collected)values('$image','$description_vet','$veterinary_id','$place_collected','$date_collected')");
if($sql1){
    $myarray['result']="success";
    $myarray['response']="done";
} else{
    $myarray['result']="failed";
   
}
echo json_encode($myarray);
?>