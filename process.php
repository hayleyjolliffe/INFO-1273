<?php

$databaseHost = 'localhost';//localhost
$databaseName = 'registration';//registration
$databaseUsername = 'root';//root by default for localhost
$databasePassword = '';//by default empty for localhost

$mysqli = mysqli_connect($databaseHost,$databaseUsername,$databasePassword,$databaseUsername);

?>

<?php
if(isset($_POST['submit']))
{
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $pw = $_POST['pw'];
    $email = $_POST['email'];
    $address = $_POST['address'];
    $city = $_POST['city'];
    $country = $_POST['country'];

    $result = mysqli_query($mysqli, "insert into user values(",'$first_name','$last_name','$pw','$email','$address','$city','$country',")");
    if($result)
    {
        echo "Registration successful.";
    }
    else{
        echo "Failed";
    }
}

?>
