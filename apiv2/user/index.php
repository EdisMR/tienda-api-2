<?php
/* ********************************** */
/* ********  USER VALIDATION  *********** */
/* ********************************** */
require "../common.php";

parse_str(file_get_contents('php://input'), $_PUT);
$usuario = $_PUT['usuario'];
$contrasenia = $_PUT['contrasenia'];
$sql = "UPDATE `usuarios` SET `usuario` = '$usuario', `contrasenia` = '$contrasenia' WHERE `usuarios`.`idauto` = 1";
echo executeQuery($sql);