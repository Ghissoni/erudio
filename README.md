# erudio
erudio é um software livre de gestão escolar. Foi desenvolvido originalmente pela Secretaria Municipal de Educação de Itajaí-SC e disponibilizado como Software Livre.

# requisitos
O erudio requer:
* um servidor web (sério mesmo?) :)
* PHP 5.4.6 ou superior
* MySQL 5.5.32 ou superior

O servidor web Apache 2 é recomendado mas qualquer outro com suporte a PHP pode ser utilizado.

# instalação
1. **Download do Software** <br />
Faça o download dos arquivos do sistema antes de prosseguir.<br />
A versão atual pode ser encontrada [clicando aqui](http://www.ctima.itajai.sc.gov.br).<br />
Descompacte o pacote no diretório raiz do seu servidor web.<br />
`$ cd /var/www/`<br />
`$ tar -xzvf /var/www/erudio-X.X.X.tar.gz`

  * *instalação via composer*<br />
  Faça o download do *Composer* no diretório */caminho-da-raiz-web/erudio/servicos*<br />
  Acesse [http://getcomposer.org/](http://getcomposer.org/) para instruções sobre a instalação do *Composer*<br />
  Após fazer o download do *Composer* o arquivo **composer.phar** será criado no diretório */caminho-da-raiz-web/erudio/servicos*<br />
  Execute o instalador do *Composer*:<br />
  `$ cd /var/www/erudio/servicos`<br />
  `$ php composer.phar install`<br /><br />
  
  A extensão php-xml deve ser instalada no servidor:<br />
  Debian-based Distros: `$ apt-get install php-xml`<br />
  Fedora-based Distros: `$ yum install php-xml`<br /><br />

  Configure a conexão do Front-end com o servidor de serviços, o diretório */caminho-da-raiz-web/erudio/servicos* contém o servidor de serviços.<br />
	As configurações de conexão do front-end com servidor de serviços estão armazenadas em dois arquivos:<br />
	`$ /caminho-da-raiz-web/erudio/app/modules/main/app/app.js`<br />
  `$ /caminho-da-raiz-web/erudio/app/modules/login/app/loginApp.js`<br /><br />
  
  Basta editar estes arquivos para que corresponda ao IP ou URL do seu servidor.<br />
	**Observação:** O *IP* ou *URL* do servidor a ser configurado deve ser acessível pelos clientes.<br />
	A configuração deve ser feita nesta linha:<br />
	`RestangularProvider.setBaseUrl('http://meu-endereco-teste.br/erudio/servicos/web/app.php/api');`<br /><br />
	
	Para o serviço de mapas funcionar corretamente uma chave do *Google Maps API* deve ser criada acessando o
	website [https://developers.google.com/maps/documentation/javascript/get-api-key](https://developers.google.com/maps/documentation/javascript/get-api-key)<br />
	Esta chave deve ser inserida no arquivo **index.html** que está localizado em **/caminho-da-raiz-web/erudio/index.html**<br />
	Edite a linha que se refere ao Google Maps API atribuindo a sua chave ao valor da variável key.<br />
	`<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.exp&key=INSIRA_SUA_CHAVE_AQUI"></script>`<br /><br />
	
	2. Crie o Banco de Dados
	
	
	
