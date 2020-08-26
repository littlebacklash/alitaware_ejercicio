<?php
	require_once '../init.php';
	
	$action = isset($_REQUEST['accion']) ? $_REQUEST['accion'] : '';	
	$response = array();
	
	switch($action) {
		case "ubicacion_usuario":
			$response['success'] = false;
			if(isset($_REQUEST['id_usuario'])){
				$id_usuario = $_REQUEST['id_usuario'];
				$res = get_ultima_conexion_usuario($id_usuario);
				$response['success'] = $res['success'];
				if($res['success']){
					$response['data'] = $res['result'];
				}else{
					$response['error'] = $res['error'];
				}
			}else{
				$response['error'] = 'El ID de usuario es requerido';
			}
			break;
		case "usuarios_equipo":
			$response['success'] = false;
			$usuarios = [];
			if(isset($_REQUEST['id_equipo'])){
				$id_equipo = $_REQUEST['id_equipo'];
				$res = get_ususarios_equipo($id_equipo);
				$response['success'] = $res['success'];
				if($res['success']){
					if(mysqli_num_rows($res['result'])>0){
						while($row=mysqli_fetch_assoc($res['result'])){
							$usuarios[] = array('id_usuario'=>$row['id_usuario'], 'nombre'=>$row['nombre'], 'apellido'=>$row['apellido']);
						}
					}
					$response['data'] = $usuarios;
				}else{
					$response['error'] = $res['error'];
				}
			}else{
				$response['error'] = 'El ID de equipo es requerido';
			}
			break;
		default:
			$response = array();
	}
	
	echo json_encode($response);

?>