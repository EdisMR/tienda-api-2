<?php
/* SISTEMA DE LA TIENDA */

function getDBDetails(){
	return mysqli_connect(
		"localhost",/* Host */
		"id14123596_admined	",/* User */
		'X!|2lR#aT2m$l3Z6',/* Password */
		"id14123596_tienda"/* DB */
	);
}

