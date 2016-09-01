# erudio
erudio é um software livre de gestão escolar. Foi desenvolvido originalmente pela Secretaria Municipal de Educação de Itajaí-SC e disponibilizado como Software Livre.

# requisitos
O erudio requer:
* um servidor web
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
	`RestangularProCrie o banco de dados ao qual o Erudio usará para armazenar os dados
   inseridos através da interface web. Os passos descritos nessa seção irão
   criar:vider.setBaseUrl('http://meu-endereco-teste.br/erudio/servicos/web/app.php/api');`<br /><br />
	
	Para o serviço de mapas funcionar corretamente uma chave do *Google Maps API* deve ser criada acessando o
	website [https://developers.google.com/maps/documentation/javascript/get-api-key](https://developers.google.com/maps/documentation/javascript/get-api-key)<br />
	Esta chave deve ser inserida no arquivo **index.html** que está localizado em **/caminho-da-raiz-web/erudio/index.html**<br />
	Edite a linha que se refere ao Google Maps API atribuindo a sua chave ao valor da variável key.<br />
	`<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3.exp&key=INSIRA_SUA_CHAVE_AQUI"></script>`<br /><br />
	
2. **Crie o Banco de Dados** <br />
	Crie o banco de dados ao qual o Erudio usará para armazenar os dados inseridos através da interface web.<br />
	Os passos descritos nessa seção irão criar:
		* Um usuário admin no servidor MySQL com a senha de acesso admin;
		* Um banco de dados erudio.
		
	Faça login no servidor de banco de dados MySQL:
	`$ mysql -uUSUARIO_DO_BD -pSENHA_DO_BD`<br /><br />
	
	Execute o arquivo erudio.sql que está contido no pacote Erudio. O diretório em que esse arquivo reside é o misc/database.
	`mysql> source /caminho-da-raiz-web/erudio/misc/database/erudio.sql`<br /><br />
	
	Este procedimento irá criar o banco de dados "erudio" e todas as devidas tabelas.<br />
	Para agendador de solicitação de vagas funcionar, é precisa ativar o *Event Scheduler* do MySQL.<br />
	Ainda com o terminal do MySQL ativo execute o comando:<br />
	`mysql> set global event_scheduler = 1;`<br /><br />
	
	Após ativar o *Event Scheduler* é preciso criar o evento que ajusta as solicitações de vaga, ainda com o terminal do MySQL ativo execute o comando:<br />
	`mysql> CREATE EVENT atualiza_status_solicitacao_vaga`
		`ON SCHEDULE`
		`EVERY 1 DAY`
		`STARTS DATE_ADD(CURDATE(), INTERVAL '00:00:00' HOUR_SECOND)`
		`COMMENT 'Verifica e atualiza os status da solicitação de vagas'`
		`DO`
		`UPDATE edu_solicitacao_vaga`
		`SET status = 'EXPIRADO'`
		`WHERE data_expiracao < CURDATE()`
		`AND status = 'ATIVO'`
		`AND ativo = 1 ;`<br /><br />
	
	Encerre o console MySQL.
	`mysql> exit`<br /><br />

3. Edite o Arquivo de Configuração e Ajuste Permissões de Escrita
	O Erudio armazena as configurações necessárias para a aplicação em um arquivo chamado parameters.yml.<br />
	Altere as configurações neste arquivo para conectar ao seu servidor MySQL.<br />
	**Importante:** Ao instalar o *Composer* a configuração do *Serializer* é anulada, você deve inserir a ultima linha de configuração conforme abaixo:
	**As configurações de servidor estão armazenadas em /caminho-da-raiz-web/erudio/servicos/app/config/parameters.yml**<br />
	`parameters:`<br />
		`database_host: localhost`<br />
		`database_port: 3306`<br />
		`database_name: erudio`<br />
		`database_user: erudio ### Alterar para seu usuário do MySQL`<br />
		`database_password: erudio ### Alterar para a senha do seu usuário do MySQL`<br />
		`unix_socket: /tmp/mysql.sock`<br />
		`mailer_transport: gmail ### Alterar para seu servidor de e-mail`<br />
		`mailer_host: ~`<br />
		`mailer_user: erudio ### Alterar para seu usuário de e-mail`<br />
		`mailer_password: erudio ### Alterar para senha do seu usuário de e-mail`<br />
		`locale: pt_BR`<br />
		`secret: 'erudio'`<br />
		`jms_serializer.camel_case_naming_strategy.class: JMS\Serializer\Naming\IdenticalPropertyNamingStrategy ### Esta` `Linha ###`<br /><br />
	
	Depois, conceda permissões de escrita nos diretórios *servicos/app/cache* e *servicos/app/logs*.
	`$ cd /var/www/erudio/servicos/app`<br />
	`$ chmod -R 777 cache logs`<br /><br />
	
4. Configure o servidor web(Neste caso, Apache).
	O arquivo *.htaccess* localizado no diretório raiz da aplicação, contém diretivas de configuração do servidor Apache.<br />
	Para que esse arquivo seja executado a cada requisição, é necessário configurar o Apache para que este execute os arquivos *.htaccess*, habiliando o módulo **mod_rewrite**.<br />
	É necessária a edição do arquivo de configuração de Apache, a localização deste arquivo pode mudar dependendo da distribuição Linux utilizada.<br />
	
	Debian-based Distros: `/etc/apache2/site-available/default`<br />
	Fedora-based Distros: `/etc/httpd/conf/httpd.conf`<br /><br />
	
	A única diretiva a ser alterada é AllowOverride para All:<br />
	
	`<Directory /caminho-da-raiz-web/>`<br />
		`Options Indexes FollowSymLinks MultiViews`<br />
		`AllowOverride All`<br />
		`Order allow,deny`<br />
		`allow from all`<br />
	`</Directory>`<br /><br />

5. Acesse o erudio
	Abra o navegador de sua preferência e acesse o endereço *http://SEU_SERVIDOR/erudio*.<br />
	Faça o login na aplicação utilizando o usuário *administrador*.<br />
   	O login e senha para acesso são admin e admin, respectivamente.<br />

6. Fonte
	[https://ctima.itajai.sc.gov.br](https://ctima.itajai.sc.gov.br)

7. Documentação
	O modelo entidade-relacionamento encontra-se neste pacote na pasta *misc/documentação*.

8. Licença
	O Erudio é um software livre e licenciado pela Creative Commons Licença Pública Geral versão 2 traduzida (CC GNU/GPL 2). Uma cópia da licença está incluida nesta distribuição no arquivo LICENSE-pt_BR.txt.
