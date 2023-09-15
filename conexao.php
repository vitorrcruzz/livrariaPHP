<?php 

    $servidor="Localhost";
    $user="livraria";
    $senha="123456";
    $DB="db_LivrariaM";

    $cn = new PDO("mysql:host=$servidor;dbname=$DB", $user, $senha);

?>