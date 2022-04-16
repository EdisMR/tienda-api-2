<?php
/* ********************************** */
/* *********  MANAGE SESSION  *********** */
/* ********************************** */
require "../common.php";

/* api rest switch */
switch ($method) {
	case 'POST':
		managePost();
		break;
	case 'DELETE':
		closeSession();
		break;
	default:
		http_response_code(400);
		echo json_encode(array("error" => "Invalid request"));
		break;
}





function managePost()
{
	if (isset($_POST["submit"])) {
		validateUser();
	} else {
		getSession();
	}
}


function closeSession()
{
	session_start();
	// remove all session variables
	session_unset();

	// destroy the session
	session_destroy();
	echo json_encode(array("success" => "Session closed"));
}





function getSession()
{
	session_start();
	if (isset($_SESSION["user"])) {
		echo json_encode(array("success" => "Session opened", "user" => $_SESSION["user"]));
	} else {
		echo json_encode(array("error" => "Session not opened"));
	}
}





function validateUser()
{
	/* validate session from post input and format as json*/
	$usuario = $_POST["usuario"];
	$contrasenia = $_POST["contrasenia"];

	$query = mysqli_query($GLOBALS["conn"], "SELECT * FROM usuarios WHERE usuario = '$usuario' AND contrasenia = '$contrasenia'");

	// esto válida si la consulta se ejecuto correctamente o no
	// pero en ningún caso válida si devolvió algún registro
	if ($query) {
		if ($user = mysqli_fetch_assoc($query)) {
			// el usuario y la pwd son correctas
			session_start();
			$_SESSION["user"] = "$usuario";
			echo json_encode(array("success" => "Session opened", "user" => $user));
		} else {
			// Usuario incorrecto o no existe
			echo json_encode(array("error" => "Usuario o contraseña incorrectos"));
		}
	}
}
