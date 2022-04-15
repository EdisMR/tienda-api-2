<?php
/* ********************************** */
/* ******  PRODUCT INFORMATION  ********* */
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
		$sql = "SELECT * FROM productos WHERE idaleatorio='$id'";
		echo executeQuery($sql);
	} else {
		$sql = "SELECT * FROM productos";
		echo executeQuery($sql);
	};
}





function managePost(){
	$idaleatorio = $_POST['idaleatorio'];
	$titulo = $_POST['titulo'];
	$descripcion = $_POST['descripcion'];
	$valor = $_POST['valor'];
	$cantidad = $_POST['cantidad'];
	$categoria = $_POST['categoria'];
	$imagenes = $_POST['imagenes'];
	$disponible= $_POST['disponible'];
	if($disponible == "true"){
		$disponible = 1;
	} else {
		$disponible = 0;
	}
	$sql="INSERT INTO `productos` (`idauto`, `idaleatorio`, `titulo`, `descripcion`, `valor`, `cantidad`, `categoria`, `imagenes`, `disponible`) VALUES (NULL, '$idaleatorio', '$titulo', '$descripcion', '$valor', '$cantidad', '$categoria', '$imagenes', '$disponible')";
	echo executeQuery($sql);
}





function managePut(){
	parse_str(file_get_contents('php://input'), $_PUT);
	$idaleatorio = $_PUT['idaleatorio'];
	$titulo = $_PUT['titulo'];
	$descripcion = $_PUT['descripcion'];
	$valor = $_PUT['valor'];
	$cantidad = $_PUT['cantidad'];
	$categoria = $_PUT['categoria'];
	$imagenes = $_PUT['imagenes'];
	$disponible= $_PUT['disponible'];
	if($disponible == "true"){
		$disponible = 1;
	} else {
		$disponible = 0;
	}
	$sql = "UPDATE `productos` SET `titulo` = '$titulo', `descripcion` = '$descripcion', `valor` = '$valor', `cantidad` = '$cantidad', `categoria` = '$categoria', `imagenes` = '$imagenes', `disponible` = '$disponible' WHERE `productos`.`idaleatorio` = '$idaleatorio'";
	echo executeQuery($sql);
}





function manageDelete(){
	parse_str(file_get_contents('php://input'), $_DELETE);
	$id = $_DELETE['id'];
	$sql = "DELETE FROM productos WHERE idaleatorio='$id'";
	echo executeQuery($sql);
}