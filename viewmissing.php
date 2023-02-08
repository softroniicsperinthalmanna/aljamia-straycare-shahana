
<?php
include 'connect.php';
//$log_id=$_POST['userName_id'];


$data=mysqli_query($conn,"SELECT * FROM missing ");
$list=array();

if($data->num_rows>0){
    while($row=mysqli_fetch_assoc($data)){

    $myarray['description']=$row['description'];
    $myarray['location']=$row['location'];
    $myarray['dateandtime']=$row['dateandtime'];
    $myarray['phone']=$row['phone'];
    $myarray['animal_type']=$row['animal_type'];
    $myarray['status']=$row['status'];
    $myarray['user_id']=$row['user_id'];

    array_push($list,$myarray);

    }   

} 
else{
    $myarray['result']="failed";
    array_push($list,$myarray);
 
}
echo json_encode($list);
?>
