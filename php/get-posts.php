<?php
// Connect to the database

$hostname = 'rdbms.strato.de';
$username = 'dbu1061402';
$password = 'FWHeKPWA2XqNAXbjxcEnHM4X';
$database = 'dbs4264785';
$connection = mysqli_connect($hostname, $username, $password, $database);

// Check connection
if (!$connection) {
    echo 'Connection error: ' . mysqli_connect_error();
    exit(-1);
}
// Write query for all posts
$sql = "SELECT * FROM posts ORDER BY timestamp";
// Get the result set (set of rows)
$result = mysqli_query($connection, $sql);
// Fetch the resulting rows as an array
$posts = mysqli_fetch_all($result, MYSQLI_ASSOC);

// Free the $result from memory (good practise)
mysqli_free_result($result);
// Close connection
mysqli_close($connection);
// Output
print_r(json_encode($posts));