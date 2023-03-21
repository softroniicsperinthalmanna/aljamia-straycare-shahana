
<?php
include 'connect.php';
if(isset($_POST['submit'])) {
    if (isset($_POST['sname']) && isset($_POST['sid']) && isset($_POST['password'])) {
        $s_name = $_POST['sname'];
        $s_id = $_POST['sid'];
        $pass = $_POST['password'];
        if ($con->connect_error) {
            die('Could not connect to the database.');
        } else {
            echo "connection Ok";

            $sql1 = mysqli_query($con, "INSERT INTO login (code,password,authority_type) values('$s_id','$pass','Police')");
            $log_id = mysqli_insert_id($con);
            $sql2 = mysqli_query($con, "INSERT INTO station (station_name,login_id) values ('$s_name','$log_id')");
            if ($sql1 && $sql2) {
                echo "User added successfully";
                echo "<script>window.location.href='police-table.php'; </script>";
            } else {
                echo "Fail to add details !!";
                header('location:police-insert.php');
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="Police-edit.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin home</title>
</head>

<body>

    <main>

        <!-- sidebar -->

        <section class="sidebar">

            <!-- Logo -->

            <div class="logo_details">
                <div class="logo_txt">Stray Care</div>
                <div class="logo">
                    <img src="logo.png" alt="logo">
                </div>
            </div>

            <!-- Navigation Links -->

            <ul class="nav-links">
                <li>
                    <a href="admin.html" class="active">
                        <i class="feather" data-feather="grid"></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="user-table.html">
                        <i class="feather" data-feather="users"></i>
                        <span class="links_name">Users</span>
                    </a>
                </li>
                <li>
                    <a href="police-table.html">
                        <i class="feather" data-feather="shield"></i>
                        <span class="links_name">Police</span>
                    </a>
                </li>
                <li>
                    <a href="forest-table.html">
                        <i class="feather" data-feather="feather"></i>
                        <span class="links_name">Forest</span>
                    </a>
                </li>
                <li>
                    <a href="local-gov-table.html">
                        <i class="feather" data-feather="home"></i>
                        <span class="links_name">Local-Self Government</span>
                    </a>
                </li>
                <li>
                    <a href="vet-table.html">
                        <i class="feather" data-feather="plus-square"></i>
                        <span class="links_name">Veterinary</span>
                    </a>
                </li>
                <li>
                    <a href="office-table.html">
                        <i class="feather" data-feather="square"></i>
                        <span class="links_name">Offices</span>
                    </a>
                </li>

            </ul>
        </section>

        <section class="rgt-ctnr">

            <nav>

                <ul class="nav-btns">
                    <li>
                        <input type="text" placeholder="Search">
                    </li>
                    <li class="nav-notfn">
                        <a href="#" class="active">
                            <i class="feather" data-feather="bell"></i>
                            <span class="links_name">Notifications</span>
                        </a>
                    </li>
                    <li class="dropdown">
                        <img src="download.jpg" alt="Not supported">
                        <span>Ashiq Ali</span>
                        <ul class="dropdown-options">
                            <li class="dropdown-item">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="dropdown-item">
                                <a href="#">Logout</a>
                            </li>
                        </ul>
                    </li>
                    <!-- <li>
                        <div class="dropdown">
                            <button>Profile</button>
                            <div class="dropdown-options">
                                <a href="#">Dashboard</a>
                                <a href="#">Logout</a>
                            </div>
                        </div>
                    </li> -->
                </ul>
            </nav>

            <section class="dashboard">
                <!-- <ul class="dash-btns">
                    <li>
                        <a href="#" class="active">
                            <i class="feather" id="plus" data-feather="arrow-left-circle"></i>
                            <span class="links_name" id="plus">Go Back</span>
                        </a> 
                    </li>
                </ul> -->
                <div class="edit-container">
                    <div class="profile-head">
                        <h1>Add Police</h1>
                        <div class="img-container">
                            <!-- <img src="young-bearded-man-with-striped-shirt.jpg" alt=""> -->
                        </div>
                    </div>
                    <div class="edit-form">
                        <form action="police-insert.php" method="post">
                            <!-- <div class="name">
                                <div class="form-grp-inline">
                                    <label for="firstname">First Name</label><br>
                                    <input type="text" id="firstname" name="firstname">
                                </div>
                                <div class="form-grp-inline">
                                    <label for="lastname">Last Name</label><br>
                                    <input type="text" id="lastname" name="lastname">
                                </div>

                                <div class="clearfix"></div>
                            </div> -->
                            <div class="form-grp">
                                <label for="address">Station Name</label><br>
                                <input type="text" id="address" name="sname" value="<?php  ?>"> 
                            </div>
                            <div class="form-grp">
                                <label for="phone">Station ID</label><br>
                                <input type="text" id="phone" name="sid">
                            </div>
                            <div class="form-grp">
                                <label for="password">Password</label><br>
                                <input type="password" id="password" name="password">
                            </div>
                            <div class="buttons">
                                <button type="button">Cancel</button>
                                <button name="submit" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>

            </section>
        </section>



    </main>
    <script>feather.replace()</script>
</body>

</html>