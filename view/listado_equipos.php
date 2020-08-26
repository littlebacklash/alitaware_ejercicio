<h4 class="mt-5">Listado de Equipos</h4>
<hr>
<div class="text-danger text-left mt-2" id="error_message"></div>	
<div class="mt-2 text-left list-group">
	<?php
		if($pagos_equipos['success']){
			while($row = mysqli_fetch_assoc($pagos_equipos['result'])){?>
				<div class="list-group-item text-left btn" onclick="showUsuarios(this,'<?php echo $row['id_equipo']; ?>');"> 
					<?php echo $row['nombre_equipo'].' - '.$row['nombre'].' '.$row['apellido'].' ['.utf8_encode($row['servicios']).']';?>
				</div>
				<ul class="hidden"></ul>
				<?php
			}
		}else{
			?><div class="text-danger"><?php echo $pagos_equipos['error']; ?></div><?php
		}
	?>
</div>


