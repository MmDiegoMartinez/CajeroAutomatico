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
    <?php echo "<font color='black' face='Courier New' size=5>Hola $_SESSION[nombre]  $_SESSION[apellido] </font>" ?>
   
    
    <div class="contenedor3">
    <div class="parte">Consultar Saldo<br><br>
            <div class="contenedor4"><a href="10 Consultar saldo.php"><img src="../img/Consultar.png" width="100"></a></div>
        </div>
        <div class="parte">Depositar<br><br>
            <div class="contenedor4"><a href="3 Depositar.php"><img src="../img/Depositar.png" width="100"></a></div>
        </div>
        <div class="parte">Transferir<br><br>
            <div class="contenedor4"><a href="5 Transferir.php"><img src="../img/Transferir.png" width="100"></a></div>
        </div>
        <div class="parte">Retirar<br><br>
        <div class="contenedor4"><a href="7 Retirar.php"><img src="../img/retirar.png" width="100"></a></div>
        </div>
        <div class="parte">Cambiar NIP<br><br>
        <div class="contenedor4"><a href="9 Actualizar NIP.php"><img src="../img/NIP.png" width="100"></a></div>
        </div>
        <div class="parte">Cerrar sesión<br><br>
        <div class="contenedor4"><a href="cerrarSesion.php"><img src="../img/ingresar.png" width="100"></a></div>
        </div>
    </div>
  
    <<footer>
        <p><br><br><br><br>© 2023 BBVA México, S.A., Institución de Banca Múltiple, Grupo Financiero BBVA México. Avenida Paseo de la Reforma 510, colonia Juárez, código postal 06600, alcaldía Cuauhtémoc, Ciudad de México.</p>
        <a href="#"><img src="..//img/BBVA2.png" width="160" height="56" ></a>
    </footer>



</body>

</html>