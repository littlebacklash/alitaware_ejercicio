<h4 class="mt-5">&Uacute;ltima ubicaci&oacute;n de utilizaci&oacute;n</h4>
<hr>

<div>
	<div class="mt-2 text-left">
		<div class="col-md-5">
			<label>Usuario</label>
			<input name="sug_usuario" size="30" class="form-control"/>
			<input name="usuario" type="hidden"/>
		</div>
		<div class=" col-md-2">
			<button type="button" class="btn btn-primary btn-sm mt-3" onclick="showLastConnection();">Mostrar Posicion</button>
		</div>	
	</div>
	<div class="text-danger text-left mt-2" id="error_message"></div>	
</div>

<h4 id="map_title" class="text-right mt-5"></h4>
<div id="map_canvas" class="mt-1 mb-5" style="height:500px"></div>

<script type="text/javascript">
	var marcador_usuario;
	
	jQuery(document).ready(function(){		
			loadScript('http://maps.googleapis.com/maps/api/js?v=3&sensor=false&callback=initialize', function(){});
			$('input[name=sug_usuario]').autocomplete(
					{
						source: usuarios,
						select: function(event, ui){
							$('input[name=usuario]').val(ui.item.id_usuario);
						}
					}
				);
		}
	);
</script>
<?php
	if(isset($script)){
		echo $script;
	}
?>