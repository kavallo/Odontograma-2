<?php

	if( !isset($PATH) ){//verifico si existe la variable con la ruta absoluta
		include_once("./PATH.php");				
	}//se realiza con ruta absoluta devido a que asi funciona correctamente el require_once

	include_once($PATH."/conexion.php");
	include_once($PATH."/mesages.php");

	$paciente 			= isset( $_POST['paciente'] ) ? $_POST['paciente'] : '';
	$cita 				= isset( $_POST['cita'] ) 	  ? $_POST['cita'] : '';
	$option 			= isset( $_POST['option'] )   ? $_POST['option'] : '';


	if( $paciente != '' && $cita != '' ){
		
		if( $option == 1 ){

			$sql = "
					SELECT 
						CONCAT(p.Tipoid,' - ',p.Id) AS Identificacion,	
						p.Nombres,
						p.Apellidos,
						p.Edad,
						p.Sexo,
						CONCAT(p.Telefono,' - ', p.Celular) AS Telefonos,
						p.Direccion,
						p.Ocupacion,
						p.EstadoCivil,
						p.Municipio,
						p.FechaNacimiento,
						p.Responsable,
						p.TelResponsable,
						tp.Nombre AS tipoPaciente,
						e.Nombre AS pacienteEps,
						i.Nombre AS pacienteIps,
						mc.Motivo AS motivoSimple,
						mc.MotivoAmpliado,
						pa.Observacion AS antecedenteFamiliar
					FROM pacientes p, tipopacientes tp, eps e, ips i, motivosconsulta mc, pacienteantecedentes pa
					WHERE p.TipPaciente = tp.Id AND
							p.Ips = i.Id AND
							p.Eps = e.Id AND
							mc.Cita = '$cita' AND
							pa.Antecedente = 1 AND
							pa.Paciente = '$paciente' AND
							p.Id = '$paciente'
							LIMIT 1";

			
			$result = BuscarDatos( $sql );

			echo json_encode( $result );

		}else if( $option == 2 ){

			$sql = "SELECT MIN(h.FechaApertura) FROM historias h WHERE h.Paciente = '$paciente' GROUP BY h.Paciente ";

			$result = BuscarDatos( $sql );

			echo json_encode( $result );
		}

	}else{

		echo json_encode( $GLOBALS['resB4'] );

	}

?>