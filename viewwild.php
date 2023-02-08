
<?php
include 'connect.php';
//$log_id=$_POST['userName_id'];


$data=mysqli_query($conn,"SELECT report.description,report.image,report.location,report.dateandtime,register_tb.name,userlogin.phone FROM report INNER JOIN register_tb on register_tb.log_id=report.user_id INNER JOIN userlogin on report.user_id= userlogin.log_id where case_type = 'wild';");

//$list=array();

if($data->num_rows>0){
    while($row=mysqli_fetch_assoc($data)){
        $list[]=$row;

    // $myarray['description']=$row['description'];
    // $myarray['location']=$row['location'];
    // $myarray['dateandtime']=$row['dateandtime'];
    // $myarray['phone']=$row['phone'];
    // $myarray['user_id']=$row['user_id'];
    // $myarray['image']=$row['image'];

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
