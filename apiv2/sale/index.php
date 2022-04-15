<?php
/* ********************************** */
/* ********  SALES INFORMATION  ********* */
/* ********************************** */
require "../common.php";

/* api rest switch */
switch($method){
	case 'GET':
		manageGet();
		break;
	case 'POST':
		managePost();
		break;
	case 'PUT':
		managePut();
		break;
	case 'DELETE':
		manageDelete();
		break;
	default:
		http_response_code(400);
		echo json_encode(array("error" => "Invalid request"));
		break;
}


function manageGet(){
	if(isset($_GET['id'])){
		$id = $_GET['id'];
		$sql = "SELECT * FROM compra WHERE idaleatorio='$id'";
		echo executeQuery($sql);
	} else {
		$sql = "SELECT * FROM compra";
		echo executeQuery($sql);
	};
}


function managePost(){
	$nombre = $_POST['nombre'];
	$telefono = $_POST['telefono'];
	$total = $_POST['total'];
	$entregado = $_POST['entregado'];
	$notas = $_POST['notas'];
	$productos = $_POST['productos'];
	$idaleatorio = $_POST['idaleatorio'];
	$sql = "INSERT INTO `compra` (`idauto`, `nombre`, `telefono`, `total`, `entregado`, `notas`, `productos`, `idaleatorio`) VALUES (NULL, '$nombre', '$telefono', '$total', '$entregado', '$notas', '$productos', '$idaleatorio')";
	echo executeQuery($sql);
}


function managePut(){
	parse_str(file_get_contents('php://input'), $_PUT);
	$nombre = $_PUT['nombre'];
	$telefono = $_PUT['telefono'];
	$total = $_PUT['total'];
	$entregado = $_PUT['entregado'];
	$notas = $_PUT['notas'];
	$productos = $_PUT['productos'];
	$idaleatorio = $_PUT['idaleatorio'];
	$sql = "UPDATE `compra` SET `nombre` = '$nombre', `telefono` = '$telefono', `total` = '$total', `entregado` = '$entregado', `notas` = '$notas', `productos` = '$productos' WHERE `compra`.`idaleatorio` = $idaleatorio";
	echo executeQuery($sql);
}



function manageDelete(){
	parse_str(file_get_contents('php://input'), $_DELETE);
	$id = $_DELETE['id'];
	$sql = "DELETE FROM compra WHERE idaleatorio='$id'";
	echo executeQuery($sql);
}