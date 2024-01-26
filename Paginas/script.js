// script.js
$(document).ready(function() {
    actualizarSaldo();
});

function actualizarSaldo() {
    $.ajax({
        url: '10 Consultar saldo.php', // Ruta al script que obtiene el saldo actualizado
        type: 'GET',
        success: function(response) {
            $('#saldo').text('Saldo Actual: $ ' + response);
        },
        error: function(error) {
            console.error('Error al actualizar el saldo: ', error);
        }
    });
}
