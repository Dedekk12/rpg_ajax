<?php
require_once(__DIR__ . "/../../util/Config.php");
require_once(__DIR__ . "/../../controller/PersonagemControll.php");


$persoCtrl = new PersonagemControll();

$dados = $persoCtrl->listar();


print_r($dados);
include_once(__DIR__ . "/../include/header.php");
?>




<?php
include_once(__DIR__ . "/../include/footer.php");
?>