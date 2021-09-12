<?php
require 'db_connection.php';

$query = "SELECT * FROM posts";

$result = $connection->query($query);

/* fetch object array */
while ($obj = $result->fetch_object()) {
    printf("%s (%s)\n", $obj->id, $obj->header, $obj->body);
}