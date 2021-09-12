<?php
$user = 'DBu440158';
$password = 'qUBFvd.AT4GKpAHejwCy';
$host = 'rdbms.strato.de';
$db = 'DBs4089218';

// Create connection
$connection = new mysqli($host, $user, $password, $db);
// Check connection
if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
