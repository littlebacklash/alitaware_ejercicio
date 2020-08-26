<h4 class="mt-5">Diagrama de Base de Datos</h4>
<hr>
<div class="container mb-5">
	<img src="./assets/diagrama_bd.png" alt="img" class="mb-2"/>
	<p class="text-justify">
		Se parte de crear las entidades Usuario y Servicio, ejes del modelo. Un usuario puede estar suscripto a uno o mas servicios, por lo cual se modela una relación n a n y surge la tabla intermedia Suscripción, en la que se almacenan los identificadores tanto del usuario, como del servicio, y la fecha a partir de la que se registró esa suscripción.
		Cada servicio tendrá configurados su/s precio/s por suscripcion (relacion 1 a n) en la entidad Precio_Suscripcion, en donde se especificará el valor de éste y los intervalos de personas para los que aplica (campos min_usuarios, max_usuarios). 
		A su vez, como un usuario puede formar un equipo, se modela la entidad Equipo, que contendrá el identificador del usuario creador, un nombre y cantidad de miembros. Colocar el id del usuario creador en esta tabla permite que a futuro un usuario pueda crear mas de un equipo.
		La relación de los usuarios y los equipos a los que pertenecen se modela a traves de la tabla Usuario_Equipo (relacion n a n) en donde se colocan el id_usuario y el id_equipo.

	</p>
	<p class="text-justify">
		Si bien el campo cant_miembros en la tabla Equipo no respeta la tercera forma normal de la BD ya que es un valor calculable, a medida que el volumen de datos crezca, el costo de calcular ese dato sera cada vez mayor. Mientras que tenerlo presente en la tabla agiliza el calculo del precio final que pagaria un usuario por los servicios a los que se suscribe con su equipo.
		Los pagos de servicio se modelan mediante la entidad Pago. Un usuario puede tener varios pagos hechos en su haber, por lo que se modela una relacion 1 a n colocando el id_usuario en Pago. Se consignan datos como el total abonado, periodo y fecha. A su vez, un pago esta compuesto por el detalle de pago para cada servicio. Se modela la relacion 1 a n con la tabla Pago_Detalle, en la que se consigna el precio pagado por un servicio y de qué servicio se trata (relacion 1 a 1 con la tabla Servicio).
		Los ids de cada entidad se configuran como clave primaria, y los ids que representan relaciones como foreign keys, indexados
	</p>
	<h5 class="mt-5">Datos de Latitud y Longitud</h5>
	<hr>
	<p class="text-justify">
		Para almacenar los datos de latitud y longitud de cada usuario y poder determinar el lugar desde donde utiliz&oacute; por &uacute;ltima vez el sistema se crea la tabla Historial_Conexion, en la cual se almacenan la latitud, longitud, fecha y hora para cada usuario (se agrega una foreign key apuntando a la tabla Usuario)
	</p>
</div>