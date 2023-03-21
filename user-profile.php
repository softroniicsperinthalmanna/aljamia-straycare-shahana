<?php
include 'connect.php';
$id=$_GET["id"];
$sql = mysqli_query($con, "SELECT * from register_tb inner join userlogin on register_tb.log_id=userlogin.log_id where userlogin.log_id='$id'");
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="user-profile.css">
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
                <div class="profilecontainer">
                    <div class="profile-details">
                        <div class="profile-img">
                            <?php 
                        while ($row = mysqli_fetch_array($sql)) {
                            ?>
                            <img src="<?php echo $row['name']; ?>" alt="<?php echo "No image Selected" ?>"><br>
                        </div>
                        <h1 id="name"><?php echo $row['name'] ?></h1>
                        <h5 id="phone"><?php echo $row['phone'] ?></h5><br>
                        <p><?php echo $row['address'] ?></p>
                                <?php } ?>
                                
                    </div>
                </div>
            </section>
        </section>



    </main>
    <script>
        feather.replace()
    </script>
</body>

</html>