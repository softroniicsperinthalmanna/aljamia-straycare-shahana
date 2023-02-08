
<?php
include 'connect.php';
//$log_id=$_POST['userName_id'];


$data=mysqli_query($conn,"SELECT foster.image from foster INNER join adoption on adoption.animal_id=foster.animal_id;");
$list=array();

if($data->num_rows>0){
    while($row=mysqli_fetch_assoc($data)){
        $list[]=$row;
    // $myarray['description']=$row['description'];
    // $myarray['location']=$row['location'];
    // $myarray['dateandtime']=$row['dateandtime'];
    // $myarray['phone']=$row['phone'];
    // $myarray['user_id']=$row['user_id'];
    // array_push($list,$myarray);

    }   

} 
else{
    // $myarray['result']="failed";
    // array_push($list,$myarray);
    $list='Failed';
 
}
echo json_encode($list);
?>
