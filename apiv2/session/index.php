<?php
/* ********************************** */
/* *********  MANAGE SESSION  *********** */
/* ********************************** */
require "../common.php";

/* validate session from post input using ajax */
if (isset($_POST['email']) && isset($_POST['password'])) {
	$email = $_POST['email'];
	$password = $_POST['password'];
	if (!empty($email) && !empty($password)) {
		$query = "SELECT * FROM usuarios WHERE usuario = :email AND contrasenia = :password";
		$query_params = array(':email' => $email, ':password' => $password);
		try {
			$stmt = $db->prepare($query);
			$result = $stmt->execute($query_params);
		} catch (PDOException $ex) {
			die("Failed to run query: " . $ex->getMessage());
		}
		$row = $stmt->fetch();
		if ($row) {
			session_start();
			$_SESSION['user_id'] = $row['user_id'];
			$_SESSION['email'] = $row['email'];
			$_SESSION['logged_in'] = true;
			echo json_encode(array('success' => true));
		} else {
			echo json_encode(array('error' => 'Email or password is incorrect'));
		}
	} else {
		echo json_encode(array('error' => 'Email or password is empty'));
	}
} else {
	echo json_encode(array('error' => 'Email or password is not set'));
}