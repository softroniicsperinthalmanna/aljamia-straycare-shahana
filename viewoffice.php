
<?php
include 'connect.php';
//$log_id=$_POST['userName_id'];


$data=mysqli_query($conn,"SELECT * FROM foster ");
$list=array();

if($data->num_rows>0){
    while($row=mysqli_fetch_assoc($data)){

    $myarray['description_vet']=$row['description_vet'];
    $myarray['date_collected']=$row['date_collected'];
    $myarray['place_collected']=$row['place_collected'];
    array_push($list,$myarray);

    }   

} 
else{
    $myarray['result']="failed";
    array_push($list,$myarray);
 
}
echo json_encode($list);
?>
