<?php
/* ********************************** */
/* **********  FILE UPLOADER  *********** */
/* ********************************** */
require "../common.php";

/* api rest switch */
switch ($method) {
	case 'POST':
		createImage();
		break;
	case 'DELETE':
		deleteImage();
		break;
	default:
		http_response_code(400);
		echo json_encode(array("error" => "Invalid request"));
		break;
}


function createImage(){

	/* get image from POST */
	$image = $_FILES['image'];
	$image_name = $image['name'];
	$image_tmp_name = $image['tmp_name'];

	/* get image extension from post image */
	$image_ext = explode('.', $image_name);
	$image_ext = strtolower(end($image_ext));

	/* new random name */
	$image_new_name = uniqid() . uniqid() . $image_ext;

	/* move image to target directory */
	$target_file = getImagesDirectory() . $image_new_name;

	if(move_uploaded_file($image_tmp_name, $target_file)){
		http_response_code(200);
		print json_encode(array("image" => $image_new_name));
	}else{
		http_response_code(500);
		print json_encode(array("error" => "Error uploading image"));
	}
}





function deleteImage(){
	parse_str(file_get_contents('php://input'), $_DELETE);
	$image_name = $_DELETE['imagename'];
	$targetFile= getImagesDirectory() . $image_name;
	if( unlink( $targetFile ) ){
		http_response_code(200);
		print json_encode(array("image" => $image_name));
	}else{
		http_response_code(500);
		print json_encode(array("error" => "Error deleting image"));
	}
}
