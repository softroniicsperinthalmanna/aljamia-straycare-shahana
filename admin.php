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
                <!-- <p>.content</p>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus hendrerit. Pellentesque aliquet
                    nibh
                    nec urna. In nisi neque, aliquet vel, dapibus id, mattis vel, nisi. Sed pretium, ligula sollicitudin
                    laoreet viverra, tortor libero sodales leo, eget blandit nunc tortor eu nibh. Nullam mollis. Ut
                    justo.
                    Suspendisse potenti.
                <p>

                <p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue.
                    Morbi
                    purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum
                    hendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat, lacus a ultrices sagittis, mi
                    neque
                    euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu, fermentum et,
                    dapibus
                    sed, urna.</p>

                <p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus
                    arcu
                    pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing
                    varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut
                    lectus.
                    Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia
                    eu,
                    vulputate vel, nisl.</p>

                <p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus
                    arcu
                    pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing
                    varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut
                    lectus.
                    Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia
                    eu,
                    vulputate vel, nisl.</p>

                <p>Suspendisse mauris. Fusce accumsan mollis eros. Pellentesque a diam sit amet mi ullamcorper vehicula.
                    Integer adipiscing risus a sem. Nullam quis massa sit amet nibh viverra malesuada. Nunc sem lacus,
                    accumsan quis, faucibus non, congue vel, arcu. Ut scelerisque hendrerit tellus. Integer sagittis.
                    Vivamus a mauris eget arcu gravida tristique. Nunc iaculis mi in ante. Vivamus imperdiet nibh
                    feugiat
                    est.</p>

                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>
                <p>Ut convallis, sem sit amet interdum consectetuer, odio augue aliquam leo, nec dapibus tortor nibh sed
                    augue. Integer eu magna sit amet metus fermentum posuere. Morbi sit amet nulla sed dolor elementum
                    imperdiet. Quisque fermentum. Cum sociis natoque penatibus et magnis xdis parturient montes,
                    nascetur
                    ridiculus mus. Pellentesque adipiscing eros ut libero. Ut condimentum mi vel tellus. Suspendisse
                    laoreet. Fusce ut est sed dolor gravida convallis. Morbi vitae ante. Vivamus ultrices luctus nunc.
                    Suspendisse et dolor. Etiam dignissim. Proin malesuada adipiscing lacus. Donec metus. Curabitur
                    gravida
                </p>

                <p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus
                    arcu
                    pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing
                    varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut
                    lectus.
                    Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia
                    eu,
                    vulputate vel, nisl.</p>

                <p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus
                    arcu
                    pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing
                    varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut
                    lectus.
                    Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia
                    eu,
                    vulputate vel, nisl.</p>

                <p>Morbi interdum mollis sapien. Sed ac risus. Phasellus lacinia, magna a ullamcorper laoreet, lectus
                    arcu
                    pulvinar risus, vitae facilisis libero dolor a purus. Sed vel lacus. Mauris nibh felis, adipiscing
                    varius, adipiscing in, lacinia vel, tellus. Suspendisse ac urna. Etiam pellentesque mauris ut
                    lectus.
                    Nunc tellus ante, mattis eget, gravida vitae, ultricies ac, leo. Integer leo pede, ornare a, lacinia
                    eu,
                    vulputate vel, nisl.</p> -->
            </section>
        </section>



    </main>
    <script>feather.replace()</script>
</body>

</html>