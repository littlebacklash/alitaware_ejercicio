function loadScript(src,callback){
	var script = document.createElement("script");
	script.type = "text/javascript";
	if(callback)script.onload=callback;
	document.getElementsByTagName("head")[0].appendChild(script);
	script.src = src;
}

function initialize() {
	var mapOptions = {
			zoom: 4,
			center: new google.maps.LatLng(-38.4530342,-63.5989206),
			mapTypeId: google.maps.MapTypeId.ROADMAP
		};
	map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
}
	  
function addMarker(coor_lat, coor_lng, info) {
	var lat = parseFloat(coor_lat);
	var lng = parseFloat(coor_lng);
	var myLatlng = new google.maps.LatLng(lat, lng);
	var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: "Coordenadas: " + lat + " , " + lng + " | Provincia: " + info
		});
	marcador_usuario = marker;
}

function showLastConnection(){
	if(window.marcador_usuario!==undefined){
		window.marcador_usuario.setMap(null);
	}
	
	$('#error_message').empty();
	$('#map_title').empty();
	let user = $('input[name=usuario]').val();
	let user_name = $('input[name=sug_usuario').val();
	if($.trim(user).length <= 0 || $.trim(user_name).length <= 0){
		console.log('seleccione un usuario');
		$('#error_message').html('Seleccione un usuario');
		return false;
	}
	
	$.ajax({
            type: "POST",
            url: "./services/service_controller.php",
            data: "accion=ubicacion_usuario&id_usuario="+user,
            dataType: "JSON",
            beforeSend: function(data){
                $('#overlay').removeClass('hidden');
            },
            success: function(res){
                if(res.success){
					let json = JSON.parse(res.data.ubicacion);
					$('#map_title').html(json.ubicacion.provincia.nombre);
					addMarker(res.data.latitud, res.data.longitud, json.ubicacion.provincia.nombre);
					
                }else{
					$('#error_message').html(res.error);
				}
				$('#overlay').addClass('hidden');
            }
	});
	
}


function showUsuarios(elem,equipo){
	$('#error_message').empty();
	let ul = $(elem).next();
	
	$.ajax({
            type: "POST",
            url: "./services/service_controller.php",
            data: "accion=usuarios_equipo&id_equipo="+equipo,
            dataType: "JSON",
            beforeSend: function(data){
                $('#overlay').removeClass('hidden');
            },
            success: function(res){
                if(res.success){
                    console.log(res);
                    if(res.data.length>0){
						let cnt = res.data.map(user => '<li>'+user.nombre+' '+user.apellido+'</li>');
						ul.html(cnt);
                    }else{
                        ul.html('No se encontraron usuarios');
                    }
					ul.toggleClass('hidden');
                }else{
					$('#error_message').html(res.error);
				}
				$('#overlay').addClass('hidden');
            }
	});
}
