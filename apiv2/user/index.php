<?php
/* ********************************** */
/* ********  USER VALIDATION  *********** */
/* ********************************** */
require "../common.php";

if($method == 'PUT'){

	if(isset($_PUT['user'])){
		editUser();
	}

	if(isset($_PUT['password'])){
		editPassword();
	}
}else{
	http_response_code(400);
	echo json_encode(array("error" => "Invalid request"));
}



function editUser(){
	parse_str(file_get_contents('php://input'), $_PUT);
	$user = $_PUT['user'];
	$pastUser = $_PUT['pastUser'];
	$sql = "UPDATE usuarios SET usuario='$user' WHERE usuario='$pastUser'";
	echo executeQuery($sql);
}


function editPassword(){
	parse_str(file_get_contents('php://input'), $_PUT);
	$user=$_PUT['user'];
	$newPassword=$_PUT['newPassword'];
	$sql = "UPDATE usuarios SET contrasenia='$newPassword' WHERE usuario='$user'";
	echo executeQuery($sql);
}