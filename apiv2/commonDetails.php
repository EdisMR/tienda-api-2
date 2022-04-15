<?php
/* ******************************* */
/* ********  API DE LA TIENDA  ******** */
/* ******************************* */

function getDBDetails(){
	return mysqli_connect(
		'localhost',/* Host */
		"root",/* User */
		'',/* Password */
		"tienda"/* DB */
	);
}

