<?php

//Mostrar erros PHP 
ini_set('display errors',1);
error_reporting(E_ALL);

//Configurações de servidor
define("DB_HOST","localhost");
define("DB_NAME","db_rpg");
define("DB_USER","root");
define("DB_PASSWORD", "bancodedados");

//Configurações de ambiente
define("AMB_DEV",true);

//Configuração de acesso
define("BASE_URL","");