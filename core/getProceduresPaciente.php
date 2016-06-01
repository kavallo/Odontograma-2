<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$historia = isset( $_POST['historia'] ) ? $_POST['historia'] : '';

	if( $historia!= '' ){

		$sql = "SELECT pp.Diente, pp.Zone, pp.Procedure, pp.Tipe, i.resource, i.Representacion, i.Codigo, i.Nombre, pp.Id
				FROM pacienteprocedures pp, items i
				WHERE  pp.Procedure = i.Id AND pp.Historia = '$historia'";

		$result = BuscarDatos( $sql );

		echo json_encode( $result );
	
	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>