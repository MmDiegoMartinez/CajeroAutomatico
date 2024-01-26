<?php
session_start();
if (!isset($_SESSION['usuario'])) {
    header("Location: http://localhost/Cajero/Paginas/1%20Credenciales.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel='stylesheet' type='text/css' href='../css.css'>
    <title>welcome</title>
</head>
<body>
    <nav>
        <h1><img src="..//img/BBVA2.png" width="80"> Bancomer</h1>
        <ul>
            <li><a href="#">ㅤ</a></li>
        </ul>
    </nav>
	<center>
	<?php
	include_once("conexion.php");
	require("conexion.php");

	$numcuenteDes = $_POST["cuenta"];
	$numcuenteRemi = $_SESSION['numcuenta'];
	$saldoRemitente = $_SESSION['saldo']; //saldo del remitente
	$dinero = $_POST["monto"];
	$tipoMovimiento = 'Transferencia';

	try {
    	$conexion->beginTransaction();

    	// Verificar si la cuenta de destino existe
    	$stmtVerificarCuenta = $conexion->prepare("SELECT Id_Cuenta FROM Cuentas WHERE Id_Cuenta = :cuentaDestinatario");
    	$stmtVerificarCuenta->bindParam(':cuentaDestinatario', $numcuenteDes, PDO::PARAM_STR);
    	$stmtVerificarCuenta->execute();
    	$cuentaDestinatarioExistente = $stmtVerificarCuenta->fetch();

    	if ($cuentaDestinatarioExistente) {
        	if ($saldoRemitente >= $dinero && $dinero >= 0.1) {
				
            	// Actualiza saldo del remitente
            	$sqlRemitente = "UPDATE Cuentas SET Saldo = Saldo - :montoRemitente WHERE Id_Cuenta = :cuentaRemitente";
            	$stmtRemitente = $conexion->prepare($sqlRemitente);
            	$stmtRemitente->bindParam(':montoRemitente', $dinero, PDO::PARAM_STR);
            	$stmtRemitente->bindParam(':cuentaRemitente', $numcuenteRemi, PDO::PARAM_STR);
            	$stmtRemitente->execute();

            	// Actualiza saldo del destinatario
            	$sqlDestinatario = "UPDATE Cuentas SET Saldo = Saldo + :montoDestinatario WHERE Id_Cuenta = :cuentaDestinatario";
            	$stmtDestinatario = $conexion->prepare($sqlDestinatario);
            	$stmtDestinatario->bindParam(':montoDestinatario', $dinero, PDO::PARAM_STR);
            	$stmtDestinatario->bindParam(':cuentaDestinatario', $numcuenteDes, PDO::PARAM_STR);
            	$stmtDestinatario->execute();

            	$_SESSION['saldo'] -= $dinero;

				// Insertar en la tabla Transacciones
            	// Prepara la consulta de inserción en la tabla Transacciones			
            	$sqlInsertTransaccion = "INSERT INTO Transacciones (Id_Cuenta, Tipo_Movimiento, Monto) VALUES (:idCuenta, :tipoMovimiento, :monto)";
            	$stmtInsertTransaccion = $conexion->prepare($sqlInsertTransaccion);
            	// Enlaza los parámetros                       
            	$stmtInsertTransaccion->bindParam(':idCuenta', $numcuenteRemi, PDO::PARAM_STR);
            	$stmtInsertTransaccion->bindParam(':tipoMovimiento', $tipoMovimiento, PDO::PARAM_STR);
            	$stmtInsertTransaccion->bindParam(':monto', $dinero, PDO::PARAM_STR);
            	// Ejecuta la consulta de inserción
            	$stmtInsertTransaccion->execute();

            	echo "Transferencia exitosa";
            	echo "\nSaldo restante: $ " . number_format($_SESSION['saldo'], 2);

				

            	$conexion->commit();
        	} else {
            	echo "La transferencia no pudo realizarse. Verifica el saldo y el monto a transferir.";
        	}
    	} else {
        	echo "La cuenta de destino no existe. Por favor, verifica el número de cuenta.";
    	}
	} catch (PDOException $e) {
    	$conexion->rollBack();
    	echo "Error en la transacción: " . $e->getMessage();
	}
?>
<br><br>
		<a href="2 Menu Principal.php"><input class="bontons" type="button" value="Menu"> </input></a><br>
		<img src="../img/Billetes.png" width="200"></img>
	</center>
	<footer>
		   
  
	<p><br><br><br><br>© 2023 BBVA México, S.A., Institución de Banca Múltiple, Grupo Financiero BBVA México. Avenida Paseo de la Reforma 510, colonia Juárez, código postal 06600, alcaldía Cuauhtémoc, Ciudad de México.</p>
        
        <a href="#"><img src="..//img/BBVA2.png" width="160" height="56" ></a>
	</footer>
</body>

</html>