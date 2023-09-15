<?php
    include 'conexao.php';

    $Vemail = $_POST['txtemail'];
    $Vsenha = $_POST['txtsenha'];

    $consulta = $cn->query("select id_usuario, nm_usuario, ds_email, ds_senha, ds_status from tbl_usuario where ds_email = '$Vemail' and ds_senha = '$Vsenha' ");

    if($consulta->rowCount() == 1){
        echo 'usuario já cadastrado';
    }
    else{
        echo 'usuario não cadastrado';
    }
?>