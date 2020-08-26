<?php

$action = isset($_REQUEST['action']) ? $_REQUEST['action'] : "";
$template = "view/template.php";


switch($action) {
	case "diagrama_bd":
		$page = "view/diagrama_bd.php";
		break;
	case "form_ubicacion":
		$usuarios = get_usuarios();
		if($usuarios['success']){
			while($row = mysqli_fetch_assoc($usuarios['result'])){
				$a['label'] = $row['nombre'].' '.$row['apellido'];
				$a['id_usuario'] = $row['id_usuario'];
				$ar_usuarios[] = $a;
			}
		}
		$script  = "<script>";
		$script .=      'var usuarios = '.json_encode($ar_usuarios).';';
		$script .= "</script>";
		$page = "view/form_ubicacion.php";
		break;
	case "listado_equipos":
		$pagos_equipos = get_pagos_equipos();
		$page = "view/listado_equipos.php";
		break;
	default:
		$page = "view/landing.php";
}

include_once($template);

?>