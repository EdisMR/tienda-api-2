<?php

require "commonDetails.php";
/* Header to create a rest api */
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Max-Age: 3600");

$method = $_SERVER['REQUEST_METHOD'];

$conn = getDBDetails();

function getImagesDirectory(){
	return "../../images/";
}


/* Execute a sql query and format as JSON output, manage errors */
function executeQuery($sql) {
	$conn = getDBDetails();
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$rows = array();
		while ($row = $result->fetch_assoc()) {
			$rows[] = $row;
		}
		header("Content-Type: application/json; charset=UTF-8");
		http_response_code(200);
		return json_encode($rows);
	} else {
		http_response_code(400);
		return json_encode(array("error" => "No results found"));
	}
}
