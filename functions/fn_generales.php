<?php
    function db_connect(){
        global $maindb;
        // Main database
        $dbhost = DB_HOST;
		$dbuname = DB_USER;
		$dbpass = DB_PASSWORD;
		$dbname = DB_NAME;
        
        $maindb = mysqli_connect($dbhost, $dbuname, $dbpass,$dbname);
        if (mysqli_connect_errno($maindb)) {
            echo "Error al conectar a MySQL: " . mysqli_connect_error();
            exit();
        }
        
		if ($maindb){
            return true;
        }
        else {
            return false;	
        }
    }
	
	function get_usuarios(){
		global $maindb;
		$success = true;
        $error = '';
		$sql = "select u.id_usuario, u.nombre, u.apellido
				from usuario u ";
        $res = mysqli_query($maindb, $sql);
        if (mysqli_error($maindb)) {
            $success = false;
            $error = mysqli_error($maindb);
        }
        return array('success' => $success,
                     'result' => $res,
                     'error' => strlen($error)>0 ? $error : '');
	}
	
	function get_ultima_conexion_usuario($id_usuario){
		global $maindb;
		$success = true;
		$data = array();
        $error = '';
		$sql = "select id_usuario, latitud, longitud, fecha_hora
				from historial_conexion
				where id_usuario='".mysqli_real_escape_string($maindb, $id_usuario)."'
				order by fecha_hora desc
				limit 1";
        $res = mysqli_query($maindb, $sql);
        if (mysqli_error($maindb)) {
            $success = false;
            $error = mysqli_error($maindb);
        }
		if(mysqli_num_rows($res)>0){
			$row = mysqli_fetch_assoc($res);
			$info = get_datos_ubicacion($row['latitud'], $row['longitud']);
			if(strlen($info['errmsg'])==0){
				$data['id_usuario'] = $row['id_usuario']; 
				$data['latitud'] = $row['latitud'];
				$data['longitud'] = $row['longitud'];
				$data['fecha_hora'] = $row['fecha_hora'];
				$data['ubicacion'] = $info['content'];
			}else{
				$error = $info['errmsg'];
			}
		}else{
			$success = false;
			$error = 'No hay registros de conexion del usuario';
		}
		
        return array('success' => $success,
                     'result' => $data,
                     'error' => strlen($error)>0 ? $error : '');
	}
	
	function get_pagos_equipos(){
		global $maindb;
		$success = true;
        $error = '';
		$sql = "select e.id_equipo, u.id_usuario, e.nombre nombre_equipo, 
					   u.nombre, u.apellido, GROUP_CONCAT(s.nombre SEPARATOR ' - ') servicios
				from equipo e
				join usuario u on e.id_usuario=u.id_usuario
				join pago p on u.id_usuario=p.id_usuario
				join suscripcion susc on u.id_usuario=susc.id_usuario
				join servicio s on susc.id_servicio=s.id_servicio
				group by e.id_equipo";
        $res = mysqli_query($maindb, $sql);
        if (mysqli_error($maindb)) {
            $success = false;
            $error = mysqli_error($maindb);
        }
        return array('success' => $success,
                     'result' => $res,
                     'error' => strlen($error)>0 ? $error : '');
	}
	
	function get_ususarios_equipo($id_equipo){
		global $maindb;
		$success = true;
        $error = '';
		$sql = "select u.id_usuario, u.nombre, u.apellido
				from usuario_equipo ue
				join usuario u on ue.id_usuario=u.id_usuario
				where ue.id_equipo='".mysqli_real_escape_string($maindb, $id_equipo)."'";
        $res = mysqli_query($maindb, $sql);
        if (mysqli_error($maindb)) {
            $success = false;
            $error = mysqli_error($maindb);
        }
        return array('success' => $success,
                     'result' => $res,
                     'error' => strlen($error)>0 ? $error : '');
	}
	
	function get_datos_ubicacion($lat, $lon){
		$ch = curl_init();
        $headers = array('Accept: application/x-www-form-urlencoded',
                         'Content-Type: application/json'
                        );
        $url = "https://apis.datos.gob.ar/georef/api/ubicacion?lat=".$lat."&lon=".$lon;
        
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "GET"); 
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        // Timeout in seconds
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);

        $response = curl_exec($ch);
		$err     = curl_errno( $ch );
        $errmsg  = curl_error( $ch );
        //$header  = curl_getinfo( $ch );
        curl_close( $ch );

        $header['errno']   = $err;
        $header['errmsg']  = $errmsg;
        $header['content'] = $response;
		return $header;
		
		/*
		print_r($json_ubicacion);
        $provincia = $json_ubicacion->ubicacion->provincia->nombre;
		echo 'Provincia: '.$provincia;
		echo '  <br>Lat: '.$json_ubicacion->ubicacion->lat;
		echo '  <br>Lon: '.$json_ubicacion->ubicacion->lon;*/
	}
	
	
?>