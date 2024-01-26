<?php
    session_start();
    if(!isset($_SESSION['usuario'])){
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
        $numcuente = $_SESSION['numcuenta'];
        $dinero = $_POST["monto"];
        $tipoMovimiento = 'Retiro';

        // Verificar si el saldo es mayor que cero y la cantidad a retirar es menor o igual al saldo
        if ($_SESSION['saldo'] > 0 && $dinero <= $_SESSION['saldo']) {
            try {
                $conexion->beginTransaction();
                $sql = "UPDATE Cuentas SET Saldo = Saldo - :monto WHERE Id_Cuenta = :cuenta";
                $stmt = $conexion->prepare($sql);
                $stmt->bindParam(':monto', $dinero, PDO::PARAM_STR);
                $stmt->bindParam(':cuenta', $numcuente, PDO::PARAM_STR);
                $stmt->execute();
                // Actualizamos el saldo en la sesión
                $_SESSION['saldo'] = $_SESSION['saldo'] - $dinero;

                // Insertar en la tabla Transacciones
            	// Prepara la consulta de inserción en la tabla Transacciones			
            	$sqlInsertTransaccion = "INSERT INTO Transacciones (Id_Cuenta, Tipo_Movimiento, Monto) VALUES (:idCuenta, :tipoMovimiento, :monto)";
            	$stmtInsertTransaccion = $conexion->prepare($sqlInsertTransaccion);
            	// Enlaza los parámetros                       
            	$stmtInsertTransaccion->bindParam(':idCuenta', $numcuente, PDO::PARAM_STR);
            	$stmtInsertTransaccion->bindParam(':tipoMovimiento', $tipoMovimiento, PDO::PARAM_STR);
            	$stmtInsertTransaccion->bindParam(':monto', $dinero, PDO::PARAM_STR);
            	// Ejecuta la consulta de inserción
            	$stmtInsertTransaccion->execute();

                // Si llegamos aquí la transacción se realiza correctamente
                $conexion->commit();
                echo "Retiro exitoso<br>";
                echo "Saldo Actual: $ " . number_format($_SESSION['saldo'], 2);

            } catch (PDOException $e) {
                // Si hay algún error, realizamos un rollback para deshacer los cambios
                $conexion->rollBack();

                echo "Error en la transacción: " . $e->getMessage();
            }
        } else {
            echo "La cantidad a retirar es mayor que el saldo disponible o el saldo es insuficiente.";
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