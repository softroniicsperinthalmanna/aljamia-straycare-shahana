<?php 
include 'connect.php'
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <script src="https://unpkg.com/feather-icons"></script>
    <link rel="stylesheet" href="admin.css">
    <link rel="stylesheet" href="user-table.css">
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
                    <a href="admin.php" class="active">
                        <i class="feather" data-feather="grid"></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                </li>
                <li>
                    <a href="user-table.php">
                        <i class="feather" data-feather="users"></i>
                        <span class="links_name">Users</span>
                    </a>
                </li>
                <li>
                    <a href="police-table.php">
                        <i class="feather" data-feather="shield"></i>
                        <span class="links_name">Police</span>
                    </a>
                </li>
                <li>
                    <a href="forest-table.php">
                        <i class="feather" data-feather="feather"></i>
                        <span class="links_name">Forest</span>
                    </a>
                </li>
                <li>
                    <a href="local-gov-table.php">
                        <i class="feather" data-feather="home"></i>
                        <span class="links_name">Local-Self Government</span>
                    </a>
                </li>
                <li>
                    <a href="vet-table.php">
                        <i class="feather" data-feather="plus-square"></i>
                        <span class="links_name">Veterinary</span>
                    </a>
                </li>
                <li>
                    <a href="office-table.php">
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
                <ul class="dash-btns">
                    <li>
                        <a href="#" class="active">
                            <i class="feather" id="plus" data-feather="plus"></i>
                            <span class="links_name" id="plus">Add User</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="feather" id="x" data-feather="x"></i>
                            <span class="links_name" id="x">Remove User</span>
                        </a>
                    </li> 
                    <li>
                        <a href="#">
                            <i class="feather" id="plus" data-feather="edit-2"></i>
                            <span class="links_name" id="plus">Edit User</span>
                        </a>
                    </li>
                </ul>
                <div class="tablecontainer">
                    <table>
                        <thead>
                            <tr>
                                <th>Office</th>
                                <th>District</th>
                                <th>Under Foster</th>
                                <th>ID</th>
                                <th>Password</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Vilayur</td>
                                <td>Palakkad</td>
                                <td>4</td>
                                <td>Vilayur</td>
                                <td>avr%d</td>
                            </tr>
                            <tr>
                                <td>Perinthalmanna</td>
                                <td>Malappuram</td>
                                <td>6</td>
                                <td>Perinthalmanna</td>
                                <td>joiad&ad</td>
                            </tr>
                            <tr>
                                <td>Koppam</td>
                                <td>Palakkad</td>
                                <td>7</td>
                                <td>Koppam</td>
                                <td>ijfa83*d</td>
                            </tr>
                            <tr>
                                <td>Pulamanthole</td>
                                <td>Malappuram</td>
                                <td>3</td>
                                <td>Pulamanthole</td>
                                <td>khads8&</td>
                            </tr>
                            <tr>
                                <td>Vettathur</td>
                                <td>Malappuram</td>
                                <td>8</td>
                                <td>Vettathur</td>
                                <td>kldsa()k3</td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </section>
        </section>



    </main>
    <script>feather.replace()</script>
</body>

</html>