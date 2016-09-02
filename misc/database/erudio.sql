# Host: voldemort  (Version: 5.5.32-0ubuntu0.12.10.1-log)
# Date: 2016-09-01 15:54:18
# Generator: MySQL-Front 5.3  (Build 4.271)

/*!40101 SET NAMES latin1 */;

#
# Structure for table "edu_arquivo_pasta"
#

CREATE TABLE `edu_arquivo_pasta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `pasta_pai_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `arquivo_pasta_fk01` (`pasta_pai_id`),
  CONSTRAINT `arquivo_pasta_fk01` FOREIGN KEY (`pasta_pai_id`) REFERENCES `edu_arquivo_pasta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_arquivo_pasta"
#


#
# Structure for table "edu_arquivo"
#

CREATE TABLE `edu_arquivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL DEFAULT '',
  `nome_arquivo` varchar(255) NOT NULL DEFAULT '',
  `tipo` varchar(20) DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT '',
  `ativo` int(11) NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_modificacao` timestamp NULL DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `pasta_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasta_id` (`pasta_id`),
  CONSTRAINT `edu_arquivo_ibfk_1` FOREIGN KEY (`pasta_id`) REFERENCES `edu_arquivo_pasta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "edu_arquivo"
#


#
# Structure for table "edu_avaliacao_conceito"
#

CREATE TABLE `edu_avaliacao_conceito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `valor_min` varchar(255) NOT NULL,
  `valor_max` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_conceito"
#

REPLACE INTO `edu_avaliacao_conceito` VALUES (1,'D','D','10.00','10.00',1),(2,'ED','ED','8.00','9.00',1),(3,'PD','PD','6.00','7.00',1),(4,'ID','ID','4.00','5.00',1),(5,'ND','ND','2.00','3.00',1),(6,'HNT','HNT','0.00','0.00',1);

#
# Structure for table "edu_avaliacao_tipo"
#

CREATE TABLE `edu_avaliacao_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_tipo"
#


#
# Structure for table "edu_calendario_evento"
#

CREATE TABLE `edu_calendario_evento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `tipo` enum('ATIVIDADE_ESCOLAR','ATIVIDADE_ADMINISTRATIVA','INTERESSE_PUBLICO','FERIADO','RECESSO') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_evento"
#


#
# Structure for table "edu_cargo"
#

CREATE TABLE `edu_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `professor` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_cargo"
#

REPLACE INTO `edu_cargo` VALUES (1,'Professor',1,'2016-06-01 17:01:08','0000-00-00 00:00:00',NULL,1),(2,'Diretor',0,'2016-06-01 17:01:13','0000-00-00 00:00:00',NULL,1),(3,'Secretário',0,'2016-07-06 10:19:20','0000-00-00 00:00:00',NULL,1),(4,'Supervisor',0,'2016-06-01 17:02:35','0000-00-00 00:00:00',NULL,1);

#
# Structure for table "edu_modalidade_ensino"
#

CREATE TABLE `edu_modalidade_ensino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_modalidade_ensino"
#

REPLACE INTO `edu_modalidade_ensino` VALUES (1,'Ensino Regular',1),(2,'Ensino de Jovens e Adultos',1),(3,'Ensino Indígena',1),(4,'Ensino Técnico',1);

#
# Structure for table "edu_curso"
#

CREATE TABLE `edu_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `alfabetizatorio` tinyint(1) NOT NULL DEFAULT '0',
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `modalidade_ensino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_fk01_idx` (`modalidade_ensino_id`),
  CONSTRAINT `curso_fk01` FOREIGN KEY (`modalidade_ensino_id`) REFERENCES `edu_modalidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_curso"
#


#
# Structure for table "edu_modulo"
#

CREATE TABLE `edu_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curso_nivel_fk01_idx` (`curso_id`),
  CONSTRAINT `modulo_fk01` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_modulo"
#


#
# Structure for table "edu_permissao"
#

CREATE TABLE `edu_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4D57012854BD530C` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "edu_permissao"
#

REPLACE INTO `edu_permissao` VALUES (1,'ROLE_INSTITUICAO','Módulo Instituições',1),(2,'ROLE_TIPO_UNIDADE','Módulo Tipos de Unidade Escolar',1),(3,'ROLE_UNIDADE_ENSINO','Módulo Unidades de Ensino',1),(4,'ROLE_MODULO','Módulo Módulos',1),(5,'ROLE_CURSO','Módulo Cursos',1),(6,'ROLE_REGIME_ENSINO','Módulo Regimes de Ensino',1),(7,'ROLE_ETAPA','Módulo Etapas',1),(8,'ROLE_DISCIPLINA','Módulo Disciplinas',1),(9,'ROLE_TURNO','Módulo Turnos',1),(10,'ROLE_CARGO','Módulos Cargos',1),(11,'ROLE_CALENDARIO','Módulo Calendários Acadêmico',1),(12,'ROLE_MODELO_QUADRO','Módulo Modelos de Quadro de Horário',1),(13,'ROLE_EVENTOS','Módulo Eventos',1),(14,'ROLE_TURMA','Módulo Turmas',1),(15,'ROLE_GRADE_AULA','Módulo Grade de Horários',1),(16,'ROLE_QUADRO_HORARIO','Módulo Quadro de Horários',1),(17,'ROLE_MATRICULA','Módulo Matrículas e Enturmações',1),(18,'ROLE_MOVIMENTACAO','Módulo Movimentação',1),(19,'ROLE_PESSOA','Módulo Pessoas',1),(20,'ROLE_FUNCIONARIO','Módulo Funcionários',1),(21,'ROLE_AVALIACAO','Módulo Avaliações',1),(22,'ROLE_HABILIDADES','Módulo Habilidades',1),(23,'ROLE_TIPOS_AVALIACAO','Módulo Tipos de Avaliação',1),(24,'ROLE_DIARIO_NOTAS','Módulo Diário de Notas',1),(25,'ROLE_DIARIO_PRESENCA','Módulo Diário de Presença',1),(26,'ROLE_USUARIOS','Módulo Usuários',1),(27,'ROLE_PERMISSOES','Módulo Permissões',1),(28,'ROLE_SUPER_ADMIN','Super Administrador',1),(29,'ROLE_HOME_PROFESSOR','Tela Inicial de Professor',1),(30,'ROLE_SOLICITAR_VAGA','Módulo Solicitação de Vaga',1);

#
# Structure for table "edu_quadro_horario_modelo"
#

CREATE TABLE `edu_quadro_horario_modelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `quantidade_aulas` varchar(255) NOT NULL,
  `duracao_aula` varchar(255) NOT NULL,
  `duracao_intervalo` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `posicao_intervalo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A1D49A5387CB4A1F` (`curso_id`),
  CONSTRAINT `FK_A1D49A5387CB4A1F` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_modelo"
#


#
# Structure for table "edu_regime"
#

CREATE TABLE `edu_regime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "edu_regime"
#

REPLACE INTO `edu_regime` VALUES (1,'Trimestral','2015-11-19 16:35:16','0000-00-00 00:00:00',NULL,1),(2,'Bimestral','2016-04-13 17:29:41','2016-04-13 17:34:10',NULL,1),(3,'Semestral','2016-03-08 17:04:05','2016-03-08 17:30:06',NULL,1),(30,'Anual','2016-05-31 15:56:45','2016-04-29 14:35:01',NULL,1);

#
# Structure for table "edu_sistema_avaliacao"
#

CREATE TABLE `edu_sistema_avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_identificacao` varchar(255) NOT NULL,
  `exame` tinyint(1) NOT NULL,
  `tipo` enum('QUANTITATIVO','QUALITATIVO') NOT NULL,
  `quantidade_medias` int(11) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `regime_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `edu_sistema_avaliacao_idx` (`regime_id`),
  CONSTRAINT `edu_sistema_avaliacao` FOREIGN KEY (`regime_id`) REFERENCES `edu_regime` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_sistema_avaliacao"
#

REPLACE INTO `edu_sistema_avaliacao` VALUES (1,'AVALIAÇÃO QUANTITATIVA BIMESTRAL COM EXAME','QUANTITATIVA_COM_EXAME',1,'QUANTITATIVO',4,1,2),(2,'AVALIAÇÃO CONCEITUAL TRIMESTRAL','QUALITATIVA_CONCEITUAL',1,'QUALITATIVO',3,1,1),(3,'AVALIAÇÃO QUANTITATIVA SEMESTRAL SEM EXAME','QUANTITATIVA_SEM_EXAME',0,'QUANTITATIVO',1,1,3),(4,'SEM AVALIAÇÃO','SEM_AVALIACAO',0,'QUALITATIVO',1,1,30);

#
# Structure for table "edu_etapa"
#

CREATE TABLE `edu_etapa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `ordem` int(11) NOT NULL,
  `limite_alunos` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `integral` tinyint(1) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  `quadro_horario_modelo_id` int(11) DEFAULT NULL,
  `sistema_avaliacao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etapa_fk0_idx` (`curso_id`),
  KEY `etapa_fk1_idx` (`modulo_id`),
  KEY `etapa_fk04_idx` (`quadro_horario_modelo_id`),
  KEY `etapa_fk05_idx` (`sistema_avaliacao_id`),
  CONSTRAINT `etapa_fk01` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `etapa_fk02` FOREIGN KEY (`modulo_id`) REFERENCES `edu_modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `etapa_fk04` FOREIGN KEY (`quadro_horario_modelo_id`) REFERENCES `edu_quadro_horario_modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `etapa_fk05` FOREIGN KEY (`sistema_avaliacao_id`) REFERENCES `edu_sistema_avaliacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_etapa"
#


#
# Structure for table "edu_disciplina"
#

CREATE TABLE `edu_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `nome_exibicao` varchar(255) NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `opcional` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `etapa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `disciplina_fk01_idx` (`curso_id`),
  KEY `disciplina_fk02_idx` (`etapa_id`),
  CONSTRAINT `disciplina_fk01` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `disciplina_fk02` FOREIGN KEY (`etapa_id`) REFERENCES `edu_etapa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_disciplina"
#


#
# Structure for table "edu_avaliacao_habilidade"
#

CREATE TABLE `edu_avaliacao_habilidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `media` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacao_habilidade_fk01_idx` (`disciplina_id`),
  CONSTRAINT `avaliacao_habilidade_fk01` FOREIGN KEY (`disciplina_id`) REFERENCES `edu_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_habilidade"
#


#
# Structure for table "edu_tipo_unidade_ensino"
#

CREATE TABLE `edu_tipo_unidade_ensino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "edu_tipo_unidade_ensino"
#

REPLACE INTO `edu_tipo_unidade_ensino` VALUES (1,'Centro de Educação Infantil','CEI',1),(2,'Centro de Educação Integral','CEDIN',1),(3,'Centro Educacional','CE',1),(4,'Escola Básica','EB',1),(5,'Grupo Escolar','GE',1);

#
# Structure for table "edu_turma_agrupamento"
#

CREATE TABLE `edu_turma_agrupamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_agrupamento"
#


#
# Structure for table "edu_turno"
#

CREATE TABLE `edu_turno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "edu_turno"
#

REPLACE INTO `edu_turno` VALUES (1,'Matutino','07:30:00','11:45:00','2016-05-31 15:52:25','0000-00-00 00:00:00',NULL,1),(2,'Vespertino','13:30:00','17:45:00','2016-05-31 15:52:28','0000-00-00 00:00:00',NULL,1),(3,'Noturno','19:15:00','22:30:00','2016-05-31 15:52:22','0000-00-00 00:00:00',NULL,1),(4,'Integral','07:15:00','19:00:00','2016-05-31 15:52:58','0000-00-00 00:00:00',NULL,1);

#
# Structure for table "edu_vaga"
#

CREATE TABLE `edu_vaga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turma_id` varchar(255) NOT NULL,
  `solicitacao_vaga_id` varchar(255) DEFAULT NULL,
  `enturmacao_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_vaga"
#


#
# Structure for table "sme_estado_civil"
#

CREATE TABLE `sme_estado_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D5693BA54BD530C` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='InnoDB free: 10240 kB';

#
# Data for table "sme_estado_civil"
#

REPLACE INTO `sme_estado_civil` VALUES (1,'Solteiro',1),(2,'Casado',1),(3,'Viúvo',1),(4,'Separado',1),(5,'Divorciado',1),(6,'União estável',1);

#
# Structure for table "sme_intranet_usuario"
#

CREATE TABLE `sme_intranet_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_exibicao` varchar(255) NOT NULL,
  `nome_usuario` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C67A84347878DEE5` (`nome_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "sme_intranet_usuario"
#

REPLACE INTO `sme_intranet_usuario` VALUES (1,'Administrador','admin','21232f297a57a5a743894a0e4a801fc3','2016-04-28 15:50:40','0000-00-00 00:00:00',NULL,1);

#
# Structure for table "edu_usuario_permissao"
#

CREATE TABLE `edu_usuario_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` enum('L','E') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` varchar(255) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `permissao_id` int(11) DEFAULT NULL,
  `entidade_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_permissao_fk01_idx` (`usuario_id`),
  KEY `usuario_permissao_fk02_idx` (`permissao_id`),
  CONSTRAINT `usuario_permissao_fk01` FOREIGN KEY (`usuario_id`) REFERENCES `sme_intranet_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuario_permissao_fk02` FOREIGN KEY (`permissao_id`) REFERENCES `edu_permissao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "edu_usuario_permissao"
#

REPLACE INTO `edu_usuario_permissao` VALUES (1,'E','2016-04-29 14:59:01','0000-00-00 00:00:00',NULL,'1',1,28,'16138');

#
# Structure for table "sme_necessidade_especial"
#

CREATE TABLE `sme_necessidade_especial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sme_necessidade_especial"
#


#
# Structure for table "sme_pais"
#

CREATE TABLE `sme_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='InnoDB free: 10240 kB';

#
# Data for table "sme_pais"
#

REPLACE INTO `sme_pais` VALUES (1,'Brasil',1);

#
# Structure for table "sme_estado"
#

CREATE TABLE `sme_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pais_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_fk01_idx` (`pais_id`),
  CONSTRAINT `estado_fk01` FOREIGN KEY (`pais_id`) REFERENCES `sme_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='InnoDB free: 10240 kB; (`pais_id`) REFER `dgp/sme_pais`(`id`';

#
# Data for table "sme_estado"
#

REPLACE INTO `sme_estado` VALUES (1,'Acre','AC',1,1),(2,'Alagoas','AL',1,1),(3,'Amapá','AP',1,1),(4,'Amazonas','AM',1,1),(5,'Bahia','BA',1,1),(6,'Ceará','CE',1,1),(7,'Distrito Federal','DF',1,1),(8,'Espírito Santo','ES',1,1),(9,'Goiás','GO',1,1),(10,'Maranhão','MA',1,1),(11,'Mato Grosso','MT',1,1),(12,'Mato Grosso do Sul','MS',1,1),(13,'Minas Gerais','MG',1,1),(14,'Pará','PA',1,1),(15,'Paraíba','PB',1,1),(16,'Paraná','PR',1,1),(17,'Pernambuco','PE',1,1),(18,'Piauí','PI',1,1),(19,'Rio de Janeiro','RJ',1,1),(20,'Rio Grande do Norte','RN',1,1),(21,'Rio Grande do Sul','RS',1,1),(22,'Rondônia','RO',1,1),(23,'Roraima','RR',1,1),(24,'Santa Catarina','SC',1,1),(25,'São Paulo','SP',1,1),(26,'Sergipe','SE',1,1),(27,'Tocantins','TO',1,1);

#
# Structure for table "sme_cidade"
#

CREATE TABLE `sme_cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sigla` varchar(255) NOT NULL,
  `ibge` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_fk01_idx` (`estado_id`),
  CONSTRAINT `cidade_fk01` FOREIGN KEY (`estado_id`) REFERENCES `sme_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5508 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='InnoDB free: 10240 kB; (`estado_id`) REFER `dgp/sme_estado`(';

#
# Data for table "sme_cidade"
#

REPLACE INTO `sme_cidade` VALUES (1,'Acrelândia','',NULL,1,1),(2,'Assis Brasil','',NULL,1,1),(3,'Brasiléia','',NULL,1,1),(4,'Bujari','',NULL,1,1),(5,'Capixaba','',NULL,1,1),(6,'Cruzeiro do Sul','',NULL,1,1),(7,'Epitaciolândia','',NULL,1,1),(8,'Feijó','',NULL,1,1),(9,'Jordão','',NULL,1,1),(10,'Mâncio Lima','',NULL,1,1),(11,'Manoel Urbano','',NULL,1,1),(12,'Marechal Thaumaturgo','',NULL,1,1),(13,'Plácido de Castro','',NULL,1,1),(14,'Porto Acre','',NULL,1,1),(15,'Porto Walter','',NULL,1,1),(16,'Rio Branco','',NULL,1,1),(17,'Rodrigues Alves','',NULL,1,1),(18,'Santa Rosa do Purus','',NULL,1,1),(19,'Sena Madureira','',NULL,1,1),(20,'Senador Guiomard','',NULL,1,1),(21,'Tarauacá','',NULL,1,1),(22,'Xapuri','',NULL,1,1),(23,'Água Branca','',NULL,1,2),(24,'Anadia','',NULL,1,2),(25,'Arapiraca','',NULL,1,2),(26,'Atalaia','',NULL,1,2),(27,'Barra de Santo Antônio','',NULL,1,2),(28,'Barra de São Miguel','',NULL,1,2),(29,'Batalha','',NULL,1,2),(30,'Belém','',NULL,1,2),(31,'Belo Monte','',NULL,1,2),(32,'Boca da Mata','',NULL,1,2),(33,'Branquinha','',NULL,1,2),(34,'Cacimbinhas','',NULL,1,2),(35,'Cajueiro','',NULL,1,2),(36,'Campestre','',NULL,1,2),(37,'Campo Alegre','',NULL,1,2),(38,'Campo Grande','',NULL,1,2),(39,'Canapi','',NULL,1,2),(40,'Capela','',NULL,1,2),(41,'Carneiros','',NULL,1,2),(42,'Chã Preta','',NULL,1,2),(43,'Coité do Nóia','',NULL,1,2),(44,'Colônia Leopoldina','',NULL,1,2),(45,'Coqueiro Seco','',NULL,1,2),(46,'Coruripe','',NULL,1,2),(47,'Craíbas','',NULL,1,2),(48,'Delmiro Gouveia','',NULL,1,2),(49,'Dois Riachos','',NULL,1,2),(50,'Estrela de Alagoas','',NULL,1,2),(51,'Feira Grande','',NULL,1,2),(52,'Feliz Deserto','',NULL,1,2),(53,'Flexeiras','',NULL,1,2),(54,'Girau do Ponciano','',NULL,1,2),(55,'Ibateguara','',NULL,1,2),(56,'Igaci','',NULL,1,2),(57,'Igreja Nova','',NULL,1,2),(58,'Inhapi','',NULL,1,2),(59,'Jacaré dos Homens','',NULL,1,2),(60,'Jacuípe','',NULL,1,2),(61,'Japaratinga','',NULL,1,2),(62,'Jaramataia','',NULL,1,2),(63,'Joaquim Gomes','',NULL,1,2),(64,'Jundiá','',NULL,1,2),(65,'Junqueiro','',NULL,1,2),(66,'Lagoa da Canoa','',NULL,1,2),(67,'Limoeiro de Anadia','',NULL,1,2),(68,'Maceió','',NULL,1,2),(69,'Major Isidoro','',NULL,1,2),(70,'Mar Vermelho','',NULL,1,2),(71,'Maragogi','',NULL,1,2),(72,'Maravilha','',NULL,1,2),(73,'Marechal Deodoro','',NULL,1,2),(74,'Maribondo','',NULL,1,2),(75,'Mata Grande','',NULL,1,2),(76,'Matriz de Camaragibe','',NULL,1,2),(77,'Messias','',NULL,1,2),(78,'Minador do Negrão','',NULL,1,2),(79,'Monteirópolis','',NULL,1,2),(80,'Murici','',NULL,1,2),(81,'Novo Lino','',NULL,1,2),(82,'Olho d`Água das Flores','',NULL,1,2),(83,'Olho d`Água do Casado','',NULL,1,2),(84,'Olho d`Água Grande','',NULL,1,2),(85,'Olivença','',NULL,1,2),(86,'Ouro Branco','',NULL,1,2),(87,'Palestina','',NULL,1,2),(88,'Palmeira dos Índios','',NULL,1,2),(89,'Pão de Açúcar','',NULL,1,2),(90,'Pariconha','',NULL,1,2),(91,'Paripueira','',NULL,1,2),(92,'Passo de Camaragibe','',NULL,1,2),(93,'Paulo Jacinto','',NULL,1,2),(94,'Penedo','',NULL,1,2),(95,'Piaçabuçu','',NULL,1,2),(96,'Pilar','',NULL,1,2),(97,'Pindoba','',NULL,1,2),(98,'Piranhas','',NULL,1,2),(99,'Poço das Trincheiras','',NULL,1,2),(100,'Porto Calvo','',NULL,1,2),(101,'Porto de Pedras','',NULL,1,2),(102,'Porto Real do Colégio','',NULL,1,2),(103,'Quebrangulo','',NULL,1,2),(104,'Rio Largo','',NULL,1,2),(105,'Roteiro','',NULL,1,2),(106,'Santa Luzia do Norte','',NULL,1,2),(107,'Santana do Ipanema','',NULL,1,2),(108,'Santana do Mundaú','',NULL,1,2),(109,'São Brás','',NULL,1,2),(110,'São José da Laje','',NULL,1,2),(111,'São José da Tapera','',NULL,1,2),(112,'São Luís do Quitunde','',NULL,1,2),(113,'São Miguel dos Campos','',NULL,1,2),(114,'São Miguel dos Milagres','',NULL,1,2),(115,'São Sebastião','',NULL,1,2),(116,'Satuba','',NULL,1,2),(117,'Senador Rui Palmeira','',NULL,1,2),(118,'Tanque d`Arca','',NULL,1,2),(119,'Taquarana','',NULL,1,2),(120,'Teotônio Vilela','',NULL,1,2),(121,'Traipu','',NULL,1,2),(122,'União dos Palmares','',NULL,1,2),(123,'Viçosa','',NULL,1,2),(124,'Amapá','',NULL,1,3),(125,'Calçoene','',NULL,1,3),(126,'Cutias','',NULL,1,3),(127,'Ferreira Gomes','',NULL,1,3),(128,'Itaubal','',NULL,1,3),(129,'Laranjal do Jari','',NULL,1,3),(130,'Macapá','',NULL,1,3),(131,'Mazagão','',NULL,1,3),(132,'Oiapoque','',NULL,1,3),(133,'Pedra Branca do Amaparí','',NULL,1,3),(134,'Porto Grande','',NULL,1,3),(135,'Pracuúba','',NULL,1,3),(136,'Santana','',NULL,1,3),(137,'Serra do Navio','',NULL,1,3),(138,'Tartarugalzinho','',NULL,1,3),(139,'Vitória do Jari','',NULL,1,3),(140,'Alvarães','',NULL,1,4),(141,'Amaturá','',NULL,1,4),(142,'namã','',NULL,1,4),(143,'Anori','',NULL,1,4),(144,'Apuí','',NULL,1,4),(145,'Atalaia do Norte','',NULL,1,4),(146,'Autazes','',NULL,1,4),(147,'Barcelos','',NULL,1,4),(148,'Barreirinha','',NULL,1,4),(149,'Benjamin Constant','',NULL,1,4),(150,'Beruri','',NULL,1,4),(151,'Boa Vista do Ramos','',NULL,1,4),(152,'Boca do Acre','',NULL,1,4),(153,'Borba','',NULL,1,4),(154,'Caapiranga','',NULL,1,4),(155,'Canutama','',NULL,1,4),(156,'Carauari','',NULL,1,4),(157,'Careiro','',NULL,1,4),(158,'Careiro da Várzea','',NULL,1,4),(159,'Coari','',NULL,1,4),(160,'Codajás','',NULL,1,4),(161,'Eirunepé','',NULL,1,4),(162,'Envira','',NULL,1,4),(163,'Fonte Boa','',NULL,1,4),(164,'Guajará','',NULL,1,4),(165,'Humaitá','',NULL,1,4),(166,'Ipixuna','',NULL,1,4),(167,'Iranduba','',NULL,1,4),(168,'Itacoatiara','',NULL,1,4),(169,'Itamarati','',NULL,1,4),(170,'Itapiranga','',NULL,1,4),(171,'Japurá','',NULL,1,4),(172,'Juruá','',NULL,1,4),(173,'Jutaí','',NULL,1,4),(174,'Lábrea','',NULL,1,4),(175,'Manacapuru','',NULL,1,4),(176,'Manaquiri','',NULL,1,4),(177,'Manaus','',NULL,1,4),(178,'Manicoré','',NULL,1,4),(179,'Maraã','',NULL,1,4),(180,'Maués','',NULL,1,4),(181,'Nhamundá','',NULL,1,4),(182,'Nova Olinda do Norte','',NULL,1,4),(183,'Novo Airão','',NULL,1,4),(184,'Novo Aripuanã','',NULL,1,4),(185,'Parintins','',NULL,1,4),(186,'Pauini','',NULL,1,4),(187,'Presidente Figueiredo','',NULL,1,4),(188,'Rio Preto da Eva','',NULL,1,4),(189,'Santa Isabel do Rio Negro','',NULL,1,4),(190,'Santo Antônio do Içá','',NULL,1,4),(191,'São Gabriel da Cachoeira','',NULL,1,4),(192,'São Paulo de Olivença','',NULL,1,4),(193,'São Sebastião do Uatumã','',NULL,1,4),(194,'Silves','',NULL,1,4),(195,'Tabatinga','',NULL,1,4),(196,'Tapauá','',NULL,1,4),(197,'Tefé','',NULL,1,4),(198,'Tonantins','',NULL,1,4),(199,'Uarini','',NULL,1,4),(200,'Urucará','',NULL,1,4),(201,'Urucurituba','',NULL,1,4),(202,'Abaíra','',NULL,1,5),(203,'Abaré','',NULL,1,5),(204,'Acajutiba','',NULL,1,5),(205,'Adustina','',NULL,1,5),(206,'Água Fria','',NULL,1,5),(207,'Aiquara','',NULL,1,5),(208,'Alagoinhas','',NULL,1,5),(209,'Alcobaça','',NULL,1,5),(210,'Almadina','',NULL,1,5),(211,'Amargosa','',NULL,1,5),(212,'Amélia Rodrigues','',NULL,1,5),(213,'América Dourada','',NULL,1,5),(214,'Anagé','',NULL,1,5),(215,'Andaraí','',NULL,1,5),(216,'Andorinha','',NULL,1,5),(217,'Angical','',NULL,1,5),(218,'Anguera','',NULL,1,5),(219,'Antas','',NULL,1,5),(220,'Antônio Cardoso','',NULL,1,5),(221,'Antônio Gonçalves','',NULL,1,5),(222,'Aporá','',NULL,1,5),(223,'Apuarema','',NULL,1,5),(224,'Araças','',NULL,1,5),(225,'Aracatu','',NULL,1,5),(226,'Araci','',NULL,1,5),(227,'Aramari','',NULL,1,5),(228,'Arataca','',NULL,1,5),(229,'Aratuípe','',NULL,1,5),(230,'Aurelino Leal','',NULL,1,5),(231,'Baianópolis','',NULL,1,5),(232,'Baixa Grande','',NULL,1,5),(233,'Banzaê','',NULL,1,5),(234,'Barra','',NULL,1,5),(235,'Barra da Estiva','',NULL,1,5),(236,'Barra do Choça','',NULL,1,5),(237,'Barra do Mendes','',NULL,1,5),(238,'Barra do Rocha','',NULL,1,5),(239,'Barreiras','',NULL,1,5),(240,'Barro Alto','',NULL,1,5),(241,'Belmonte','',NULL,1,5),(242,'Belo Campo','',NULL,1,5),(243,'Biritinga','',NULL,1,5),(244,'Boa Nova','',NULL,1,5),(245,'Boa Vista do Tupim','',NULL,1,5),(246,'Bom Jesus da Lapa','',NULL,1,5),(247,'Bom Jesus da Serra','',NULL,1,5),(248,'Boninal','',NULL,1,5),(249,'Bonito','',NULL,1,5),(250,'Boquira','',NULL,1,5),(251,'Botuporã','',NULL,1,5),(252,'Brejões','',NULL,1,5),(253,'Brejolândia','',NULL,1,5),(254,'Brotas de Macaúbas','',NULL,1,5),(255,'Brumado','',NULL,1,5),(256,'Buerarema','',NULL,1,5),(257,'Buritirama','',NULL,1,5),(258,'Caatiba','',NULL,1,5),(259,'Cabaceiras do Paraguaçu','',NULL,1,5),(260,'Cachoeira','',NULL,1,5),(261,'Caculé','',NULL,1,5),(262,'Caém','',NULL,1,5),(263,'Caetanos','',NULL,1,5),(264,'Caetité','',NULL,1,5),(265,'Cafarnaum','',NULL,1,5),(266,'Cairu','',NULL,1,5),(267,'Caldeirão Grande','',NULL,1,5),(268,'Camacan','',NULL,1,5),(269,'Camaçari','',NULL,1,5),(270,'Camamu','',NULL,1,5),(271,'Campo Alegre de Lourdes','',NULL,1,5),(272,'Campo Formoso','',NULL,1,5),(273,'Canápolis','',NULL,1,5),(274,'Canarana','',NULL,1,5),(275,'Canavieiras','',NULL,1,5),(276,'Candeal','',NULL,1,5),(277,'Candeias','',NULL,1,5),(278,'Candiba','',NULL,1,5),(279,'Cândido Sales','',NULL,1,5),(280,'Cansanção','',NULL,1,5),(281,'Canudos','',NULL,1,5),(282,'Capela do Alto Alegre','',NULL,1,5),(283,'Capim Grosso','',NULL,1,5),(284,'Caraíbas','',NULL,1,5),(285,'Caravelas','',NULL,1,5),(286,'Cardeal da Silva','',NULL,1,5),(287,'Carinhanha','',NULL,1,5),(288,'Casa Nova','',NULL,1,5),(289,'Castro Alves','',NULL,1,5),(290,'Catolândia','',NULL,1,5),(291,'Catu','',NULL,1,5),(292,'Caturama','',NULL,1,5),(293,'Central','',NULL,1,5),(294,'Chorrochó','',NULL,1,5),(295,'Cícero Dantas','',NULL,1,5),(296,'Cipó','',NULL,1,5),(297,'Coaraci','',NULL,1,5),(298,'Cocos','',NULL,1,5),(299,'Conceição da Feira','',NULL,1,5),(300,'Conceição do Almeida','',NULL,1,5),(301,'Conceição do Coité','',NULL,1,5),(302,'Conceição do Jacuípe','',NULL,1,5),(303,'Conde','',NULL,1,5),(304,'Condeúba','',NULL,1,5),(305,'Contendas do Sincorá','',NULL,1,5),(306,'Coração de Maria','',NULL,1,5),(307,'Cordeiros','',NULL,1,5),(308,'Coribe','',NULL,1,5),(309,'Coronel João Sá','',NULL,1,5),(310,'Correntina','',NULL,1,5),(311,'Cotegipe','',NULL,1,5),(312,'Cravolândia','',NULL,1,5),(313,'Crisópolis','',NULL,1,5),(314,'Cristópolis','',NULL,1,5),(315,'Cruz das Almas','',NULL,1,5),(316,'Curaçá','',NULL,1,5),(317,'Dário Meira','',NULL,1,5),(318,'Dias d`Ávila','',NULL,1,5),(319,'Dom Basílio','',NULL,1,5),(320,'Dom Macedo Costa','',NULL,1,5),(321,'Elísio Medrado','',NULL,1,5),(322,'Encruzilhada','',NULL,1,5),(323,'Entre Rios','',NULL,1,5),(324,'Érico Cardoso','',NULL,1,5),(325,'Esplanada','',NULL,1,5),(326,'Euclides da Cunha','',NULL,1,5),(327,'Eunápolis','',NULL,1,5),(328,'Fátima','',NULL,1,5),(329,'Feira da Mata','',NULL,1,5),(330,'Feira de Santana','',NULL,1,5),(331,'Filadélfia','',NULL,1,5),(332,'Firmino Alves','',NULL,1,5),(333,'Floresta Azul','',NULL,1,5),(334,'Formosa do Rio Preto','',NULL,1,5),(335,'Gandu','',NULL,1,5),(336,'Gavião','',NULL,1,5),(337,'Gentio do Ouro','',NULL,1,5),(338,'Glória','',NULL,1,5),(339,'Gongogi','',NULL,1,5),(340,'Governador Lomanto Júnior','',NULL,1,5),(341,'Governador Mangabeira','',NULL,1,5),(342,'Guajeru','',NULL,1,5),(343,'Guanambi','',NULL,1,5),(344,'Guaratinga','',NULL,1,5),(345,'Heliópolis','',NULL,1,5),(346,'Iaçu','',NULL,1,5),(347,'Ibiassucê','',NULL,1,5),(348,'Ibicaraí','',NULL,1,5),(349,'Ibicoara','',NULL,1,5),(350,'Ibicuí','',NULL,1,5),(351,'Ibipeba','',NULL,1,5),(352,'Ibipitanga','',NULL,1,5),(353,'Ibiquera','',NULL,1,5),(354,'Ibirapitanga','',NULL,1,5),(355,'Ibirapuã','',NULL,1,5),(356,'Ibirataia','',NULL,1,5),(357,'Ibitiara','',NULL,1,5),(358,'Ibititá','',NULL,1,5),(359,'Ibotirama','',NULL,1,5),(360,'Ichu','',NULL,1,5),(361,'Igaporã','',NULL,1,5),(362,'Igrapiúna','',NULL,1,5),(363,'Iguaí','',NULL,1,5),(364,'Ilhéus','',NULL,1,5),(365,'Inhambupe','',NULL,1,5),(366,'Ipecaetá','',NULL,1,5),(367,'Ipiaú','',NULL,1,5),(368,'Ipirá','',NULL,1,5),(369,'Ipupiara','',NULL,1,5),(370,'Irajuba','',NULL,1,5),(371,'Iramaia','',NULL,1,5),(372,'Iraquara','',NULL,1,5),(373,'Irará','',NULL,1,5),(374,'Irecê','',NULL,1,5),(375,'Itabela','',NULL,1,5),(376,'Itaberaba','',NULL,1,5),(377,'Itabuna','',NULL,1,5),(378,'Itacaré','',NULL,1,5),(379,'Itaeté','',NULL,1,5),(380,'Itagi','',NULL,1,5),(381,'Itagibá','',NULL,1,5),(382,'Itagimirim','',NULL,1,5),(383,'Itaguaçu da Bahia','',NULL,1,5),(384,'Itaju do Colônia','',NULL,1,5),(385,'Itajuípe','',NULL,1,5),(386,'Itamaraju','',NULL,1,5),(387,'Itamari','',NULL,1,5),(388,'Itambé','',NULL,1,5),(389,'Itanagra','',NULL,1,5),(390,'Itanhém','',NULL,1,5),(391,'Itaparica','',NULL,1,5),(392,'Itapé','',NULL,1,5),(393,'Itapebi','',NULL,1,5),(394,'Itapetinga','',NULL,1,5),(395,'Itapicuru','',NULL,1,5),(396,'Itapitanga','',NULL,1,5),(397,'Itaquara','',NULL,1,5),(398,'Itarantim','',NULL,1,5),(399,'Itatim','',NULL,1,5),(400,'Itiruçu','',NULL,1,5),(401,'Itiúba','',NULL,1,5),(402,'Itororó','',NULL,1,5),(403,'Ituaçu','',NULL,1,5),(404,'Ituberá','',NULL,1,5),(405,'Iuiú','',NULL,1,5),(406,'Jaborandi','',NULL,1,5),(407,'Jacaraci','',NULL,1,5),(408,'Jacobina','',NULL,1,5),(409,'Jaguaquara','',NULL,1,5),(410,'Jaguarari','',NULL,1,5),(411,'Jaguaripe','',NULL,1,5),(412,'Jandaíra','',NULL,1,5),(413,'Jequié','',NULL,1,5),(414,'Jeremoabo','',NULL,1,5),(415,'Jiquiriçá','',NULL,1,5),(416,'Jitaúna','',NULL,1,5),(417,'João Dourado','',NULL,1,5),(418,'Juazeiro','',NULL,1,5),(419,'Jucuruçu','',NULL,1,5),(420,'Jussara','',NULL,1,5),(421,'Jussari','',NULL,1,5),(422,'Jussiape','',NULL,1,5),(423,'Lafaiete Coutinho','',NULL,1,5),(424,'Lagoa Real','',NULL,1,5),(425,'Laje','',NULL,1,5),(426,'Lajedão','',NULL,1,5),(427,'Lajedinho','',NULL,1,5),(428,'Lajedo do Tabocal','',NULL,1,5),(429,'Lamarão','',NULL,1,5),(430,'Lapão','',NULL,1,5),(431,'Lauro de Freitas','',NULL,1,5),(432,'Lençóis','',NULL,1,5),(433,'Licínio de Almeida','',NULL,1,5),(434,'Livramento de Nossa Senhora','',NULL,1,5),(435,'Macajuba','',NULL,1,5),(436,'Macarani','',NULL,1,5),(437,'Macaúbas','',NULL,1,5),(438,'Macururé','',NULL,1,5),(439,'Madre de Deus','',NULL,1,5),(440,'Maetinga','',NULL,1,5),(441,'Maiquinique','',NULL,1,5),(442,'Mairi','',NULL,1,5),(443,'Malhada','',NULL,1,5),(444,'Malhada de Pedras','',NULL,1,5),(445,'Manoel Vitorino','',NULL,1,5),(446,'Mansidão','',NULL,1,5),(447,'Maracás','',NULL,1,5),(448,'Maragogipe','',NULL,1,5),(449,'Maraú','',NULL,1,5),(450,'Marcionílio Souza','',NULL,1,5),(451,'Mascote','',NULL,1,5),(452,'Mata de São João','',NULL,1,5),(453,'Matina','',NULL,1,5),(454,'Medeiros Neto','',NULL,1,5),(455,'Miguel Calmon','',NULL,1,5),(456,'Milagres','',NULL,1,5),(457,'Mirangaba','',NULL,1,5),(458,'Mirante','',NULL,1,5),(459,'Monte Santo','',NULL,1,5),(460,'Morpará','',NULL,1,5),(461,'Morro do Chapéu','',NULL,1,5),(462,'Mortugaba','',NULL,1,5),(463,'Mucugê','',NULL,1,5),(464,'Mucuri','',NULL,1,5),(465,'Mulungu do Morro','',NULL,1,5),(466,'Mundo Novo','',NULL,1,5),(467,'Muniz Ferreira','',NULL,1,5),(468,'Muquém de São Francisco','',NULL,1,5),(469,'Muritiba','',NULL,1,5),(470,'Mutuípe','',NULL,1,5),(471,'Nazaré','',NULL,1,5),(472,'Nilo Peçanha','',NULL,1,5),(473,'Nordestina','',NULL,1,5),(474,'Nova Canaã','',NULL,1,5),(475,'Nova Fátima','',NULL,1,5),(476,'Nova Ibiá','',NULL,1,5),(477,'Nova Itarana','',NULL,1,5),(478,'Nova Redenção','',NULL,1,5),(479,'Nova Soure','',NULL,1,5),(480,'Nova Viçosa','',NULL,1,5),(481,'Novo Horizonte','',NULL,1,5),(482,'Novo Triunfo','',NULL,1,5),(483,'Olindina','',NULL,1,5),(484,'Oliveira dos Brejinhos','',NULL,1,5),(485,'Ouriçangas','',NULL,1,5),(486,'Ourolândia','',NULL,1,5),(487,'Palmas de Monte Alto','',NULL,1,5),(488,'Palmeiras','',NULL,1,5),(489,'Paramirim','',NULL,1,5),(490,'Paratinga','',NULL,1,5),(491,'Paripiranga','',NULL,1,5),(492,'Pau Brasil','',NULL,1,5),(493,'Paulo Afonso','',NULL,1,5),(494,'Pé de Serra','',NULL,1,5),(495,'Pedrão','',NULL,1,5),(496,'Pedro Alexandre','',NULL,1,5),(497,'Piatã','',NULL,1,5),(498,'Pilão Arcado','',NULL,1,5),(499,'Pindaí','',NULL,1,5),(500,'Pindobaçu','',NULL,1,5),(501,'Pintadas','',NULL,1,5),(502,'Piraí do Norte','',NULL,1,5),(503,'Piripá','',NULL,1,5),(504,'Piritiba','',NULL,1,5),(505,'Planaltino','',NULL,1,5),(506,'Planalto','',NULL,1,5),(507,'Poções','',NULL,1,5),(508,'Pojuca','',NULL,1,5),(509,'Ponto Novo','',NULL,1,5),(510,'Porto Seguro','',NULL,1,5),(511,'Potiraguá','',NULL,1,5),(512,'Prado','',NULL,1,5),(513,'Presidente Dutra','',NULL,1,5),(514,'Presidente Jânio Quadros','',NULL,1,5),(515,'Presidente Tancredo Neves','',NULL,1,5),(516,'Queimadas','',NULL,1,5),(517,'Quijingue','',NULL,1,5),(518,'Quixabeira','',NULL,1,5),(519,'Rafael Jambeiro','',NULL,1,5),(520,'Remanso','',NULL,1,5),(521,'Retirolândia','',NULL,1,5),(522,'Riachão das Neves','',NULL,1,5),(523,'Riachão do Jacuípe','',NULL,1,5),(524,'Riacho de Santana','',NULL,1,5),(525,'Ribeira do Amparo','',NULL,1,5),(526,'Ribeira do Pombal','',NULL,1,5),(527,'Ribeirão do Largo','',NULL,1,5),(528,'Rio de Contas','',NULL,1,5),(529,'Rio do Antônio','',NULL,1,5),(530,'Rio do Pires','',NULL,1,5),(531,'Rio Real','',NULL,1,5),(532,'Rodelas','',NULL,1,5),(533,'Ruy Barbosa','',NULL,1,5),(534,'Salinas da Margarida','',NULL,1,5),(535,'Salvador','',NULL,1,5),(536,'Santa Bárbara','',NULL,1,5),(537,'Santa Brígida','',NULL,1,5),(538,'Santa Cruz Cabrália','',NULL,1,5),(539,'Santa Cruz da Vitória','',NULL,1,5),(540,'Santa Inês','',NULL,1,5),(541,'Santa Luzia','',NULL,1,5),(542,'Santa Maria da Vitória','',NULL,1,5),(543,'Santa Rita de Cássia','',NULL,1,5),(544,'Santa Teresinha','',NULL,1,5),(545,'Santaluz','',NULL,1,5),(546,'Santana','',NULL,1,5),(547,'Santanópolis','',NULL,1,5),(548,'Santo Amaro','',NULL,1,5),(549,'Santo Antônio de Jesus','',NULL,1,5),(550,'Santo Estêvão','',NULL,1,5),(551,'São Desidério','',NULL,1,5),(552,'São Domingos','',NULL,1,5),(553,'São Felipe','',NULL,1,5),(554,'São Félix','',NULL,1,5),(555,'São Félix do Coribe','',NULL,1,5),(556,'São Francisco do Conde','',NULL,1,5),(557,'São Gabriel','',NULL,1,5),(558,'São Gonçalo dos Campos','',NULL,1,5),(559,'São José da Vitória','',NULL,1,5),(560,'São José do Jacuípe','',NULL,1,5),(561,'São Miguel das Matas','',NULL,1,5),(562,'São Sebastião do Passé','',NULL,1,5),(563,'Sapeaçu','',NULL,1,5),(564,'Sátiro Dias','',NULL,1,5),(565,'Saubara','',NULL,1,5),(566,'Saúde','',NULL,1,5),(567,'Seabra','',NULL,1,5),(568,'Sebastião Laranjeiras','',NULL,1,5),(569,'Senhor do Bonfim','',NULL,1,5),(570,'Sento Sé','',NULL,1,5),(571,'Serra do Ramalho','',NULL,1,5),(572,'Serra Dourada','',NULL,1,5),(573,'Serra Preta','',NULL,1,5),(574,'Serrinha','',NULL,1,5),(575,'Serrolândia','',NULL,1,5),(576,'Simões Filho','',NULL,1,5),(577,'Sítio do Mato','',NULL,1,5),(578,'Sítio do Quinto','',NULL,1,5),(579,'Sobradinho','',NULL,1,5),(580,'Souto Soares','',NULL,1,5),(581,'Tabocas do Brejo Velho','',NULL,1,5),(582,'Tanhaçu','',NULL,1,5),(583,'Tanque Novo','',NULL,1,5),(584,'Tanquinho','',NULL,1,5),(585,'Taperoá','',NULL,1,5),(586,'Tapiramutá','',NULL,1,5),(587,'Teixeira de Freitas','',NULL,1,5),(588,'Teodoro Sampaio','',NULL,1,5),(589,'Teofilândia','',NULL,1,5),(590,'Teolândia','',NULL,1,5),(591,'Terra Nova','',NULL,1,5),(592,'Tremedal','',NULL,1,5),(593,'Tucano','',NULL,1,5),(594,'Uauá','',NULL,1,5),(595,'Ubaíra','',NULL,1,5),(596,'Ubaitaba','',NULL,1,5),(597,'Ubatã','',NULL,1,5),(598,'Uibaí','',NULL,1,5),(599,'Umburanas','',NULL,1,5),(600,'Una','',NULL,1,5),(601,'Urandi','',NULL,1,5),(602,'Uruçuca','',NULL,1,5),(603,'Utinga','',NULL,1,5),(604,'Valença','',NULL,1,5),(605,'Valente','',NULL,1,5),(606,'Várzea da Roça','',NULL,1,5),(607,'Várzea do Poço','',NULL,1,5),(608,'Várzea Nova','',NULL,1,5),(609,'Varzedo','',NULL,1,5),(610,'Vera Cruz','',NULL,1,5),(611,'Vereda','',NULL,1,5),(612,'Vitória da Conquista','',NULL,1,5),(613,'Wagner','',NULL,1,5),(614,'Wanderley','',NULL,1,5),(615,'Wenceslau Guimarães','',NULL,1,5),(616,'Xique-Xique','',NULL,1,5),(617,'Abaiara','',NULL,1,6),(618,'Acarapé','',NULL,1,6),(619,'Acaraú','',NULL,1,6),(620,'Acopiara','',NULL,1,6),(621,'Aiuaba','',NULL,1,6),(622,'Alcântaras','',NULL,1,6),(623,'Altaneira','',NULL,1,6),(624,'Alto Santo','',NULL,1,6),(625,'Amontada','',NULL,1,6),(626,'Antonina do Norte','',NULL,1,6),(627,'Apuiarés','',NULL,1,6),(628,'Aquiraz','',NULL,1,6),(629,'Aracati','',NULL,1,6),(630,'Aracoiaba','',NULL,1,6),(631,'Ararendá','',NULL,1,6),(632,'Araripe','',NULL,1,6),(633,'Aratuba','',NULL,1,6),(634,'Arneiroz','',NULL,1,6),(635,'Assaré','',NULL,1,6),(636,'Aurora','',NULL,1,6),(637,'Baixio','',NULL,1,6),(638,'Banabuiú','',NULL,1,6),(639,'Barbalha','',NULL,1,6),(640,'Barreira','',NULL,1,6),(641,'Barro','',NULL,1,6),(642,'Barroquinha','',NULL,1,6),(643,'Baturité','',NULL,1,6),(644,'Beberibe','',NULL,1,6),(645,'Bela Cruz','',NULL,1,6),(646,'Boa Viagem','',NULL,1,6),(647,'Brejo Santo','',NULL,1,6),(648,'Camocim','',NULL,1,6),(649,'Campos Sales','',NULL,1,6),(650,'Canindé','',NULL,1,6),(651,'Capistrano','',NULL,1,6),(652,'Caridade','',NULL,1,6),(653,'Cariré','',NULL,1,6),(654,'Caririaçu','',NULL,1,6),(655,'Cariús','',NULL,1,6),(656,'Carnaubal','',NULL,1,6),(657,'Cascavel','',NULL,1,6),(658,'Catarina','',NULL,1,6),(659,'Catunda','',NULL,1,6),(660,'Caucaia','',NULL,1,6),(661,'Cedro','',NULL,1,6),(662,'Chaval','',NULL,1,6),(663,'Choró','',NULL,1,6),(664,'Chorozinho','',NULL,1,6),(665,'Coreaú','',NULL,1,6),(666,'Crateús','',NULL,1,6),(667,'Crato','',NULL,1,6),(668,'Croatá','',NULL,1,6),(669,'Cruz','',NULL,1,6),(670,'Deputado Irapuan Pinheiro','',NULL,1,6),(671,'Ererê','',NULL,1,6),(672,'Eusébio','',NULL,1,6),(673,'Farias Brito','',NULL,1,6),(674,'Forquilha','',NULL,1,6),(675,'Fortaleza','',NULL,1,6),(676,'Fortim','',NULL,1,6),(677,'Frecheirinha','',NULL,1,6),(678,'General Sampaio','',NULL,1,6),(679,'Graça','',NULL,1,6),(680,'Granja','',NULL,1,6),(681,'Granjeiro','',NULL,1,6),(682,'Groaíras','',NULL,1,6),(683,'Guaiúba','',NULL,1,6),(684,'Guaraciaba do Norte','',NULL,1,6),(685,'Guaramiranga','',NULL,1,6),(686,'Hidrolândia','',NULL,1,6),(687,'Horizonte','',NULL,1,6),(688,'Ibaretama','',NULL,1,6),(689,'Ibiapina','',NULL,1,6),(690,'Ibicuitinga','',NULL,1,6),(691,'Icapuí','',NULL,1,6),(692,'Icó','',NULL,1,6),(693,'Iguatu','',NULL,1,6),(694,'Independência','',NULL,1,6),(695,'Ipaporanga','',NULL,1,6),(696,'Ipaumirim','',NULL,1,6),(697,'Ipu','',NULL,1,6),(698,'Ipueiras','',NULL,1,6),(699,'Iracema','',NULL,1,6),(700,'Irauçuba','',NULL,1,6),(701,'Itaiçaba','',NULL,1,6),(702,'Itaitinga','',NULL,1,6),(703,'Itapagé','',NULL,1,6),(704,'Itapipoca','',NULL,1,6),(705,'Itapiúna','',NULL,1,6),(706,'Itarema','',NULL,1,6),(707,'Itatira','',NULL,1,6),(708,'Jaguaretama','',NULL,1,6),(709,'Jaguaribara','',NULL,1,6),(710,'Jaguaribe','',NULL,1,6),(711,'Jaguaruana','',NULL,1,6),(712,'Jardim','',NULL,1,6),(713,'Jati','',NULL,1,6),(714,'Jijoca de Jericoacoara','',NULL,1,6),(715,'Juazeiro do Norte','',NULL,1,6),(716,'Jucás','',NULL,1,6),(717,'Lavras da Mangabeira','',NULL,1,6),(718,'Limoeiro do Norte','',NULL,1,6),(719,'Madalena','',NULL,1,6),(720,'Maracanaú','',NULL,1,6),(721,'Maranguape','',NULL,1,6),(722,'Marco','',NULL,1,6),(723,'Martinópole','',NULL,1,6),(724,'Massapê','',NULL,1,6),(725,'Mauriti','',NULL,1,6),(726,'Meruoca','',NULL,1,6),(727,'Milagres','',NULL,1,6),(728,'Milhã','',NULL,1,6),(729,'Miraíma','',NULL,1,6),(730,'Missão Velha','',NULL,1,6),(731,'Mombaça','',NULL,1,6),(732,'Monsenhor Tabosa','',NULL,1,6),(733,'Morada Nova','',NULL,1,6),(734,'Moraújo','',NULL,1,6),(735,'Morrinhos','',NULL,1,6),(736,'Mucambo','',NULL,1,6),(737,'Mulungu','',NULL,1,6),(738,'Nova Olinda','',NULL,1,6),(739,'Nova Russas','',NULL,1,6),(740,'Novo Oriente','',NULL,1,6),(741,'Ocara','',NULL,1,6),(742,'Orós','',NULL,1,6),(743,'Pacajus','',NULL,1,6),(744,'Pacatuba','',NULL,1,6),(745,'Pacoti','',NULL,1,6),(746,'Pacujá','',NULL,1,6),(747,'Palhano','',NULL,1,6),(748,'Palmácia','',NULL,1,6),(749,'Paracuru','',NULL,1,6),(750,'Paraipaba','',NULL,1,6),(751,'Parambu','',NULL,1,6),(752,'Paramoti','',NULL,1,6),(753,'Pedra Branca','',NULL,1,6),(754,'Penaforte','',NULL,1,6),(755,'Pentecoste','',NULL,1,6),(756,'Pereiro','',NULL,1,6),(757,'Pindoretama','',NULL,1,6),(758,'Piquet Carneiro','',NULL,1,6),(759,'Pires Ferreira','',NULL,1,6),(760,'Poranga','',NULL,1,6),(761,'Porteiras','',NULL,1,6),(762,'Potengi','',NULL,1,6),(763,'Potiretama','',NULL,1,6),(764,'Quiterianópolis','',NULL,1,6),(765,'Quixadá','',NULL,1,6),(766,'Quixelô','',NULL,1,6),(767,'Quixeramobim','',NULL,1,6),(768,'Quixeré','',NULL,1,6),(769,'Redenção','',NULL,1,6),(770,'Reriutaba','',NULL,1,6),(771,'Russas','',NULL,1,6),(772,'Saboeiro','',NULL,1,6),(773,'Salitre','',NULL,1,6),(774,'Santa Quitéria','',NULL,1,6),(775,'Santana do Acaraú','',NULL,1,6),(776,'Santana do Cariri','',NULL,1,6),(777,'São Benedito','',NULL,1,6),(778,'São Gonçalo do Amarante','',NULL,1,6),(779,'São João do Jaguaribe','',NULL,1,6),(780,'São Luís do Curu','',NULL,1,6),(781,'Senador Pompeu','',NULL,1,6),(782,'Senador Sá','',NULL,1,6),(783,'Sobral','',NULL,1,6),(784,'Solonópole','',NULL,1,6),(785,'Tabuleiro do Norte','',NULL,1,6),(786,'Tamboril','',NULL,1,6),(787,'Tarrafas','',NULL,1,6),(788,'Tauá','',NULL,1,6),(789,'Tejuçuoca','',NULL,1,6),(790,'Tianguá','',NULL,1,6),(791,'Trairi','',NULL,1,6),(792,'Tururu','',NULL,1,6),(793,'Ubajara','',NULL,1,6),(794,'Umari','',NULL,1,6),(795,'Umirim','',NULL,1,6),(796,'Uruburetama','',NULL,1,6),(797,'Uruoca','',NULL,1,6),(798,'Varjota','',NULL,1,6),(799,'Várzea Alegre','',NULL,1,6),(800,'Viçosa do Ceará','',NULL,1,6),(801,'Brasília','',NULL,1,7),(802,'Afonso Cláudio','',NULL,1,8),(803,'Água Doce do Norte','',NULL,1,8),(804,'Águia Branca','',NULL,1,8),(805,'Alegre','',NULL,1,8),(806,'Alfredo Chaves','',NULL,1,8),(807,'Alto Rio Novo','',NULL,1,8),(808,'Anchieta','',NULL,1,8),(809,'Apiacá','',NULL,1,8),(810,'Aracruz','',NULL,1,8),(811,'Atilio Vivacqua','',NULL,1,8),(812,'Baixo Guandu','',NULL,1,8),(813,'Barra de São Francisco','',NULL,1,8),(814,'Boa Esperança','',NULL,1,8),(815,'Bom Jesus do Norte','',NULL,1,8),(816,'Brejetuba','',NULL,1,8),(817,'Cachoeiro de Itapemirim','',NULL,1,8),(818,'Cariacica','',NULL,1,8),(819,'Castelo','',NULL,1,8),(820,'Colatina','',NULL,1,8),(821,'Conceição da Barra','',NULL,1,8),(822,'Conceição do Castelo','',NULL,1,8),(823,'Divino de São Lourenço','',NULL,1,8),(824,'Domingos Martins','',NULL,1,8),(825,'Dores do Rio Preto','',NULL,1,8),(826,'Ecoporanga','',NULL,1,8),(827,'Fundão','',NULL,1,8),(828,'Guaçuí','',NULL,1,8),(829,'Guarapari','',NULL,1,8),(830,'Ibatiba','',NULL,1,8),(831,'Ibiraçu','',NULL,1,8),(832,'Ibitirama','',NULL,1,8),(833,'Iconha','',NULL,1,8),(834,'Irupi','',NULL,1,8),(835,'Itaguaçu','',NULL,1,8),(836,'Itapemirim','',NULL,1,8),(837,'Itarana','',NULL,1,8),(838,'Iúna','',NULL,1,8),(839,'Jaguaré','',NULL,1,8),(840,'Jerônimo Monteiro','',NULL,1,8),(841,'João Neiva','',NULL,1,8),(842,'Laranja da Terra','',NULL,1,8),(843,'Linhares','',NULL,1,8),(844,'Mantenópolis','',NULL,1,8),(845,'Marataízes','',NULL,1,8),(846,'Marechal Floriano','',NULL,1,8),(847,'Marilândia','',NULL,1,8),(848,'Mimoso do Sul','',NULL,1,8),(849,'Montanha','',NULL,1,8),(850,'Mucurici','',NULL,1,8),(851,'Muniz Freire','',NULL,1,8),(852,'Muqui','',NULL,1,8),(853,'Nova Venécia','',NULL,1,8),(854,'Pancas','',NULL,1,8),(855,'Pedro Canário','',NULL,1,8),(856,'Pinheiros','',NULL,1,8),(857,'Piúma','',NULL,1,8),(858,'Ponto Belo','',NULL,1,8),(859,'Presidente Kennedy','',NULL,1,8),(860,'Rio Bananal','',NULL,1,8),(861,'Rio Novo do Sul','',NULL,1,8),(862,'Santa Leopoldina','',NULL,1,8),(863,'Santa Maria de Jetibá','',NULL,1,8),(864,'Santa Teresa','',NULL,1,8),(865,'São Domingos do Norte','',NULL,1,8),(866,'São Gabriel da Palha','',NULL,1,8),(867,'São José do Calçado','',NULL,1,8),(868,'São Mateus','',NULL,1,8),(869,'São Roque do Canaã','',NULL,1,8),(870,'Serra','',NULL,1,8),(871,'Sooretama','',NULL,1,8),(872,'Vargem Alta','',NULL,1,8),(873,'Venda Nova do Imigrante','',NULL,1,8),(874,'Viana','',NULL,1,8),(875,'Vila Pavão','',NULL,1,8),(876,'Vila Valério','',NULL,1,8),(877,'Vila Velha','',NULL,1,8),(878,'Vitória','',NULL,1,8),(879,'Abadia de Goiás','',NULL,1,9),(880,'Abadiânia','',NULL,1,9),(881,'Acreúna','',NULL,1,9),(882,'Adelândia','',NULL,1,9),(883,'Água Fria de Goiás','',NULL,1,9),(884,'Água Limpa','',NULL,1,9),(885,'Águas Lindas de Goiás','',NULL,1,9),(886,'Alexânia','',NULL,1,9),(887,'Aloândia','',NULL,1,9),(888,'Alto Horizonte','',NULL,1,9),(889,'Alto Paraíso de Goiás','',NULL,1,9),(890,'Alvorada do Norte','',NULL,1,9),(891,'Amaralina','',NULL,1,9),(892,'Americano do Brasil','',NULL,1,9),(893,'Amorinópolis','',NULL,1,9),(894,'Anápolis','',NULL,1,9),(895,'Anhanguera','',NULL,1,9),(896,'Anicuns','',NULL,1,9),(897,'Aparecida de Goiânia','',NULL,1,9),(898,'Aparecida do Rio Doce','',NULL,1,9),(899,'Aporé','',NULL,1,9),(900,'Araçu','',NULL,1,9),(901,'Aragarças','',NULL,1,9),(902,'Aragoiânia','',NULL,1,9),(903,'Araguapaz','',NULL,1,9),(904,'Arenópolis','',NULL,1,9),(905,'Aruanã','',NULL,1,9),(906,'Aurilândia','',NULL,1,9),(907,'Avelinópolis','',NULL,1,9),(908,'Baliza','',NULL,1,9),(909,'Barro Alto','',NULL,1,9),(910,'Bela Vista de Goiás','',NULL,1,9),(911,'Bom Jardim de Goiás','',NULL,1,9),(912,'Bom Jesus de Goiás','',NULL,1,9),(913,'Bonfinópolis','',NULL,1,9),(914,'Bonópolis','',NULL,1,9),(915,'Brazabrantes','',NULL,1,9),(916,'Britânia','',NULL,1,9),(917,'Buriti Alegre','',NULL,1,9),(918,'Buriti de Goiás','',NULL,1,9),(919,'Buritinópolis','',NULL,1,9),(920,'Cabeceiras','',NULL,1,9),(921,'Cachoeira Alta','',NULL,1,9),(922,'Cachoeira de Goiás','',NULL,1,9),(923,'Cachoeira Dourada','',NULL,1,9),(924,'Caçu','',NULL,1,9),(925,'Caiapônia','',NULL,1,9),(926,'Caldas Novas','',NULL,1,9),(927,'Caldazinha','',NULL,1,9),(928,'Campestre de Goiás','',NULL,1,9),(929,'Campinaçu','',NULL,1,9),(930,'Campinorte','',NULL,1,9),(931,'Campo Alegre de Goiás','',NULL,1,9),(932,'Campos Belos','',NULL,1,9),(933,'Campos Verdes','',NULL,1,9),(934,'Carmo do Rio Verde','',NULL,1,9),(935,'Castelândia','',NULL,1,9),(936,'Catalão','',NULL,1,9),(937,'Caturaí','',NULL,1,9),(938,'Cavalcante','',NULL,1,9),(939,'Ceres','',NULL,1,9),(940,'Cezarina','',NULL,1,9),(941,'Chapadão do Céu','',NULL,1,9),(942,'Cidade Ocidental','',NULL,1,9),(943,'Cocalzinho de Goiás','',NULL,1,9),(944,'Colinas do Sul','',NULL,1,9),(945,'Córrego do Ouro','',NULL,1,9),(946,'Corumbá de Goiás','',NULL,1,9),(947,'Corumbaíba','',NULL,1,9),(948,'Cristalina','',NULL,1,9),(949,'Cristianópolis','',NULL,1,9),(950,'Crixás','',NULL,1,9),(951,'Cromínia','',NULL,1,9),(952,'Cumari','',NULL,1,9),(953,'Damianópolis','',NULL,1,9),(954,'Damolândia','',NULL,1,9),(955,'Davinópolis','',NULL,1,9),(956,'Diorama','',NULL,1,9),(957,'Divinópolis de Goiás','',NULL,1,9),(958,'Doverlândia','',NULL,1,9),(959,'Edealina','',NULL,1,9),(960,'Edéia','',NULL,1,9),(961,'Estrela do Norte','',NULL,1,9),(962,'Faina','',NULL,1,9),(963,'Fazenda Nova','',NULL,1,9),(964,'Firminópolis','',NULL,1,9),(965,'Flores de Goiás','',NULL,1,9),(966,'Formosa','',NULL,1,9),(967,'Formoso','',NULL,1,9),(968,'Goianápolis','',NULL,1,9),(969,'Goiandira','',NULL,1,9),(970,'Goianésia','',NULL,1,9),(971,'Goiânia','',NULL,1,9),(972,'Goianira','',NULL,1,9),(973,'Goiás','',NULL,1,9),(974,'Goiatuba','',NULL,1,9),(975,'Gouvelândia','',NULL,1,9),(976,'Guapó','',NULL,1,9),(977,'Guaraíta','',NULL,1,9),(978,'Guarani de Goiás','',NULL,1,9),(979,'Guarinos','',NULL,1,9),(980,'Heitoraí','',NULL,1,9),(981,'Hidrolândia','',NULL,1,9),(982,'Hidrolina','',NULL,1,9),(983,'Iaciara','',NULL,1,9),(984,'Inaciolândia','',NULL,1,9),(985,'Indiara','',NULL,1,9),(986,'Inhumas','',NULL,1,9),(987,'Ipameri','',NULL,1,9),(988,'Iporá','',NULL,1,9),(989,'Israelândia','',NULL,1,9),(990,'Itaberaí','',NULL,1,9),(991,'Itaguari','',NULL,1,9),(992,'Itaguaru','',NULL,1,9),(993,'Itajá','',NULL,1,9),(994,'Itapaci','',NULL,1,9),(995,'Itapirapuã','',NULL,1,9),(996,'Itapuranga','',NULL,1,9),(997,'Itarumã','',NULL,1,9),(998,'Itauçu','',NULL,1,9),(999,'Itumbiara','',NULL,1,9),(1000,'Ivolândia','',NULL,1,9),(1001,'Jandaia','',NULL,1,9),(1002,'Jaraguá','',NULL,1,9),(1003,'Jataí','',NULL,1,9),(1004,'Jaupaci','',NULL,1,9),(1005,'Jesúpolis','',NULL,1,9),(1006,'Joviânia','',NULL,1,9),(1007,'Jussara','',NULL,1,9),(1008,'Leopoldo de Bulhões','',NULL,1,9),(1009,'Luziânia','',NULL,1,9),(1010,'Mairipotaba','',NULL,1,9),(1011,'Mambaí','',NULL,1,9),(1012,'Mara Rosa','',NULL,1,9),(1013,'Marzagão','',NULL,1,9),(1014,'Matrinchã','',NULL,1,9),(1015,'Maurilândia','',NULL,1,9),(1016,'Mimoso de Goiás','',NULL,1,9),(1017,'Minaçu','',NULL,1,9),(1018,'Mineiros','',NULL,1,9),(1019,'Moiporá','',NULL,1,9),(1020,'Monte Alegre de Goiás','',NULL,1,9),(1021,'Montes Claros de Goiás','',NULL,1,9),(1022,'Montividiu','',NULL,1,9),(1023,'Montividiu do Norte','',NULL,1,9),(1024,'Morrinhos','',NULL,1,9),(1025,'Morro Agudo de Goiás','',NULL,1,9),(1026,'Mossâmedes','',NULL,1,9),(1027,'Mozarlândia','',NULL,1,9),(1028,'Mundo Novo','',NULL,1,9),(1029,'Mutunópolis','',NULL,1,9),(1030,'Nazário','',NULL,1,9),(1031,'Nerópolis','',NULL,1,9),(1032,'Niquelândia','',NULL,1,9),(1033,'Nova América','',NULL,1,9),(1034,'Nova Aurora','',NULL,1,9),(1035,'Nova Crixás','',NULL,1,9),(1036,'Nova Glória','',NULL,1,9),(1037,'Nova Iguaçu de Goiás','',NULL,1,9),(1038,'Nova Roma','',NULL,1,9),(1039,'Nova Veneza','',NULL,1,9),(1040,'Novo Brasil','',NULL,1,9),(1041,'Novo Gama','',NULL,1,9),(1042,'Novo Planalto','',NULL,1,9),(1043,'Orizona','',NULL,1,9),(1044,'Ouro Verde de Goiás','',NULL,1,9),(1045,'Ouvidor','',NULL,1,9),(1046,'Padre Bernardo','',NULL,1,9),(1047,'Palestina de Goiás','',NULL,1,9),(1048,'Palmeiras de Goiás','',NULL,1,9),(1049,'Palmelo','',NULL,1,9),(1050,'Palminópolis','',NULL,1,9),(1051,'Panamá','',NULL,1,9),(1052,'Paranaiguara','',NULL,1,9),(1053,'Paraúna','',NULL,1,9),(1054,'Perolândia','',NULL,1,9),(1055,'Petrolina de Goiás','',NULL,1,9),(1056,'Pilar de Goiás','',NULL,1,9),(1057,'Piracanjuba','',NULL,1,9),(1058,'Piranhas','',NULL,1,9),(1059,'Pirenópolis','',NULL,1,9),(1060,'Pires do Rio','',NULL,1,9),(1061,'Planaltina','',NULL,1,9),(1062,'Pontalina','',NULL,1,9),(1063,'Porangatu','',NULL,1,9),(1064,'Porteirão','',NULL,1,9),(1065,'Portelândia','',NULL,1,9),(1066,'Posse','',NULL,1,9),(1067,'Professor Jamil','',NULL,1,9),(1068,'Quirinópolis','',NULL,1,9),(1069,'Rialma','',NULL,1,9),(1070,'Rianápolis','',NULL,1,9),(1071,'Rio Quente','',NULL,1,9),(1072,'Rio Verde','',NULL,1,9),(1073,'Rubiataba','',NULL,1,9),(1074,'Sanclerlândia','',NULL,1,9),(1075,'Santa Bárbara de Goiás','',NULL,1,9),(1076,'Santa Cruz de Goiás','',NULL,1,9),(1077,'Santa Fé de Goiás','',NULL,1,9),(1078,'Santa Helena de Goiás','',NULL,1,9),(1079,'Santa Isabel','',NULL,1,9),(1080,'Santa Rita do Araguaia','',NULL,1,9),(1081,'Santa Rita do Novo Destino','',NULL,1,9),(1082,'Santa Rosa de Goiás','',NULL,1,9),(1083,'Santa Tereza de Goiás','',NULL,1,9),(1084,'Santa Terezinha de Goiás','',NULL,1,9),(1085,'Santo Antônio da Barra','',NULL,1,9),(1086,'Santo Antônio de Goiás','',NULL,1,9),(1087,'Santo Antônio do Descoberto','',NULL,1,9),(1088,'São Domingos','',NULL,1,9),(1089,'São Francisco de Goiás','',NULL,1,9),(1090,'São João d`Aliança','',NULL,1,9),(1091,'São João da Paraúna','',NULL,1,9),(1092,'São Luís de Montes Belos','',NULL,1,9),(1093,'São Luíz do Norte','',NULL,1,9),(1094,'São Miguel do Araguaia','',NULL,1,9),(1095,'São Miguel do Passa Quatro','',NULL,1,9),(1096,'São Patrício','',NULL,1,9),(1097,'São Simão','',NULL,1,9),(1098,'Senador Canedo','',NULL,1,9),(1099,'Serranópolis','',NULL,1,9),(1100,'Silvânia','',NULL,1,9),(1101,'Simolândia','',NULL,1,9),(1102,'Sítio d`Abadia','',NULL,1,9),(1103,'Taquaral de Goiás','',NULL,1,9),(1104,'Teresina de Goiás','',NULL,1,9),(1105,'Terezópolis de Goiás','',NULL,1,9),(1106,'Três Ranchos','',NULL,1,9),(1107,'Trindade','',NULL,1,9),(1108,'Trombas','',NULL,1,9),(1109,'Turvânia','',NULL,1,9),(1110,'Turvelândia','',NULL,1,9),(1111,'Uirapuru','',NULL,1,9),(1112,'Uruaçu','',NULL,1,9),(1113,'Uruana','',NULL,1,9),(1114,'Urutaí','',NULL,1,9),(1115,'Valparaíso de Goiás','',NULL,1,9),(1116,'Varjão','',NULL,1,9),(1117,'Vianópolis','',NULL,1,9),(1118,'Vicentinópolis','',NULL,1,9),(1119,'Vila Boa','',NULL,1,9),(1120,'Vila Propício','',NULL,1,9),(1121,'Açailândia','',NULL,1,10),(1122,'Afonso Cunha','',NULL,1,10),(1123,'Água Doce do Maranhão','',NULL,1,10),(1124,'Alcântara','',NULL,1,10),(1125,'Aldeias Altas','',NULL,1,10),(1126,'Altamira do Maranhão','',NULL,1,10),(1127,'Alto Alegre do Maranhão','',NULL,1,10),(1128,'Alto Alegre do Pindaré','',NULL,1,10),(1129,'Alto Parnaíba','',NULL,1,10),(1130,'Amapá do Maranhão','',NULL,1,10),(1131,'Amarante do Maranhão','',NULL,1,10),(1132,'Anajatuba','',NULL,1,10),(1133,'Anapurus','',NULL,1,10),(1134,'Apicum-Açu','',NULL,1,10),(1135,'Araguanã','',NULL,1,10),(1136,'Araioses','',NULL,1,10),(1137,'Arame','',NULL,1,10),(1138,'Arari','',NULL,1,10),(1139,'Axixá','',NULL,1,10),(1140,'Bacabal','',NULL,1,10),(1141,'Bacabeira','',NULL,1,10),(1142,'Bacuri','',NULL,1,10),(1143,'Bacurituba','',NULL,1,10),(1144,'Balsas','',NULL,1,10),(1145,'Barão de Grajaú','',NULL,1,10),(1146,'Barra do Corda','',NULL,1,10),(1147,'Barreirinhas','',NULL,1,10),(1148,'Bela Vista do Maranhão','',NULL,1,10),(1149,'Belágua','',NULL,1,10),(1150,'Benedito Leite','',NULL,1,10),(1151,'Bequimão','',NULL,1,10),(1152,'Bernardo do Mearim','',NULL,1,10),(1153,'Boa Vista do Gurupi','',NULL,1,10),(1154,'Bom Jardim','',NULL,1,10),(1155,'Bom Jesus das Selvas','',NULL,1,10),(1156,'Bom Lugar','',NULL,1,10),(1157,'Brejo','',NULL,1,10),(1158,'Brejo de Areia','',NULL,1,10),(1159,'Buriti','',NULL,1,10),(1160,'Buriti Bravo','',NULL,1,10),(1161,'Buriticupu','',NULL,1,10),(1162,'Buritirana','',NULL,1,10),(1163,'Cachoeira Grande','',NULL,1,10),(1164,'Cajapió','',NULL,1,10),(1165,'Cajari','',NULL,1,10),(1166,'Campestre do Maranhão','',NULL,1,10),(1167,'Cândido Mendes','',NULL,1,10),(1168,'Cantanhede','',NULL,1,10),(1169,'Capinzal do Norte','',NULL,1,10),(1170,'Carolina','',NULL,1,10),(1171,'Carutapera','',NULL,1,10),(1172,'Caxias','',NULL,1,10),(1173,'Cedral','',NULL,1,10),(1174,'Central do Maranhão','',NULL,1,10),(1175,'Centro do Guilherme','',NULL,1,10),(1176,'Centro Novo do Maranhão','',NULL,1,10),(1177,'Chapadinha','',NULL,1,10),(1178,'Cidelândia','',NULL,1,10),(1179,'Codó','',NULL,1,10),(1180,'Coelho Neto','',NULL,1,10),(1181,'Colinas','',NULL,1,10),(1182,'Conceição do Lago-Açu','',NULL,1,10),(1183,'Coroatá','',NULL,1,10),(1184,'Cururupu','',NULL,1,10),(1185,'Davinópolis','',NULL,1,10),(1186,'Dom Pedro','',NULL,1,10),(1187,'Duque Bacelar','',NULL,1,10),(1188,'Esperantinópolis','',NULL,1,10),(1189,'Estreito','',NULL,1,10),(1190,'Feira Nova do Maranhão','',NULL,1,10),(1191,'Fernando Falcão','',NULL,1,10),(1192,'Formosa da Serra Negra','',NULL,1,10),(1193,'Fortaleza dos Nogueiras','',NULL,1,10),(1194,'Fortuna','',NULL,1,10),(1195,'Godofredo Viana','',NULL,1,10),(1196,'Gonçalves Dias','',NULL,1,10),(1197,'Governador Archer','',NULL,1,10),(1198,'Governador Edison Lobão','',NULL,1,10),(1199,'Governador Eugênio Barros','',NULL,1,10),(1200,'Governador Luiz Rocha','',NULL,1,10),(1201,'Governador Newton Bello','',NULL,1,10),(1202,'Governador Nunes Freire','',NULL,1,10),(1203,'Graça Aranha','',NULL,1,10),(1204,'Grajaú','',NULL,1,10),(1205,'Guimarães','',NULL,1,10),(1206,'Humberto de Campos','',NULL,1,10),(1207,'Icatu','',NULL,1,10),(1208,'Igarapé do Meio','',NULL,1,10),(1209,'Igarapé Grande','',NULL,1,10),(1210,'Imperatriz','',NULL,1,10),(1211,'Itaipava do Grajaú','',NULL,1,10),(1212,'Itapecuru Mirim','',NULL,1,10),(1213,'Itinga do Maranhão','',NULL,1,10),(1214,'Jatobá','',NULL,1,10),(1215,'Jenipapo dos Vieiras','',NULL,1,10),(1216,'João Lisboa','',NULL,1,10),(1217,'Joselândia','',NULL,1,10),(1218,'Junco do Maranhão','',NULL,1,10),(1219,'Lago da Pedra','',NULL,1,10),(1220,'Lago do Junco','',NULL,1,10),(1221,'Lago dos Rodrigues','',NULL,1,10),(1222,'Lago Verde','',NULL,1,10),(1223,'Lagoa do Mato','',NULL,1,10),(1224,'Lagoa Grande do Maranhão','',NULL,1,10),(1225,'Lajeado Novo','',NULL,1,10),(1226,'Lima Campos','',NULL,1,10),(1227,'Loreto','',NULL,1,10),(1228,'Luís Domingues','',NULL,1,10),(1229,'Magalhães de Almeida','',NULL,1,10),(1230,'Maracaçumé','',NULL,1,10),(1231,'Marajá do Sena','',NULL,1,10),(1232,'Maranhãozinho','',NULL,1,10),(1233,'Mata Roma','',NULL,1,10),(1234,'Matinha','',NULL,1,10),(1235,'Matões','',NULL,1,10),(1236,'Matões do Norte','',NULL,1,10),(1237,'Milagres do Maranhão','',NULL,1,10),(1238,'Mirador','',NULL,1,10),(1239,'Miranda do Norte','',NULL,1,10),(1240,'Mirinzal','',NULL,1,10),(1241,'Monção','',NULL,1,10),(1242,'Montes Altos','',NULL,1,10),(1243,'Morros','',NULL,1,10),(1244,'Nina Rodrigues','',NULL,1,10),(1245,'Nova Colinas','',NULL,1,10),(1246,'Nova Iorque','',NULL,1,10),(1247,'Nova Olinda do Maranhão','',NULL,1,10),(1248,'Olho d`Água das Cunhãs','',NULL,1,10),(1249,'Olinda Nova do Maranhão','',NULL,1,10),(1250,'Paço do Lumiar','',NULL,1,10),(1251,'Palmeirândia','',NULL,1,10),(1252,'Paraibano','',NULL,1,10),(1253,'Parnarama','',NULL,1,10),(1254,'Passagem Franca','',NULL,1,10),(1255,'Pastos Bons','',NULL,1,10),(1256,'Paulino Neves','',NULL,1,10),(1257,'Paulo Ramos','',NULL,1,10),(1258,'Pedreiras','',NULL,1,10),(1259,'Pedro do Rosário','',NULL,1,10),(1260,'Penalva','',NULL,1,10),(1261,'Peri Mirim','',NULL,1,10),(1262,'Peritoró','',NULL,1,10),(1263,'Pindaré-Mirim','',NULL,1,10),(1264,'Pinheiro','',NULL,1,10),(1265,'Pio XII','',NULL,1,10),(1266,'Pirapemas','',NULL,1,10),(1267,'Poção de Pedras','',NULL,1,10),(1268,'Porto Franco','',NULL,1,10),(1269,'Porto Rico do Maranhão','',NULL,1,10),(1270,'Presidente Dutra','',NULL,1,10),(1271,'Presidente Juscelino','',NULL,1,10),(1272,'Presidente Médici','',NULL,1,10),(1273,'Presidente Sarney','',NULL,1,10),(1274,'Presidente Vargas','',NULL,1,10),(1275,'Primeira Cruz','',NULL,1,10),(1276,'Raposa','',NULL,1,10),(1277,'Riachão','',NULL,1,10),(1278,'Ribamar Fiquene','',NULL,1,10),(1279,'Rosário','',NULL,1,10),(1280,'Sambaíba','',NULL,1,10),(1281,'Santa Filomena do Maranhão','',NULL,1,10),(1282,'Santa Helena','',NULL,1,10),(1283,'Santa Inês','',NULL,1,10),(1284,'Santa Luzia','',NULL,1,10),(1285,'Santa Luzia do Paruá','',NULL,1,10),(1286,'Santa Quitéria do Maranhão','',NULL,1,10),(1287,'Santa Rita','',NULL,1,10),(1288,'Santana do Maranhão','',NULL,1,10),(1289,'Santo Amaro do Maranhão','',NULL,1,10),(1290,'Santo Antônio dos Lopes','',NULL,1,10),(1291,'São Benedito do Rio Preto','',NULL,1,10),(1292,'São Bento','',NULL,1,10),(1293,'São Bernardo','',NULL,1,10),(1294,'São Domingos do Azeitão','',NULL,1,10),(1295,'São Domingos do Maranhão','',NULL,1,10),(1296,'São Félix de Balsas','',NULL,1,10),(1297,'São Francisco do Brejão','',NULL,1,10),(1298,'São Francisco do Maranhão','',NULL,1,10),(1299,'São João Batista','',NULL,1,10),(1300,'São João do Carú','',NULL,1,10),(1301,'São João do Paraíso','',NULL,1,10),(1302,'São João do Soter','',NULL,1,10),(1303,'São João dos Patos','',NULL,1,10),(1304,'São José de Ribamar','',NULL,1,10),(1305,'São José dos Basílios','',NULL,1,10),(1306,'São Luís','',NULL,1,10),(1307,'São Luís Gonzaga do Maranhão','',NULL,1,10),(1308,'São Mateus do Maranhão','',NULL,1,10),(1309,'São Pedro da Água Branca','',NULL,1,10),(1310,'São Pedro dos Crentes','',NULL,1,10),(1311,'São Raimundo das Mangabeiras','',NULL,1,10),(1312,'São Raimundo do Doca Bezerra','',NULL,1,10),(1313,'São Roberto','',NULL,1,10),(1314,'São Vicente Ferrer','',NULL,1,10),(1315,'Satubinha','',NULL,1,10),(1316,'Senador Alexandre Costa','',NULL,1,10),(1317,'Senador La Rocque','',NULL,1,10),(1318,'Serrano do Maranhão','',NULL,1,10),(1319,'Sítio Novo','',NULL,1,10),(1320,'Sucupira do Norte','',NULL,1,10),(1321,'Sucupira do Riachão','',NULL,1,10),(1322,'Tasso Fragoso','',NULL,1,10),(1323,'Timbiras','',NULL,1,10),(1324,'Timon','',NULL,1,10),(1325,'Trizidela do Vale','',NULL,1,10),(1326,'Tufilândia','',NULL,1,10),(1327,'Tuntum','',NULL,1,10),(1328,'Turiaçu','',NULL,1,10),(1329,'Turilândia','',NULL,1,10),(1330,'Tutóia','',NULL,1,10),(1331,'Urbano Santos','',NULL,1,10),(1332,'Vargem Grande','',NULL,1,10),(1333,'Viana','',NULL,1,10),(1334,'Vila Nova dos Martírios','',NULL,1,10),(1335,'Vitória do Mearim','',NULL,1,10),(1336,'Vitorino Freire','',NULL,1,10),(1337,'Zé Doca','',NULL,1,10),(1338,'Acorizal','',NULL,1,11),(1339,'Água Boa','',NULL,1,11),(1340,'Alta Floresta','',NULL,1,11),(1341,'Alto Araguaia','',NULL,1,11),(1342,'Alto Boa Vista','',NULL,1,11),(1343,'Alto Garças','',NULL,1,11),(1344,'Alto Paraguai','',NULL,1,11),(1345,'Alto Taquari','',NULL,1,11),(1346,'Apiacás','',NULL,1,11),(1347,'Araguaiana','',NULL,1,11),(1348,'Araguainha','',NULL,1,11),(1349,'Araputanga','',NULL,1,11),(1350,'Arenápolis','',NULL,1,11),(1351,'Aripuanã','',NULL,1,11),(1352,'Barão de Melgaço','',NULL,1,11),(1353,'Barra do Bugres','',NULL,1,11),(1354,'Barra do Garças','',NULL,1,11),(1355,'Brasnorte','',NULL,1,11),(1356,'Cáceres','',NULL,1,11),(1357,'Campinápolis','',NULL,1,11),(1358,'Campo Novo do Parecis','',NULL,1,11),(1359,'Campo Verde','',NULL,1,11),(1360,'Campos de Júlio','',NULL,1,11),(1361,'Canabrava do Norte','',NULL,1,11),(1362,'Canarana','',NULL,1,11),(1363,'Carlinda','',NULL,1,11),(1364,'Castanheira','',NULL,1,11),(1365,'Chapada dos Guimarães','',NULL,1,11),(1366,'Cláudia','',NULL,1,11),(1367,'Cocalinho','',NULL,1,11),(1368,'Colíder','',NULL,1,11),(1369,'Comodoro','',NULL,1,11),(1370,'Confresa','',NULL,1,11),(1371,'Cotriguaçu','',NULL,1,11),(1372,'Cuiabá','',NULL,1,11),(1373,'Denise','',NULL,1,11),(1374,'Diamantino','',NULL,1,11),(1375,'Dom Aquino','',NULL,1,11),(1376,'Feliz Natal','',NULL,1,11),(1377,'Figueirópolis d`Oeste','',NULL,1,11),(1378,'Gaúcha do Norte','',NULL,1,11),(1379,'General Carneiro','',NULL,1,11),(1380,'Glória d`Oeste','',NULL,1,11),(1381,'Guarantã do Norte','',NULL,1,11),(1382,'Guiratinga','',NULL,1,11),(1383,'Indiavaí','',NULL,1,11),(1384,'Itaúba','',NULL,1,11),(1385,'Itiquira','',NULL,1,11),(1386,'Jaciara','',NULL,1,11),(1387,'Jangada','',NULL,1,11),(1388,'Jauru','',NULL,1,11),(1389,'Juara','',NULL,1,11),(1390,'Juína','',NULL,1,11),(1391,'Juruena','',NULL,1,11),(1392,'Juscimeira','',NULL,1,11),(1393,'Lambari d`Oeste','',NULL,1,11),(1394,'Lucas do Rio Verde','',NULL,1,11),(1395,'Luciára','',NULL,1,11),(1396,'Marcelândia','',NULL,1,11),(1397,'Matupá','',NULL,1,11),(1398,'Mirassol d`Oeste','',NULL,1,11),(1399,'Nobres','',NULL,1,11),(1400,'Nortelândia','',NULL,1,11),(1401,'Nossa Senhora do Livramento','',NULL,1,11),(1402,'Nova Bandeirantes','',NULL,1,11),(1403,'Nova Brasilândia','',NULL,1,11),(1404,'Nova Canaã do Norte','',NULL,1,11),(1405,'Nova Guarita','',NULL,1,11),(1406,'Nova Lacerda','',NULL,1,11),(1407,'Nova Marilândia','',NULL,1,11),(1408,'Nova Maringá','',NULL,1,11),(1409,'Nova Monte Verde','',NULL,1,11),(1410,'Nova Mutum','',NULL,1,11),(1411,'Nova Olímpia','',NULL,1,11),(1412,'Nova Ubiratã','',NULL,1,11),(1413,'Nova Xavantina','',NULL,1,11),(1414,'Novo Horizonte do Norte','',NULL,1,11),(1415,'Novo Mundo','',NULL,1,11),(1416,'Novo São Joaquim','',NULL,1,11),(1417,'Paranaíta','',NULL,1,11),(1418,'Paranatinga','',NULL,1,11),(1419,'Pedra Preta','',NULL,1,11),(1420,'Peixoto de Azevedo','',NULL,1,11),(1421,'Planalto da Serra','',NULL,1,11),(1422,'Poconé','',NULL,1,11),(1423,'Pontal do Araguaia','',NULL,1,11),(1424,'Ponte Branca','',NULL,1,11),(1425,'Pontes e Lacerda','',NULL,1,11),(1426,'Porto Alegre do Norte','',NULL,1,11),(1427,'Porto dos Gaúchos','',NULL,1,11),(1428,'Porto Esperidião','',NULL,1,11),(1429,'Porto Estrela','',NULL,1,11),(1430,'Poxoréo','',NULL,1,11),(1431,'Primavera do Leste','',NULL,1,11),(1432,'Querência','',NULL,1,11),(1433,'Reserva do Cabaçal','',NULL,1,11),(1434,'Ribeirão Cascalheira','',NULL,1,11),(1435,'Ribeirãozinho','',NULL,1,11),(1436,'Rio Branco','',NULL,1,11),(1437,'Rondonópolis','',NULL,1,11),(1438,'Rosário Oeste','',NULL,1,11),(1439,'Salto do Céu','',NULL,1,11),(1440,'Santa Carmem','',NULL,1,11),(1441,'Santa Terezinha','',NULL,1,11),(1442,'Santo Afonso','',NULL,1,11),(1443,'Santo Antônio do Leverger','',NULL,1,11),(1444,'São Félix do Araguaia','',NULL,1,11),(1445,'São José do Povo','',NULL,1,11),(1446,'São José do Rio Claro','',NULL,1,11),(1447,'São José do Xingu','',NULL,1,11),(1448,'São José dos Quatro Marcos','',NULL,1,11),(1449,'São Pedro da Cipa','',NULL,1,11),(1450,'Sapezal','',NULL,1,11),(1451,'Sinop','',NULL,1,11),(1452,'Sorriso','',NULL,1,11),(1453,'Tabaporã','',NULL,1,11),(1454,'Tangará da Serra','',NULL,1,11),(1455,'Tapurah','',NULL,1,11),(1456,'Terra Nova do Norte','',NULL,1,11),(1457,'Tesouro','',NULL,1,11),(1458,'Torixoréu','',NULL,1,11),(1459,'União do Sul','',NULL,1,11),(1460,'Várzea Grande','',NULL,1,11),(1461,'Vera','',NULL,1,11),(1462,'Vila Bela da Santíssima Trindade','',NULL,1,11),(1463,'Vila Rica','',NULL,1,11),(1464,'Água Clara','',NULL,1,12),(1465,'Alcinópolis','',NULL,1,12),(1466,'Amambaí','',NULL,1,12),(1467,'Anastácio','',NULL,1,12),(1468,'Anaurilândia','',NULL,1,12),(1469,'Angélica','',NULL,1,12),(1470,'Antônio João','',NULL,1,12),(1471,'Aparecida do Taboado','',NULL,1,12),(1472,'Aquidauana','',NULL,1,12),(1473,'Aral Moreira','',NULL,1,12),(1474,'Bandeirantes','',NULL,1,12),(1475,'Bataguassu','',NULL,1,12),(1476,'Bataiporã','',NULL,1,12),(1477,'Bela Vista','',NULL,1,12),(1478,'Bodoquena','',NULL,1,12),(1479,'Bonito','',NULL,1,12),(1480,'Brasilândia','',NULL,1,12),(1481,'Caarapó','',NULL,1,12),(1482,'Camapuã','',NULL,1,12),(1483,'Campo Grande','',NULL,1,12),(1484,'Caracol','',NULL,1,12),(1485,'Cassilândia','',NULL,1,12),(1486,'Chapadão do Sul','',NULL,1,12),(1487,'Corguinho','',NULL,1,12),(1488,'Coronel Sapucaia','',NULL,1,12),(1489,'Corumbá','',NULL,1,12),(1490,'Costa Rica','',NULL,1,12),(1491,'Coxim','',NULL,1,12),(1492,'Deodápolis','',NULL,1,12),(1493,'Dois Irmãos do Buriti','',NULL,1,12),(1494,'Douradina','',NULL,1,12),(1495,'Dourados','',NULL,1,12),(1496,'Eldorado','',NULL,1,12),(1497,'Fátima do Sul','',NULL,1,12),(1498,'Glória de Dourados','',NULL,1,12),(1499,'Guia Lopes da Laguna','',NULL,1,12),(1500,'Iguatemi','',NULL,1,12),(1501,'Inocência','',NULL,1,12),(1502,'Itaporã','',NULL,1,12),(1503,'Itaquiraí','',NULL,1,12),(1504,'Ivinhema','',NULL,1,12),(1505,'Japorã','',NULL,1,12),(1506,'Jaraguari','',NULL,1,12),(1507,'Jardim','',NULL,1,12),(1508,'Jateí','',NULL,1,12),(1509,'Juti','',NULL,1,12),(1510,'Ladário','',NULL,1,12),(1511,'Laguna Carapã','',NULL,1,12),(1512,'Maracaju','',NULL,1,12),(1513,'Miranda','',NULL,1,12),(1514,'Mundo Novo','',NULL,1,12),(1515,'Naviraí','',NULL,1,12),(1516,'Nioaque','',NULL,1,12),(1517,'Nova Alvorada do Sul','',NULL,1,12),(1518,'Nova Andradina','',NULL,1,12),(1519,'Novo Horizonte do Sul','',NULL,1,12),(1520,'Paranaíba','',NULL,1,12),(1521,'Paranhos','',NULL,1,12),(1522,'Pedro Gomes','',NULL,1,12),(1523,'Ponta Porã','',NULL,1,12),(1524,'Porto Murtinho','',NULL,1,12),(1525,'Ribas do Rio Pardo','',NULL,1,12),(1526,'Rio Brilhante','',NULL,1,12),(1527,'Rio Negro','',NULL,1,12),(1528,'Rio Verde de Mato Grosso','',NULL,1,12),(1529,'Rochedo','',NULL,1,12),(1530,'Santa Rita do Pardo','',NULL,1,12),(1531,'São Gabriel do Oeste','',NULL,1,12),(1532,'Selvíria','',NULL,1,12),(1533,'Sete Quedas','',NULL,1,12),(1534,'Sidrolândia','',NULL,1,12),(1535,'Sonora','',NULL,1,12),(1536,'Tacuru','',NULL,1,12),(1537,'Taquarussu','',NULL,1,12),(1538,'Terenos','',NULL,1,12),(1539,'Três Lagoas','',NULL,1,12),(1540,'Vicentina','',NULL,1,12),(1541,'Abadia dos Dourados','',NULL,1,13),(1542,'Abaeté','',NULL,1,13),(1543,'Abre Campo','',NULL,1,13),(1544,'Acaiaca','',NULL,1,13),(1545,'Açucena','',NULL,1,13),(1546,'Água Boa','',NULL,1,13),(1547,'Água Comprida','',NULL,1,13),(1548,'Aguanil','',NULL,1,13),(1549,'Águas Formosas','',NULL,1,13),(1550,'Águas Vermelhas','',NULL,1,13),(1551,'Aimorés','',NULL,1,13),(1552,'Aiuruoca','',NULL,1,13),(1553,'Alagoa','',NULL,1,13),(1554,'Albertina','',NULL,1,13),(1555,'Além Paraíba','',NULL,1,13),(1556,'Alfenas','',NULL,1,13),(1557,'Alfredo Vasconcelos','',NULL,1,13),(1558,'Almenara','',NULL,1,13),(1559,'Alpercata','',NULL,1,13),(1560,'Alpinópolis','',NULL,1,13),(1561,'Alterosa','',NULL,1,13),(1562,'Alto Caparaó','',NULL,1,13),(1563,'Alto Jequitibá','',NULL,1,13),(1564,'Alto Rio Doce','',NULL,1,13),(1565,'Alvarenga','',NULL,1,13),(1566,'Alvinópolis','',NULL,1,13),(1567,'Alvorada de Minas','',NULL,1,13),(1568,'Amparo do Serra','',NULL,1,13),(1569,'Andradas','',NULL,1,13),(1570,'Andrelândia','',NULL,1,13),(1571,'Angelândia','',NULL,1,13),(1572,'Antônio Carlos','',NULL,1,13),(1573,'Antônio Dias','',NULL,1,13),(1574,'Antônio Prado de Minas','',NULL,1,13),(1575,'Araçaí','',NULL,1,13),(1576,'Aracitaba','',NULL,1,13),(1577,'Araçuaí','',NULL,1,13),(1578,'Araguari','',NULL,1,13),(1579,'Arantina','',NULL,1,13),(1580,'Araponga','',NULL,1,13),(1581,'Araporã','',NULL,1,13),(1582,'Arapuá','',NULL,1,13),(1583,'Araújos','',NULL,1,13),(1584,'Araxá','',NULL,1,13),(1585,'Arceburgo','',NULL,1,13),(1586,'Arcos','',NULL,1,13),(1587,'Areado','',NULL,1,13),(1588,'Argirita','',NULL,1,13),(1589,'Aricanduva','',NULL,1,13),(1590,'Arinos','',NULL,1,13),(1591,'Astolfo Dutra','',NULL,1,13),(1592,'Ataléia','',NULL,1,13),(1593,'Augusto de Lima','',NULL,1,13),(1594,'Baependi','',NULL,1,13),(1595,'Baldim','',NULL,1,13),(1596,'Bambuí','',NULL,1,13),(1597,'Bandeira','',NULL,1,13),(1598,'Bandeira do Sul','',NULL,1,13),(1599,'Barão de Cocais','',NULL,1,13),(1600,'Barão de Monte Alto','',NULL,1,13),(1601,'Barbacena','',NULL,1,13),(1602,'Barra Longa','',NULL,1,13),(1603,'Barroso','',NULL,1,13),(1604,'Bela Vista de Minas','',NULL,1,13),(1605,'Belmiro Braga','',NULL,1,13),(1606,'Belo Horizonte','',NULL,1,13),(1607,'Belo Oriente','',NULL,1,13),(1608,'Belo Vale','',NULL,1,13),(1609,'Berilo','',NULL,1,13),(1610,'Berizal','',NULL,1,13),(1611,'Bertópolis','',NULL,1,13),(1612,'Betim','',NULL,1,13),(1613,'Bias Fortes','',NULL,1,13),(1614,'Bicas','',NULL,1,13),(1615,'Biquinhas','',NULL,1,13),(1616,'Boa Esperança','',NULL,1,13),(1617,'Bocaina de Minas','',NULL,1,13),(1618,'Bocaiúva','',NULL,1,13),(1619,'Bom Despacho','',NULL,1,13),(1620,'Bom Jardim de Minas','',NULL,1,13),(1621,'Bom Jesus da Penha','',NULL,1,13),(1622,'Bom Jesus do Amparo','',NULL,1,13),(1623,'Bom Jesus do Galho','',NULL,1,13),(1624,'Bom Repouso','',NULL,1,13),(1625,'Bom Sucesso','',NULL,1,13),(1626,'Bonfim','',NULL,1,13),(1627,'Bonfinópolis de Minas','',NULL,1,13),(1628,'Bonito de Minas','',NULL,1,13),(1629,'Borda da Mata','',NULL,1,13),(1630,'Botelhos','',NULL,1,13),(1631,'Botumirim','',NULL,1,13),(1632,'Brás Pires','',NULL,1,13),(1633,'Brasilândia de Minas','',NULL,1,13),(1634,'Brasília de Minas','',NULL,1,13),(1635,'Brasópolis','',NULL,1,13),(1636,'Braúnas','',NULL,1,13),(1637,'Brumadinho','',NULL,1,13),(1638,'Bueno Brandão','',NULL,1,13),(1639,'Buenópolis','',NULL,1,13),(1640,'Bugre','',NULL,1,13),(1641,'Buritis','',NULL,1,13),(1642,'Buritizeiro','',NULL,1,13),(1643,'Cabeceira Grande','',NULL,1,13),(1644,'Cabo Verde','',NULL,1,13),(1645,'Cachoeira da Prata','',NULL,1,13),(1646,'Cachoeira de Minas','',NULL,1,13),(1647,'Cachoeira de Pajeú','',NULL,1,13),(1648,'Cachoeira Dourada','',NULL,1,13),(1649,'Caetanópolis','',NULL,1,13),(1650,'Caeté','',NULL,1,13),(1651,'Caiana','',NULL,1,13),(1652,'Cajuri','',NULL,1,13),(1653,'Caldas','',NULL,1,13),(1654,'Camacho','',NULL,1,13),(1655,'Camanducaia','',NULL,1,13),(1656,'Cambuí','',NULL,1,13),(1657,'Cambuquira','',NULL,1,13),(1658,'Campanário','',NULL,1,13),(1659,'Campanha','',NULL,1,13),(1660,'Campestre','',NULL,1,13),(1661,'Campina Verde','',NULL,1,13),(1662,'Campo Azul','',NULL,1,13),(1663,'Campo Belo','',NULL,1,13),(1664,'Campo do Meio','',NULL,1,13),(1665,'Campo Florido','',NULL,1,13),(1666,'Campos Altos','',NULL,1,13),(1667,'Campos Gerais','',NULL,1,13),(1668,'Cana Verde','',NULL,1,13),(1669,'Canaã','',NULL,1,13),(1670,'Canápolis','',NULL,1,13),(1671,'Candeias','',NULL,1,13),(1672,'Cantagalo','',NULL,1,13),(1673,'Caparaó','',NULL,1,13),(1674,'Capela Nova','',NULL,1,13),(1675,'Capelinha','',NULL,1,13),(1676,'Capetinga','',NULL,1,13),(1677,'Capim Branco','',NULL,1,13),(1678,'Capinópolis','',NULL,1,13),(1679,'Capitão Andrade','',NULL,1,13),(1680,'Capitão Enéas','',NULL,1,13),(1681,'Capitólio','',NULL,1,13),(1682,'Caputira','',NULL,1,13),(1683,'Caraí','',NULL,1,13),(1684,'Caranaíba','',NULL,1,13),(1685,'Carandaí','',NULL,1,13),(1686,'Carangola','',NULL,1,13),(1687,'Caratinga','',NULL,1,13),(1688,'Carbonita','',NULL,1,13),(1689,'Careaçu','',NULL,1,13),(1690,'Carlos Chagas','',NULL,1,13),(1691,'Carmésia','',NULL,1,13),(1692,'Carmo da Cachoeira','',NULL,1,13),(1693,'Carmo da Mata','',NULL,1,13),(1694,'Carmo de Minas','',NULL,1,13),(1695,'Carmo do Cajuru','',NULL,1,13),(1696,'Carmo do Paranaíba','',NULL,1,13),(1697,'Carmo do Rio Claro','',NULL,1,13),(1698,'Carmópolis de Minas','',NULL,1,13),(1699,'Carneirinho','',NULL,1,13),(1700,'Carrancas','',NULL,1,13),(1701,'Carvalhópolis','',NULL,1,13),(1702,'Carvalhos','',NULL,1,13),(1703,'Casa Grande','',NULL,1,13),(1704,'Cascalho Rico','',NULL,1,13),(1705,'Cássia','',NULL,1,13),(1706,'Cataguases','',NULL,1,13),(1707,'Catas Altas','',NULL,1,13),(1708,'Catas Altas da Noruega','',NULL,1,13),(1709,'Catuji','',NULL,1,13),(1710,'Catuti','',NULL,1,13),(1711,'Caxambu','',NULL,1,13),(1712,'Cedro do Abaeté','',NULL,1,13),(1713,'Central de Minas','',NULL,1,13),(1714,'Centralina','',NULL,1,13),(1715,'Chácara','',NULL,1,13),(1716,'Chalé','',NULL,1,13),(1717,'Chapada do Norte','',NULL,1,13),(1718,'Chapada Gaúcha','',NULL,1,13),(1719,'Chiador','',NULL,1,13),(1720,'Cipotânea','',NULL,1,13),(1721,'Claraval','',NULL,1,13),(1722,'Claro dos Poções','',NULL,1,13),(1723,'Cláudio','',NULL,1,13),(1724,'Coimbra','',NULL,1,13),(1725,'Coluna','',NULL,1,13),(1726,'Comendador Gomes','',NULL,1,13),(1727,'Comercinho','',NULL,1,13),(1728,'Conceição da Aparecida','',NULL,1,13),(1729,'Conceição da Barra de Minas','',NULL,1,13),(1730,'Conceição das Alagoas','',NULL,1,13),(1731,'Conceição das Pedras','',NULL,1,13),(1732,'Conceição de Ipanema','',NULL,1,13),(1733,'Conceição do Mato Dentro','',NULL,1,13),(1734,'Conceição do Pará','',NULL,1,13),(1735,'Conceição do Rio Verde','',NULL,1,13),(1736,'Conceição dos Ouros','',NULL,1,13),(1737,'Cônego Marinho','',NULL,1,13),(1738,'Confins','',NULL,1,13),(1739,'Congonhal','',NULL,1,13),(1740,'Congonhas','',NULL,1,13),(1741,'Congonhas do Norte','',NULL,1,13),(1742,'Conquista','',NULL,1,13),(1743,'Conselheiro Lafaiete','',NULL,1,13),(1744,'Conselheiro Pena','',NULL,1,13),(1745,'Consolação','',NULL,1,13),(1746,'Contagem','',NULL,1,13),(1747,'Coqueiral','',NULL,1,13),(1748,'Coração de Jesus','',NULL,1,13),(1749,'Cordisburgo','',NULL,1,13),(1750,'Cordislândia','',NULL,1,13),(1751,'Corinto','',NULL,1,13),(1752,'Coroaci','',NULL,1,13),(1753,'Coromandel','',NULL,1,13),(1754,'Coronel Fabriciano','',NULL,1,13),(1755,'Coronel Murta','',NULL,1,13),(1756,'Coronel Pacheco','',NULL,1,13),(1757,'Coronel Xavier Chaves','',NULL,1,13),(1758,'Córrego Danta','',NULL,1,13),(1759,'Córrego do Bom Jesus','',NULL,1,13),(1760,'Córrego Fundo','',NULL,1,13),(1761,'Córrego Novo','',NULL,1,13),(1762,'Couto de Magalhães de Minas','',NULL,1,13),(1763,'Crisólita','',NULL,1,13),(1764,'Cristais','',NULL,1,13),(1765,'Cristália','',NULL,1,13),(1766,'Cristiano Otoni','',NULL,1,13),(1767,'Cristina','',NULL,1,13),(1768,'Crucilândia','',NULL,1,13),(1769,'Cruzeiro da Fortaleza','',NULL,1,13),(1770,'Cruzília','',NULL,1,13),(1771,'Cuparaque','',NULL,1,13),(1772,'Curral de Dentro','',NULL,1,13),(1773,'Curvelo','',NULL,1,13),(1774,'Datas','',NULL,1,13),(1775,'Delfim Moreira','',NULL,1,13),(1776,'Delfinópolis','',NULL,1,13),(1777,'Delta','',NULL,1,13),(1778,'Descoberto','',NULL,1,13),(1779,'Desterro de Entre Rios','',NULL,1,13),(1780,'Desterro do Melo','',NULL,1,13),(1781,'Diamantina','',NULL,1,13),(1782,'Diogo de Vasconcelos','',NULL,1,13),(1783,'Dionísio','',NULL,1,13),(1784,'Divinésia','',NULL,1,13),(1785,'Divino','',NULL,1,13),(1786,'Divino das Laranjeiras','',NULL,1,13),(1787,'Divinolândia de Minas','',NULL,1,13),(1788,'Divinópolis','',NULL,1,13),(1789,'Divisa Alegre','',NULL,1,13),(1790,'Divisa Nova','',NULL,1,13),(1791,'Divisópolis','',NULL,1,13),(1792,'Dom Bosco','',NULL,1,13),(1793,'Dom Cavati','',NULL,1,13),(1794,'Dom Joaquim','',NULL,1,13),(1795,'Dom Silvério','',NULL,1,13),(1796,'Dom Viçoso','',NULL,1,13),(1797,'Dona Eusébia','',NULL,1,13),(1798,'Dores de Campos','',NULL,1,13),(1799,'Dores de Guanhães','',NULL,1,13),(1800,'Dores do Indaiá','',NULL,1,13),(1801,'Dores do Turvo','',NULL,1,13),(1802,'Doresópolis','',NULL,1,13),(1803,'Douradoquara','',NULL,1,13),(1804,'Durandé','',NULL,1,13),(1805,'Elói Mendes','',NULL,1,13),(1806,'Engenheiro Caldas','',NULL,1,13),(1807,'Engenheiro Navarro','',NULL,1,13),(1808,'Entre Folhas','',NULL,1,13),(1809,'Entre Rios de Minas','',NULL,1,13),(1810,'Ervália','',NULL,1,13),(1811,'Esmeraldas','',NULL,1,13),(1812,'Espera Feliz','',NULL,1,13),(1813,'Espinosa','',NULL,1,13),(1814,'Espírito Santo do Dourado','',NULL,1,13),(1815,'Estiva','',NULL,1,13),(1816,'Estrela Dalva','',NULL,1,13),(1817,'Estrela do Indaiá','',NULL,1,13),(1818,'Estrela do Sul','',NULL,1,13),(1819,'Eugenópolis','',NULL,1,13),(1820,'Ewbank da Câmara','',NULL,1,13),(1821,'Extrema','',NULL,1,13),(1822,'Fama','',NULL,1,13),(1823,'Faria Lemos','',NULL,1,13),(1824,'Felício dos Santos','',NULL,1,13),(1825,'Felisburgo','',NULL,1,13),(1826,'Felixlândia','',NULL,1,13),(1827,'Fernandes Tourinho','',NULL,1,13),(1828,'Ferros','',NULL,1,13),(1829,'Fervedouro','',NULL,1,13),(1830,'Florestal','',NULL,1,13),(1831,'Formiga','',NULL,1,13),(1832,'Formoso','',NULL,1,13),(1833,'Fortaleza de Minas','',NULL,1,13),(1834,'Fortuna de Minas','',NULL,1,13),(1835,'Francisco Badaró','',NULL,1,13),(1836,'Francisco Dumont','',NULL,1,13),(1837,'Francisco Sá','',NULL,1,13),(1838,'Franciscópolis','',NULL,1,13),(1839,'Frei Gaspar','',NULL,1,13),(1840,'Frei Inocêncio','',NULL,1,13),(1841,'Frei Lagonegro','',NULL,1,13),(1842,'Fronteira','',NULL,1,13),(1843,'Fronteira dos Vales','',NULL,1,13),(1844,'Fruta de Leite','',NULL,1,13),(1845,'Frutal','',NULL,1,13),(1846,'Funilândia','',NULL,1,13),(1847,'Galiléia','',NULL,1,13),(1848,'Gameleiras','',NULL,1,13),(1849,'Glaucilândia','',NULL,1,13),(1850,'Goiabeira','',NULL,1,13),(1851,'Goianá','',NULL,1,13),(1852,'Gonçalves','',NULL,1,13),(1853,'Gonzaga','',NULL,1,13),(1854,'Gouveia','',NULL,1,13),(1855,'Governador Valadares','',NULL,1,13),(1856,'Grão Mogol','',NULL,1,13),(1857,'Grupiara','',NULL,1,13),(1858,'Guanhães','',NULL,1,13),(1859,'Guapé','',NULL,1,13),(1860,'Guaraciaba','',NULL,1,13),(1861,'Guaraciama','',NULL,1,13),(1862,'Guaranésia','',NULL,1,13),(1863,'Guarani','',NULL,1,13),(1864,'Guarará','',NULL,1,13),(1865,'Guarda-Mor','',NULL,1,13),(1866,'Guaxupé','',NULL,1,13),(1867,'Guidoval','',NULL,1,13),(1868,'Guimarânia','',NULL,1,13),(1869,'Guiricema','',NULL,1,13),(1870,'Gurinhatã','',NULL,1,13),(1871,'Heliodora','',NULL,1,13),(1872,'Iapu','',NULL,1,13),(1873,'Ibertioga','',NULL,1,13),(1874,'Ibiá','',NULL,1,13),(1875,'Ibiaí','',NULL,1,13),(1876,'Ibiracatu','',NULL,1,13),(1877,'Ibiraci','',NULL,1,13),(1878,'Ibirité','',NULL,1,13),(1879,'Ibitiúra de Minas','',NULL,1,13),(1880,'Ibituruna','',NULL,1,13),(1881,'Icaraí de Minas','',NULL,1,13),(1882,'Igarapé','',NULL,1,13),(1883,'Igaratinga','',NULL,1,13),(1884,'Iguatama','',NULL,1,13),(1885,'Ijaci','',NULL,1,13),(1886,'Ilicínea','',NULL,1,13),(1887,'Imbé de Minas','',NULL,1,13),(1888,'Inconfidentes','',NULL,1,13),(1889,'Indaiabira','',NULL,1,13),(1890,'Indianópolis','',NULL,1,13),(1891,'Ingaí','',NULL,1,13),(1892,'Inhapim','',NULL,1,13),(1893,'Inhaúma','',NULL,1,13),(1894,'Inimutaba','',NULL,1,13),(1895,'Ipaba','',NULL,1,13),(1896,'Ipanema','',NULL,1,13),(1897,'Ipatinga','',NULL,1,13),(1898,'Ipiaçu','',NULL,1,13),(1899,'Ipuiúna','',NULL,1,13),(1900,'Iraí de Minas','',NULL,1,13),(1901,'Itabira','',NULL,1,13),(1902,'Itabirinha de Mantena','',NULL,1,13),(1903,'Itabirito','',NULL,1,13),(1904,'Itacambira','',NULL,1,13),(1905,'Itacarambi','',NULL,1,13),(1906,'Itaguara','',NULL,1,13),(1907,'Itaipé','',NULL,1,13),(1908,'Itajubá','',NULL,1,13),(1909,'Itamarandiba','',NULL,1,13),(1910,'Itamarati de Minas','',NULL,1,13),(1911,'Itambacuri','',NULL,1,13),(1912,'Itambé do Mato Dentro','',NULL,1,13),(1913,'Itamogi','',NULL,1,13),(1914,'Itamonte','',NULL,1,13),(1915,'Itanhandu','',NULL,1,13),(1916,'Itanhomi','',NULL,1,13),(1917,'Itaobim','',NULL,1,13),(1918,'Itapagipe','',NULL,1,13),(1919,'Itapecerica','',NULL,1,13),(1920,'Itapeva','',NULL,1,13),(1921,'Itatiaiuçu','',NULL,1,13),(1922,'Itaú de Minas','',NULL,1,13),(1923,'Itaúna','',NULL,1,13),(1924,'Itaverava','',NULL,1,13),(1925,'Itinga','',NULL,1,13),(1926,'Itueta','',NULL,1,13),(1927,'Ituiutaba','',NULL,1,13),(1928,'Itumirim','',NULL,1,13),(1929,'Iturama','',NULL,1,13),(1930,'Itutinga','',NULL,1,13),(1931,'Jaboticatubas','',NULL,1,13),(1932,'Jacinto','',NULL,1,13),(1933,'Jacuí','',NULL,1,13),(1934,'Jacutinga','',NULL,1,13),(1935,'Jaguaraçu','',NULL,1,13),(1936,'Jaíba','',NULL,1,13),(1937,'Jampruca','',NULL,1,13),(1938,'Janaúba','',NULL,1,13),(1939,'Januária','',NULL,1,13),(1940,'Japaraíba','',NULL,1,13),(1941,'Japonvar','',NULL,1,13),(1942,'Jeceaba','',NULL,1,13),(1943,'Jenipapo de Minas','',NULL,1,13),(1944,'Jequeri','',NULL,1,13),(1945,'Jequitaí','',NULL,1,13),(1946,'Jequitibá','',NULL,1,13),(1947,'Jequitinhonha','',NULL,1,13),(1948,'Jesuânia','',NULL,1,13),(1949,'Joaíma','',NULL,1,13),(1950,'Joanésia','',NULL,1,13),(1951,'João Monlevade','',NULL,1,13),(1952,'João Pinheiro','',NULL,1,13),(1953,'Joaquim Felício','',NULL,1,13),(1954,'Jordânia','',NULL,1,13),(1955,'José Gonçalves de Minas','',NULL,1,13),(1956,'José Raydan','',NULL,1,13),(1957,'Josenópolis','',NULL,1,13),(1958,'Juatuba','',NULL,1,13),(1959,'Juiz de Fora','',NULL,1,13),(1960,'Juramento','',NULL,1,13),(1961,'Juruaia','',NULL,1,13),(1962,'Juvenília','',NULL,1,13),(1963,'Ladainha','',NULL,1,13),(1964,'Lagamar','',NULL,1,13),(1965,'Lagoa da Prata','',NULL,1,13),(1966,'Lagoa dos Patos','',NULL,1,13),(1967,'Lagoa Dourada','',NULL,1,13),(1968,'Lagoa Formosa','',NULL,1,13),(1969,'Lagoa Grande','',NULL,1,13),(1970,'Lagoa Santa','',NULL,1,13),(1971,'Lajinha','',NULL,1,13),(1972,'Lambari','',NULL,1,13),(1973,'Lamim','',NULL,1,13),(1974,'Laranjal','',NULL,1,13),(1975,'Lassance','',NULL,1,13),(1976,'Lavras','',NULL,1,13),(1977,'Leandro Ferreira','',NULL,1,13),(1978,'Leme do Prado','',NULL,1,13),(1979,'Leopoldina','',NULL,1,13),(1980,'Liberdade','',NULL,1,13),(1981,'Lima Duarte','',NULL,1,13),(1982,'Limeira do Oeste','',NULL,1,13),(1983,'Lontra','',NULL,1,13),(1984,'Luisburgo','',NULL,1,13),(1985,'Luislândia','',NULL,1,13),(1986,'Luminárias','',NULL,1,13),(1987,'Luz','',NULL,1,13),(1988,'Machacalis','',NULL,1,13),(1989,'Machado','',NULL,1,13),(1990,'Madre de Deus de Minas','',NULL,1,13),(1991,'Malacacheta','',NULL,1,13),(1992,'Mamonas','',NULL,1,13),(1993,'Manga','',NULL,1,13),(1994,'Manhuaçu','',NULL,1,13),(1995,'Manhumirim','',NULL,1,13),(1996,'Mantena','',NULL,1,13),(1997,'Mar de Espanha','',NULL,1,13),(1998,'Maravilhas','',NULL,1,13),(1999,'Maria da Fé','',NULL,1,13),(2000,'Mariana','',NULL,1,13),(2001,'Marilac','',NULL,1,13),(2002,'Mário Campos','',NULL,1,13),(2003,'Maripá de Minas','',NULL,1,13),(2004,'Marliéria','',NULL,1,13),(2005,'Marmelópolis','',NULL,1,13),(2006,'Martinho Campos','',NULL,1,13),(2007,'Martins Soares','',NULL,1,13),(2008,'Mata Verde','',NULL,1,13),(2009,'Materlândia','',NULL,1,13),(2010,'Mateus Leme','',NULL,1,13),(2011,'Mathias Lobato','',NULL,1,13),(2012,'Matias Barbosa','',NULL,1,13),(2013,'Matias Cardoso','',NULL,1,13),(2014,'Matipó','',NULL,1,13),(2015,'Mato Verde','',NULL,1,13),(2016,'Matozinhos','',NULL,1,13),(2017,'Matutina','',NULL,1,13),(2018,'Medeiros','',NULL,1,13),(2019,'Medina','',NULL,1,13),(2020,'Mendes Pimentel','',NULL,1,13),(2021,'Mercês','',NULL,1,13),(2022,'Mesquita','',NULL,1,13),(2023,'Minas Novas','',NULL,1,13),(2024,'Minduri','',NULL,1,13),(2025,'Mirabela','',NULL,1,13),(2026,'Miradouro','',NULL,1,13),(2027,'Miraí','',NULL,1,13),(2028,'Miravânia','',NULL,1,13),(2029,'Moeda','',NULL,1,13),(2030,'Moema','',NULL,1,13),(2031,'Monjolos','',NULL,1,13),(2032,'Monsenhor Paulo','',NULL,1,13),(2033,'Montalvânia','',NULL,1,13),(2034,'Monte Alegre de Minas','',NULL,1,13),(2035,'Monte Azul','',NULL,1,13),(2036,'Monte Belo','',NULL,1,13),(2037,'Monte Carmelo','',NULL,1,13),(2038,'Monte Formoso','',NULL,1,13),(2039,'Monte Santo de Minas','',NULL,1,13),(2040,'Monte Sião','',NULL,1,13),(2041,'Montes Claros','',NULL,1,13),(2042,'Montezuma','',NULL,1,13),(2043,'Morada Nova de Minas','',NULL,1,13),(2044,'Morro da Garça','',NULL,1,13),(2045,'Morro do Pilar','',NULL,1,13),(2046,'Munhoz','',NULL,1,13),(2047,'Muriaé','',NULL,1,13),(2048,'Mutum','',NULL,1,13),(2049,'Muzambinho','',NULL,1,13),(2050,'Nacip Raydan','',NULL,1,13),(2051,'Nanuque','',NULL,1,13),(2052,'Naque','',NULL,1,13),(2053,'Natalândia','',NULL,1,13),(2054,'Natércia','',NULL,1,13),(2055,'Nazareno','',NULL,1,13),(2056,'Nepomuceno','',NULL,1,13),(2057,'Ninheira','',NULL,1,13),(2058,'Nova Belém','',NULL,1,13),(2059,'Nova Era','',NULL,1,13),(2060,'Nova Lima','',NULL,1,13),(2061,'Nova Módica','',NULL,1,13),(2062,'Nova Ponte','',NULL,1,13),(2063,'Nova Porteirinha','',NULL,1,13),(2064,'Nova Resende','',NULL,1,13),(2065,'Nova Serrana','',NULL,1,13),(2066,'Nova União','',NULL,1,13),(2067,'Novo Cruzeiro','',NULL,1,13),(2068,'Novo Oriente de Minas','',NULL,1,13),(2069,'Novorizonte','',NULL,1,13),(2070,'Olaria','',NULL,1,13),(2071,'Olhos-d`Água','',NULL,1,13),(2072,'Olímpio Noronha','',NULL,1,13),(2073,'Oliveira','',NULL,1,13),(2074,'Oliveira Fortes','',NULL,1,13),(2075,'Onça de Pitangui','',NULL,1,13),(2076,'Oratórios','',NULL,1,13),(2077,'Orizânia','',NULL,1,13),(2078,'Ouro Branco','',NULL,1,13),(2079,'Ouro Fino','',NULL,1,13),(2080,'Ouro Preto','',NULL,1,13),(2081,'Ouro Verde de Minas','',NULL,1,13),(2082,'Padre Carvalho','',NULL,1,13),(2083,'Padre Paraíso','',NULL,1,13),(2084,'Pai Pedro','',NULL,1,13),(2085,'Paineiras','',NULL,1,13),(2086,'Pains','',NULL,1,13),(2087,'Paiva','',NULL,1,13),(2088,'Palma','',NULL,1,13),(2089,'Palmópolis','',NULL,1,13),(2090,'Papagaios','',NULL,1,13),(2091,'Pará de Minas','',NULL,1,13),(2092,'Paracatu','',NULL,1,13),(2093,'Paraguaçu','',NULL,1,13),(2094,'Paraisópolis','',NULL,1,13),(2095,'Paraopeba','',NULL,1,13),(2096,'Passa Quatro','',NULL,1,13),(2097,'Passa Tempo','',NULL,1,13),(2098,'Passa-Vinte','',NULL,1,13),(2099,'Passabém','',NULL,1,13),(2100,'Passos','',NULL,1,13),(2101,'Patis','',NULL,1,13),(2102,'Patos de Minas','',NULL,1,13),(2103,'Patrocínio','',NULL,1,13),(2104,'Patrocínio do Muriaé','',NULL,1,13),(2105,'Paula Cândido','',NULL,1,13),(2106,'Paulistas','',NULL,1,13),(2107,'Pavão','',NULL,1,13),(2108,'Peçanha','',NULL,1,13),(2109,'Pedra Azul','',NULL,1,13),(2110,'Pedra Bonita','',NULL,1,13),(2111,'Pedra do Anta','',NULL,1,13),(2112,'Pedra do Indaiá','',NULL,1,13),(2113,'Pedra Dourada','',NULL,1,13),(2114,'Pedralva','',NULL,1,13),(2115,'Pedras de Maria da Cruz','',NULL,1,13),(2116,'Pedrinópolis','',NULL,1,13),(2117,'Pedro Leopoldo','',NULL,1,13),(2118,'Pedro Teixeira','',NULL,1,13),(2119,'Pequeri','',NULL,1,13),(2120,'Pequi','',NULL,1,13),(2121,'Perdigão','',NULL,1,13),(2122,'Perdizes','',NULL,1,13),(2123,'Perdões','',NULL,1,13),(2124,'Periquito','',NULL,1,13),(2125,'Pescador','',NULL,1,13),(2126,'Piau','',NULL,1,13),(2127,'Piedade de Caratinga','',NULL,1,13),(2128,'Piedade de Ponte Nova','',NULL,1,13),(2129,'Piedade do Rio Grande','',NULL,1,13),(2130,'Piedade dos Gerais','',NULL,1,13),(2131,'Pimenta','',NULL,1,13),(2132,'Pingo-d`Água','',NULL,1,13),(2133,'Pintópolis','',NULL,1,13),(2134,'Piracema','',NULL,1,13),(2135,'Pirajuba','',NULL,1,13),(2136,'Piranga','',NULL,1,13),(2137,'Piranguçu','',NULL,1,13),(2138,'Piranguinho','',NULL,1,13),(2139,'Pirapetinga','',NULL,1,13),(2140,'Pirapora','',NULL,1,13),(2141,'Piraúba','',NULL,1,13),(2142,'Pitangui','',NULL,1,13),(2143,'Piumhi','',NULL,1,13),(2144,'Planura','',NULL,1,13),(2145,'Poço Fundo','',NULL,1,13),(2146,'Poços de Caldas','',NULL,1,13),(2147,'Pocrane','',NULL,1,13),(2148,'Pompéu','',NULL,1,13),(2149,'Ponte Nova','',NULL,1,13),(2150,'Ponto Chique','',NULL,1,13),(2151,'Ponto dos Volantes','',NULL,1,13),(2152,'Porteirinha','',NULL,1,13),(2153,'Porto Firme','',NULL,1,13),(2154,'Poté','',NULL,1,13),(2155,'Pouso Alegre','',NULL,1,13),(2156,'Pouso Alto','',NULL,1,13),(2157,'Prados','',NULL,1,13),(2158,'Prata','',NULL,1,13),(2159,'Pratápolis','',NULL,1,13),(2160,'Pratinha','',NULL,1,13),(2161,'Presidente Bernardes','',NULL,1,13),(2162,'Presidente Juscelino','',NULL,1,13),(2163,'Presidente Kubitschek','',NULL,1,13),(2164,'Presidente Olegário','',NULL,1,13),(2165,'Prudente de Morais','',NULL,1,13),(2166,'Quartel Geral','',NULL,1,13),(2167,'Queluzito','',NULL,1,13),(2168,'Raposos','',NULL,1,13),(2169,'Raul Soares','',NULL,1,13),(2170,'Recreio','',NULL,1,13),(2171,'Reduto','',NULL,1,13),(2172,'Resende Costa','',NULL,1,13),(2173,'Resplendor','',NULL,1,13),(2174,'Ressaquinha','',NULL,1,13),(2175,'Riachinho','',NULL,1,13),(2176,'Riacho dos Machados','',NULL,1,13),(2177,'Ribeirão das Neves','',NULL,1,13),(2178,'Ribeirão Vermelho','',NULL,1,13),(2179,'Rio Acima','',NULL,1,13),(2180,'Rio Casca','',NULL,1,13),(2181,'Rio do Prado','',NULL,1,13),(2182,'Rio Doce','',NULL,1,13),(2183,'Rio Espera','',NULL,1,13),(2184,'Rio Manso','',NULL,1,13),(2185,'Rio Novo','',NULL,1,13),(2186,'Rio Paranaíba','',NULL,1,13),(2187,'Rio Pardo de Minas','',NULL,1,13),(2188,'Rio Piracicaba','',NULL,1,13),(2189,'Rio Pomba','',NULL,1,13),(2190,'Rio Preto','',NULL,1,13),(2191,'Rio Vermelho','',NULL,1,13),(2192,'Ritápolis','',NULL,1,13),(2193,'Rochedo de Minas','',NULL,1,13),(2194,'Rodeiro','',NULL,1,13),(2195,'Romaria','',NULL,1,13),(2196,'Rosário da Limeira','',NULL,1,13),(2197,'Rubelita','',NULL,1,13),(2198,'Rubim','',NULL,1,13),(2199,'Sabará','',NULL,1,13),(2200,'Sabinópolis','',NULL,1,13),(2201,'Sacramento','',NULL,1,13),(2202,'Salinas','',NULL,1,13),(2203,'Salto da Divisa','',NULL,1,13),(2204,'Santa Bárbara','',NULL,1,13),(2205,'Santa Bárbara do Leste','',NULL,1,13),(2206,'Santa Bárbara do Monte Verde','',NULL,1,13),(2207,'Santa Bárbara do Tugúrio','',NULL,1,13),(2208,'Santa Cruz de Minas','',NULL,1,13),(2209,'Santa Cruz de Salinas','',NULL,1,13),(2210,'Santa Cruz do Escalvado','',NULL,1,13),(2211,'Santa Efigênia de Minas','',NULL,1,13),(2212,'Santa Fé de Minas','',NULL,1,13),(2213,'Santa Helena de Minas','',NULL,1,13),(2214,'Santa Juliana','',NULL,1,13),(2215,'Santa Luzia','',NULL,1,13),(2216,'Santa Margarida','',NULL,1,13),(2217,'Santa Maria de Itabira','',NULL,1,13),(2218,'Santa Maria do Salto','',NULL,1,13),(2219,'Santa Maria do Suaçuí','',NULL,1,13),(2220,'Santa Rita de Caldas','',NULL,1,13),(2221,'Santa Rita de Ibitipoca','',NULL,1,13),(2222,'Santa Rita de Jacutinga','',NULL,1,13),(2223,'Santa Rita de Minas','',NULL,1,13),(2224,'Santa Rita do Itueto','',NULL,1,13),(2225,'Santa Rita do Sapucaí','',NULL,1,13),(2226,'Santa Rosa da Serra','',NULL,1,13),(2227,'Santa Vitória','',NULL,1,13),(2228,'Santana da Vargem','',NULL,1,13),(2229,'Santana de Cataguases','',NULL,1,13),(2230,'Santana de Pirapama','',NULL,1,13),(2231,'Santana do Deserto','',NULL,1,13),(2232,'Santana do Garambéu','',NULL,1,13),(2233,'Santana do Jacaré','',NULL,1,13),(2234,'Santana do Manhuaçu','',NULL,1,13),(2235,'Santana do Paraíso','',NULL,1,13),(2236,'Santana do Riacho','',NULL,1,13),(2237,'Santana dos Montes','',NULL,1,13),(2238,'Santo Antônio do Amparo','',NULL,1,13),(2239,'Santo Antônio do Aventureiro','',NULL,1,13),(2240,'Santo Antônio do Grama','',NULL,1,13),(2241,'Santo Antônio do Itambé','',NULL,1,13),(2242,'Santo Antônio do Jacinto','',NULL,1,13),(2243,'Santo Antônio do Monte','',NULL,1,13),(2244,'Santo Antônio do Retiro','',NULL,1,13),(2245,'Santo Antônio do Rio Abaixo','',NULL,1,13),(2246,'Santo Hipólito','',NULL,1,13),(2247,'Santos Dumont','',NULL,1,13),(2248,'São Bento Abade','',NULL,1,13),(2249,'São Brás do Suaçuí','',NULL,1,13),(2250,'São Domingos das Dores','',NULL,1,13),(2251,'São Domingos do Prata','',NULL,1,13),(2252,'São Félix de Minas','',NULL,1,13),(2253,'São Francisco','',NULL,1,13),(2254,'São Francisco de Paula','',NULL,1,13),(2255,'São Francisco de Sales','',NULL,1,13),(2256,'São Francisco do Glória','',NULL,1,13),(2257,'São Geraldo','',NULL,1,13),(2258,'São Geraldo da Piedade','',NULL,1,13),(2259,'São Geraldo do Baixio','',NULL,1,13),(2260,'São Gonçalo do Abaeté','',NULL,1,13),(2261,'São Gonçalo do Pará','',NULL,1,13),(2262,'São Gonçalo do Rio Abaixo','',NULL,1,13),(2263,'São Gonçalo do Rio Preto','',NULL,1,13),(2264,'São Gonçalo do Sapucaí','',NULL,1,13),(2265,'São Gotardo','',NULL,1,13),(2266,'São João Batista do Glória','',NULL,1,13),(2267,'São João da Lagoa','',NULL,1,13),(2268,'São João da Mata','',NULL,1,13),(2269,'São João da Ponte','',NULL,1,13),(2270,'São João das Missões','',NULL,1,13),(2271,'São João del Rei','',NULL,1,13),(2272,'São João do Manhuaçu','',NULL,1,13),(2273,'São João do Manteninha','',NULL,1,13),(2274,'São João do Oriente','',NULL,1,13),(2275,'São João do Pacuí','',NULL,1,13),(2276,'São João do Paraíso','',NULL,1,13),(2277,'São João Evangelista','',NULL,1,13),(2278,'São João Nepomuceno','',NULL,1,13),(2279,'São Joaquim de Bicas','',NULL,1,13),(2280,'São José da Barra','',NULL,1,13),(2281,'São José da Lapa','',NULL,1,13),(2282,'São José da Safira','',NULL,1,13),(2283,'São José da Varginha','',NULL,1,13),(2284,'São José do Alegre','',NULL,1,13),(2285,'São José do Divino','',NULL,1,13),(2286,'São José do Goiabal','',NULL,1,13),(2287,'São José do Jacuri','',NULL,1,13),(2288,'São José do Mantimento','',NULL,1,13),(2289,'São Lourenço','',NULL,1,13),(2290,'São Miguel do Anta','',NULL,1,13),(2291,'São Pedro da União','',NULL,1,13),(2292,'São Pedro do Suaçuí','',NULL,1,13),(2293,'São Pedro dos Ferros','',NULL,1,13),(2294,'São Romão','',NULL,1,13),(2295,'São Roque de Minas','',NULL,1,13),(2296,'São Sebastião da Bela Vista','',NULL,1,13),(2297,'São Sebastião da Vargem Alegre','',NULL,1,13),(2298,'São Sebastião do Anta','',NULL,1,13),(2299,'São Sebastião do Maranhão','',NULL,1,13),(2300,'São Sebastião do Oeste','',NULL,1,13),(2301,'São Sebastião do Paraíso','',NULL,1,13),(2302,'São Sebastião do Rio Preto','',NULL,1,13),(2303,'São Sebastião do Rio Verde','',NULL,1,13),(2304,'São Thomé das Letras','',NULL,1,13),(2305,'São Tiago','',NULL,1,13),(2306,'São Tomás de Aquino','',NULL,1,13),(2307,'São Vicente de Minas','',NULL,1,13),(2308,'Sapucaí-Mirim','',NULL,1,13),(2309,'Sardoá','',NULL,1,13),(2310,'Sarzedo','',NULL,1,13),(2311,'Sem-Peixe','',NULL,1,13),(2312,'Senador Amaral','',NULL,1,13),(2313,'Senador Cortes','',NULL,1,13),(2314,'Senador Firmino','',NULL,1,13),(2315,'Senador José Bento','',NULL,1,13),(2316,'Senador Modestino Gonçalves','',NULL,1,13),(2317,'Senhora de Oliveira','',NULL,1,13),(2318,'Senhora do Porto','',NULL,1,13),(2319,'Senhora dos Remédios','',NULL,1,13),(2320,'Sericita','',NULL,1,13),(2321,'Seritinga','',NULL,1,13),(2322,'Serra Azul de Minas','',NULL,1,13),(2323,'Serra da Saudade','',NULL,1,13),(2324,'Serra do Salitre','',NULL,1,13),(2325,'Serra dos Aimorés','',NULL,1,13),(2326,'Serrania','',NULL,1,13),(2327,'Serranópolis de Minas','',NULL,1,13),(2328,'Serranos','',NULL,1,13),(2329,'Serro','',NULL,1,13),(2330,'Sete Lagoas','',NULL,1,13),(2331,'Setubinha','',NULL,1,13),(2332,'Silveirânia','',NULL,1,13),(2333,'Silvianópolis','',NULL,1,13),(2334,'Simão Pereira','',NULL,1,13),(2335,'Simonésia','',NULL,1,13),(2336,'Sobrália','',NULL,1,13),(2337,'Soledade de Minas','',NULL,1,13),(2338,'Tabuleiro','',NULL,1,13),(2339,'Taiobeiras','',NULL,1,13),(2340,'Taparuba','',NULL,1,13),(2341,'Tapira','',NULL,1,13),(2342,'Tapiraí','',NULL,1,13),(2343,'Taquaraçu de Minas','',NULL,1,13),(2344,'Tarumirim','',NULL,1,13),(2345,'Teixeiras','',NULL,1,13),(2346,'Teófilo Otoni','',NULL,1,13),(2347,'Timóteo','',NULL,1,13),(2348,'Tiradentes','',NULL,1,13),(2349,'Tiros','',NULL,1,13),(2350,'Tocantins','',NULL,1,13),(2351,'Tocos do Moji','',NULL,1,13),(2352,'Toledo','',NULL,1,13),(2353,'Tombos','',NULL,1,13),(2354,'Três Corações','',NULL,1,13),(2355,'Três Marias','',NULL,1,13),(2356,'Três Pontas','',NULL,1,13),(2357,'Tumiritinga','',NULL,1,13),(2358,'Tupaciguara','',NULL,1,13),(2359,'Turmalina','',NULL,1,13),(2360,'Turvolândia','',NULL,1,13),(2361,'Ubá','',NULL,1,13),(2362,'Ubaí','',NULL,1,13),(2363,'Ubaporanga','',NULL,1,13),(2364,'Uberaba','',NULL,1,13),(2365,'Uberlândia','',NULL,1,13),(2366,'Umburatiba','',NULL,1,13),(2367,'Unaí','',NULL,1,13),(2368,'União de Minas','',NULL,1,13),(2369,'Uruana de Minas','',NULL,1,13),(2370,'Urucânia','',NULL,1,13),(2371,'Urucuia','',NULL,1,13),(2372,'Vargem Alegre','',NULL,1,13),(2373,'Vargem Bonita','',NULL,1,13),(2374,'Vargem Grande do Rio Pardo','',NULL,1,13),(2375,'Varginha','',NULL,1,13),(2376,'Varjão de Minas','',NULL,1,13),(2377,'Várzea da Palma','',NULL,1,13),(2378,'Varzelândia','',NULL,1,13),(2379,'Vazante','',NULL,1,13),(2380,'Verdelândia','',NULL,1,13),(2381,'Veredinha','',NULL,1,13),(2382,'Veríssimo','',NULL,1,13),(2383,'Vermelho Novo','',NULL,1,13),(2384,'Vespasiano','',NULL,1,13),(2385,'Viçosa','',NULL,1,13),(2386,'Vieiras','',NULL,1,13),(2387,'Virgem da Lapa','',NULL,1,13),(2388,'Virgínia','',NULL,1,13),(2389,'Virginópolis','',NULL,1,13),(2390,'Virgolândia','',NULL,1,13),(2391,'Visconde do Rio Branco','',NULL,1,13),(2392,'Volta Grande','',NULL,1,13),(2393,'Wenceslau Braz','',NULL,1,13),(2394,'Abaetetuba','',NULL,1,14),(2395,'Abel Figueiredo','',NULL,1,14),(2396,'Acará','',NULL,1,14),(2397,'Afuá','',NULL,1,14),(2398,'Água Azul do Norte','',NULL,1,14),(2399,'Alenquer','',NULL,1,14),(2400,'Almeirim','',NULL,1,14),(2401,'Altamira','',NULL,1,14),(2402,'Anajás','',NULL,1,14),(2403,'Ananindeua','',NULL,1,14),(2404,'Anapu','',NULL,1,14),(2405,'Augusto Corrêa','',NULL,1,14),(2406,'Aurora do Pará','',NULL,1,14),(2407,'Aveiro','',NULL,1,14),(2408,'Bagre','',NULL,1,14),(2409,'Baião','',NULL,1,14),(2410,'Bannach','',NULL,1,14),(2411,'Barcarena','',NULL,1,14),(2412,'Belém','',NULL,1,14),(2413,'Belterra','',NULL,1,14),(2414,'Benevides','',NULL,1,14),(2415,'Bom Jesus do Tocantins','',NULL,1,14),(2416,'Bonito','',NULL,1,14),(2417,'Bragança','',NULL,1,14),(2418,'Brasil Novo','',NULL,1,14),(2419,'Brejo Grande do Araguaia','',NULL,1,14),(2420,'Breu Branco','',NULL,1,14),(2421,'Breves','',NULL,1,14),(2422,'Bujaru','',NULL,1,14),(2423,'Cachoeira do Arari','',NULL,1,14),(2424,'Cachoeira do Piriá','',NULL,1,14),(2425,'Cametá','',NULL,1,14),(2426,'Canaã dos Carajás','',NULL,1,14),(2427,'Capanema','',NULL,1,14),(2428,'Capitão Poço','',NULL,1,14),(2429,'Castanhal','',NULL,1,14),(2430,'Chaves','',NULL,1,14),(2431,'Colares','',NULL,1,14),(2432,'Conceição do Araguaia','',NULL,1,14),(2433,'Concórdia do Pará','',NULL,1,14),(2434,'Cumaru do Norte','',NULL,1,14),(2435,'Curionópolis','',NULL,1,14),(2436,'Curralinho','',NULL,1,14),(2437,'Curuá','',NULL,1,14),(2438,'Curuçá','',NULL,1,14),(2439,'Dom Eliseu','',NULL,1,14),(2440,'Eldorado dos Carajás','',NULL,1,14),(2441,'Faro','',NULL,1,14),(2442,'Floresta do Araguaia','',NULL,1,14),(2443,'Garrafão do Norte','',NULL,1,14),(2444,'Goianésia do Pará','',NULL,1,14),(2445,'Gurupá','',NULL,1,14),(2446,'Igarapé-Açu','',NULL,1,14),(2447,'Igarapé-Miri','',NULL,1,14),(2448,'Inhangapi','',NULL,1,14),(2449,'Ipixuna do Pará','',NULL,1,14),(2450,'Irituia','',NULL,1,14),(2451,'Itaituba','',NULL,1,14),(2452,'Itupiranga','',NULL,1,14),(2453,'Jacareacanga','',NULL,1,14),(2454,'Jacundá','',NULL,1,14),(2455,'Juruti','',NULL,1,14),(2456,'Limoeiro do Ajuru','',NULL,1,14),(2457,'Mãe do Rio','',NULL,1,14),(2458,'Magalhães Barata','',NULL,1,14),(2459,'Marabá','',NULL,1,14),(2460,'Maracanã','',NULL,1,14),(2461,'Marapanim','',NULL,1,14),(2462,'Marituba','',NULL,1,14),(2463,'Medicilândia','',NULL,1,14),(2464,'Melgaço','',NULL,1,14),(2465,'Mocajuba','',NULL,1,14),(2466,'Moju','',NULL,1,14),(2467,'Monte Alegre','',NULL,1,14),(2468,'Muaná','',NULL,1,14),(2469,'Nova Esperança do Piriá','',NULL,1,14),(2470,'Nova Ipixuna','',NULL,1,14),(2471,'Nova Timboteua','',NULL,1,14),(2472,'Novo Progresso','',NULL,1,14),(2473,'Novo Repartimento','',NULL,1,14),(2474,'Óbidos','',NULL,1,14),(2475,'Oeiras do Pará','',NULL,1,14),(2476,'Oriximiná','',NULL,1,14),(2477,'Ourém','',NULL,1,14),(2478,'Ourilândia do Norte','',NULL,1,14),(2479,'Pacajá','',NULL,1,14),(2480,'Palestina do Pará','',NULL,1,14),(2481,'Paragominas','',NULL,1,14),(2482,'Parauapebas','',NULL,1,14),(2483,'Pau d`Arco','',NULL,1,14),(2484,'Peixe-Boi','',NULL,1,14),(2485,'Piçarra','',NULL,1,14),(2486,'Placas','',NULL,1,14),(2487,'Ponta de Pedras','',NULL,1,14),(2488,'Portel','',NULL,1,14),(2489,'Porto de Moz','',NULL,1,14),(2490,'Prainha','',NULL,1,14),(2491,'Primavera','',NULL,1,14),(2492,'Quatipuru','',NULL,1,14),(2493,'Redenção','',NULL,1,14),(2494,'Rio Maria','',NULL,1,14),(2495,'Rondon do Pará','',NULL,1,14),(2496,'Rurópolis','',NULL,1,14),(2497,'Salinópolis','',NULL,1,14),(2498,'Salvaterra','',NULL,1,14),(2499,'Santa Bárbara do Pará','',NULL,1,14),(2500,'Santa Cruz do Arari','',NULL,1,14),(2501,'Santa Isabel do Pará','',NULL,1,14),(2502,'Santa Luzia do Pará','',NULL,1,14),(2503,'Santa Maria das Barreiras','',NULL,1,14),(2504,'Santa Maria do Pará','',NULL,1,14),(2505,'Santana do Araguaia','',NULL,1,14),(2506,'Santarém','',NULL,1,14),(2507,'Santarém Novo','',NULL,1,14),(2508,'Santo Antônio do Tauá','',NULL,1,14),(2509,'São Caetano de Odivelas','',NULL,1,14),(2510,'São Domingos do Araguaia','',NULL,1,14),(2511,'São Domingos do Capim','',NULL,1,14),(2512,'São Félix do Xingu','',NULL,1,14),(2513,'São Francisco do Pará','',NULL,1,14),(2514,'São Geraldo do Araguaia','',NULL,1,14),(2515,'São João da Ponta','',NULL,1,14),(2516,'São João de Pirabas','',NULL,1,14),(2517,'São João do Araguaia','',NULL,1,14),(2518,'São Miguel do Guamá','',NULL,1,14),(2519,'São Sebastião da Boa Vista','',NULL,1,14),(2520,'Sapucaia','',NULL,1,14),(2521,'Senador José Porfírio','',NULL,1,14),(2522,'Soure','',NULL,1,14),(2523,'Tailândia','',NULL,1,14),(2524,'Terra Alta','',NULL,1,14),(2525,'Terra Santa','',NULL,1,14),(2526,'Tomé-Açu','',NULL,1,14),(2527,'Tracuateua','',NULL,1,14),(2528,'Trairão','',NULL,1,14),(2529,'Tucumã','',NULL,1,14),(2530,'Tucuruí','',NULL,1,14),(2531,'Ulianópolis','',NULL,1,14),(2532,'Uruará','',NULL,1,14),(2533,'Vigia','',NULL,1,14),(2534,'Viseu','',NULL,1,14),(2535,'Vitória do Xingu','',NULL,1,14),(2536,'Xinguara','',NULL,1,14),(2537,'Água Branca','',NULL,1,15),(2538,'Aguiar','',NULL,1,15),(2539,'Alagoa Grande','',NULL,1,15),(2540,'Alagoa Nova','',NULL,1,15),(2541,'Alagoinha','',NULL,1,15),(2542,'Alcantil','',NULL,1,15),(2543,'Algodão de Jandaíra','',NULL,1,15),(2544,'Alhandra','',NULL,1,15),(2545,'Amparo','',NULL,1,15),(2546,'Aparecida','',NULL,1,15),(2547,'Araçagi','',NULL,1,15),(2548,'Arara','',NULL,1,15),(2549,'Araruna','',NULL,1,15),(2550,'Areia','',NULL,1,15),(2551,'Areia de Baraúnas','',NULL,1,15),(2552,'Areial','',NULL,1,15),(2553,'Aroeiras','',NULL,1,15),(2554,'Assunção','',NULL,1,15),(2555,'Baía da Traição','',NULL,1,15),(2556,'Bananeiras','',NULL,1,15),(2557,'Baraúna','',NULL,1,15),(2558,'Barra de Santa Rosa','',NULL,1,15),(2559,'Barra de Santana','',NULL,1,15),(2560,'Barra de São Miguel','',NULL,1,15),(2561,'Bayeux','',NULL,1,15),(2562,'Belém','',NULL,1,15),(2563,'Belém do Brejo do Cruz','',NULL,1,15),(2564,'Bernardino Batista','',NULL,1,15),(2565,'Boa Ventura','',NULL,1,15),(2566,'Boa Vista','',NULL,1,15),(2567,'Bom Jesus','',NULL,1,15),(2568,'Bom Sucesso','',NULL,1,15),(2569,'Bonito de Santa Fé','',NULL,1,15),(2570,'Boqueirão','',NULL,1,15),(2571,'Borborema','',NULL,1,15),(2572,'Brejo do Cruz','',NULL,1,15),(2573,'Brejo dos Santos','',NULL,1,15),(2574,'Caaporã','',NULL,1,15),(2575,'Cabaceiras','',NULL,1,15),(2576,'Cabedelo','',NULL,1,15),(2577,'Cachoeira dos Índios','',NULL,1,15),(2578,'Cacimba de Areia','',NULL,1,15),(2579,'Cacimba de Dentro','',NULL,1,15),(2580,'Cacimbas','',NULL,1,15),(2581,'Caiçara','',NULL,1,15),(2582,'Cajazeiras','',NULL,1,15),(2583,'Cajazeirinhas','',NULL,1,15),(2584,'Caldas Brandão','',NULL,1,15),(2585,'Camalaú','',NULL,1,15),(2586,'Campina Grande','',NULL,1,15),(2587,'Campo de Santana','',NULL,1,15),(2588,'Capim','',NULL,1,15),(2589,'Caraúbas','',NULL,1,15),(2590,'Carrapateira','',NULL,1,15),(2591,'Casserengue','',NULL,1,15),(2592,'Catingueira','',NULL,1,15),(2593,'Catolé do Rocha','',NULL,1,15),(2594,'Caturité','',NULL,1,15),(2595,'Conceição','',NULL,1,15),(2596,'Condado','',NULL,1,15),(2597,'Conde','',NULL,1,15),(2598,'Congo','',NULL,1,15),(2599,'Coremas','',NULL,1,15),(2600,'Coxixola','',NULL,1,15),(2601,'Cruz do Espírito Santo','',NULL,1,15),(2602,'Cubati','',NULL,1,15),(2603,'Cuité','',NULL,1,15),(2604,'Cuité de Mamanguape','',NULL,1,15),(2605,'Cuitegi','',NULL,1,15),(2606,'Curral de Cima','',NULL,1,15),(2607,'Curral Velho','',NULL,1,15),(2608,'Damião','',NULL,1,15),(2609,'Desterro','',NULL,1,15),(2610,'Diamante','',NULL,1,15),(2611,'Dona Inês','',NULL,1,15),(2612,'Duas Estradas','',NULL,1,15),(2613,'Emas','',NULL,1,15),(2614,'Esperança','',NULL,1,15),(2615,'Fagundes','',NULL,1,15),(2616,'Frei Martinho','',NULL,1,15),(2617,'Gado Bravo','',NULL,1,15),(2618,'Guarabira','',NULL,1,15),(2619,'Gurinhém','',NULL,1,15),(2620,'Gurjão','',NULL,1,15),(2621,'Ibiara','',NULL,1,15),(2622,'Igaracy','',NULL,1,15),(2623,'Imaculada','',NULL,1,15),(2624,'Ingá','',NULL,1,15),(2625,'Itabaiana','',NULL,1,15),(2626,'Itaporanga','',NULL,1,15),(2627,'Itapororoca','',NULL,1,15),(2628,'Itatuba','',NULL,1,15),(2629,'Jacaraú','',NULL,1,15),(2630,'Jericó','',NULL,1,15),(2631,'João Pessoa','',NULL,1,15),(2632,'Juarez Távora','',NULL,1,15),(2633,'Juazeirinho','',NULL,1,15),(2634,'Junco do Seridó','',NULL,1,15),(2635,'Juripiranga','',NULL,1,15),(2636,'Juru','',NULL,1,15),(2637,'Lagoa','',NULL,1,15),(2638,'Lagoa de Dentro','',NULL,1,15),(2639,'Lagoa Seca','',NULL,1,15),(2640,'Lastro','',NULL,1,15),(2641,'Livramento','',NULL,1,15),(2642,'Logradouro','',NULL,1,15),(2643,'Lucena','',NULL,1,15),(2644,'Mãe d`Água','',NULL,1,15),(2645,'Malta','',NULL,1,15),(2646,'Mamanguape','',NULL,1,15),(2647,'Manaíra','',NULL,1,15),(2648,'Marcação','',NULL,1,15),(2649,'Mari','',NULL,1,15),(2650,'Marizópolis','',NULL,1,15),(2651,'Massaranduba','',NULL,1,15),(2652,'Mataraca','',NULL,1,15),(2653,'Matinhas','',NULL,1,15),(2654,'Mato Grosso','',NULL,1,15),(2655,'Maturéia','',NULL,1,15),(2656,'Mogeiro','',NULL,1,15),(2657,'Montadas','',NULL,1,15),(2658,'Monte Horebe','',NULL,1,15),(2659,'Monteiro','',NULL,1,15),(2660,'Mulungu','',NULL,1,15),(2661,'Natuba','',NULL,1,15),(2662,'Nazarezinho','',NULL,1,15),(2663,'Nova Floresta','',NULL,1,15),(2664,'Nova Olinda','',NULL,1,15),(2665,'Nova Palmeira','',NULL,1,15),(2666,'Olho d`Água','',NULL,1,15),(2667,'Olivedos','',NULL,1,15),(2668,'Ouro Velho','',NULL,1,15),(2669,'Parari','',NULL,1,15),(2670,'Passagem','',NULL,1,15),(2671,'Patos','',NULL,1,15),(2672,'Paulista','',NULL,1,15),(2673,'Pedra Branca','',NULL,1,15),(2674,'Pedra Lavrada','',NULL,1,15),(2675,'Pedras de Fogo','',NULL,1,15),(2676,'Pedro Régis','',NULL,1,15),(2677,'Piancó','',NULL,1,15),(2678,'Picuí','',NULL,1,15),(2679,'Pilar','',NULL,1,15),(2680,'Pilões','',NULL,1,15),(2681,'Pilõezinhos','',NULL,1,15),(2682,'Pirpirituba','',NULL,1,15),(2683,'Pitimbu','',NULL,1,15),(2684,'Pocinhos','',NULL,1,15),(2685,'Poço Dantas','',NULL,1,15),(2686,'Poço de José de Moura','',NULL,1,15),(2687,'Pombal','',NULL,1,15),(2688,'Prata','',NULL,1,15),(2689,'Princesa Isabel','',NULL,1,15),(2690,'Puxinanã','',NULL,1,15),(2691,'Queimadas','',NULL,1,15),(2692,'Quixabá','',NULL,1,15),(2693,'Remígio','',NULL,1,15),(2694,'Riachão','',NULL,1,15),(2695,'Riachão do Bacamarte','',NULL,1,15),(2696,'Riachão do Poço','',NULL,1,15),(2697,'Riacho de Santo Antônio','',NULL,1,15),(2698,'Riacho dos Cavalos','',NULL,1,15),(2699,'Rio Tinto','',NULL,1,15),(2700,'Salgadinho','',NULL,1,15),(2701,'Salgado de São Félix','',NULL,1,15),(2702,'Santa Cecília','',NULL,1,15),(2703,'Santa Cruz','',NULL,1,15),(2704,'Santa Helena','',NULL,1,15),(2705,'Santa Inês','',NULL,1,15),(2706,'Santa Luzia','',NULL,1,15),(2707,'Santa Rita','',NULL,1,15),(2708,'Santa Teresinha','',NULL,1,15),(2709,'Santana de Mangueira','',NULL,1,15),(2710,'Santana dos Garrotes','',NULL,1,15),(2711,'Santarém','',NULL,1,15),(2712,'Santo André','',NULL,1,15),(2713,'São Bentinho','',NULL,1,15),(2714,'São Bento','',NULL,1,15),(2715,'São Domingos de Pombal','',NULL,1,15),(2716,'São Domingos do Cariri','',NULL,1,15),(2717,'São Francisco','',NULL,1,15),(2718,'São João do Cariri','',NULL,1,15),(2719,'São João do Rio do Peixe','',NULL,1,15),(2720,'São João do Tigre','',NULL,1,15),(2721,'São José da Lagoa Tapada','',NULL,1,15),(2722,'São José de Caiana','',NULL,1,15),(2723,'São José de Espinharas','',NULL,1,15),(2724,'São José de Piranhas','',NULL,1,15),(2725,'São José de Princesa','',NULL,1,15),(2726,'São José do Bonfim','',NULL,1,15),(2727,'São José do Brejo do Cruz','',NULL,1,15),(2728,'São José do Sabugi','',NULL,1,15),(2729,'São José dos Cordeiros','',NULL,1,15),(2730,'São José dos Ramos','',NULL,1,15),(2731,'São Mamede','',NULL,1,15),(2732,'São Miguel de Taipu','',NULL,1,15),(2733,'São Sebastião de Lagoa de Roça','',NULL,1,15),(2734,'São Sebastião do Umbuzeiro','',NULL,1,15),(2735,'Sapé','',NULL,1,15),(2736,'Seridó','',NULL,1,15),(2737,'Serra Branca','',NULL,1,15),(2738,'Serra da Raiz','',NULL,1,15),(2739,'Serra Grande','',NULL,1,15),(2740,'Serra Redonda','',NULL,1,15),(2741,'Serraria','',NULL,1,15),(2742,'Sertãozinho','',NULL,1,15),(2743,'Sobrado','',NULL,1,15),(2744,'Solânea','',NULL,1,15),(2745,'Soledade','',NULL,1,15),(2746,'Sossêgo','',NULL,1,15),(2747,'Sousa','',NULL,1,15),(2748,'Sumé','',NULL,1,15),(2749,'Taperoá','',NULL,1,15),(2750,'Tavares','',NULL,1,15),(2751,'Teixeira','',NULL,1,15),(2752,'Tenório','',NULL,1,15),(2753,'Triunfo','',NULL,1,15),(2754,'Uiraúna','',NULL,1,15),(2755,'Umbuzeiro','',NULL,1,15),(2756,'Várzea','',NULL,1,15),(2757,'Vieirópolis','',NULL,1,15),(2758,'Vista Serrana','',NULL,1,15),(2759,'Zabelê','',NULL,1,15),(2760,'Abatiá','',NULL,1,16),(2761,'Adrianópolis','',NULL,1,16),(2762,'Agudos do Sul','',NULL,1,16),(2763,'Almirante Tamandaré','',NULL,1,16),(2764,'Altamira do Paraná','',NULL,1,16),(2765,'Alto Paraná','',NULL,1,16),(2766,'Alto Piquiri','',NULL,1,16),(2767,'Altônia','',NULL,1,16),(2768,'Alvorada do Sul','',NULL,1,16),(2769,'Amaporã','',NULL,1,16),(2770,'Ampére','',NULL,1,16),(2771,'Anahy','',NULL,1,16),(2772,'Andirá','',NULL,1,16),(2773,'Ângulo','',NULL,1,16),(2774,'Antonina','',NULL,1,16),(2775,'Antônio Olinto','',NULL,1,16),(2776,'Apucarana','',NULL,1,16),(2777,'Arapongas','',NULL,1,16),(2778,'Arapoti','',NULL,1,16),(2779,'Arapuã','',NULL,1,16),(2780,'Araruna','',NULL,1,16),(2781,'Araucária','',NULL,1,16),(2782,'Ariranha do Ivaí','',NULL,1,16),(2783,'Assaí','',NULL,1,16),(2784,'Assis Chateaubriand','',NULL,1,16),(2785,'Astorga','',NULL,1,16),(2786,'Atalaia','',NULL,1,16),(2787,'Balsa Nova','',NULL,1,16),(2788,'Bandeirantes','',NULL,1,16),(2789,'Barbosa Ferraz','',NULL,1,16),(2790,'Barra do Jacaré','',NULL,1,16),(2791,'Barracão','',NULL,1,16),(2792,'Bela Vista da Caroba','',NULL,1,16),(2793,'Bela Vista do Paraíso','',NULL,1,16),(2794,'Bituruna','',NULL,1,16),(2795,'Boa Esperança','',NULL,1,16),(2796,'Boa Esperança do Iguaçu','',NULL,1,16),(2797,'Boa Ventura de São Roque','',NULL,1,16),(2798,'Boa Vista da Aparecida','',NULL,1,16),(2799,'Bocaiúva do Sul','',NULL,1,16),(2800,'Bom Jesus do Sul','',NULL,1,16),(2801,'Bom Sucesso','',NULL,1,16),(2802,'Bom Sucesso do Sul','',NULL,1,16),(2803,'Borrazópolis','',NULL,1,16),(2804,'Braganey','',NULL,1,16),(2805,'Brasilândia do Sul','',NULL,1,16),(2806,'Cafeara','',NULL,1,16),(2807,'Cafelândia','',NULL,1,16),(2808,'Cafezal do Sul','',NULL,1,16),(2809,'Califórnia','',NULL,1,16),(2810,'Cambará','',NULL,1,16),(2811,'Cambé','',NULL,1,16),(2812,'Cambira','',NULL,1,16),(2813,'Campina da Lagoa','',NULL,1,16),(2814,'Campina do Simão','',NULL,1,16),(2815,'Campina Grande do Sul','',NULL,1,16),(2816,'Campo Bonito','',NULL,1,16),(2817,'Campo do Tenente','',NULL,1,16),(2818,'Campo Largo','',NULL,1,16),(2819,'Campo Magro','',NULL,1,16),(2820,'Campo Mourão','',NULL,1,16),(2821,'Cândido de Abreu','',NULL,1,16),(2822,'Candói','',NULL,1,16),(2823,'Cantagalo','',NULL,1,16),(2824,'Capanema','',NULL,1,16),(2825,'Capitão Leônidas Marques','',NULL,1,16),(2826,'Carambeí','',NULL,1,16),(2827,'Carlópolis','',NULL,1,16),(2828,'Cascavel','',NULL,1,16),(2829,'Castro','',NULL,1,16),(2830,'Catanduvas','',NULL,1,16),(2831,'Centenário do Sul','',NULL,1,16),(2832,'Cerro Azul','',NULL,1,16),(2833,'Céu Azul','',NULL,1,16),(2834,'Chopinzinho','',NULL,1,16),(2835,'Cianorte','',NULL,1,16),(2836,'Cidade Gaúcha','',NULL,1,16),(2837,'Clevelândia','',NULL,1,16),(2838,'Colombo','',NULL,1,16),(2839,'Colorado','',NULL,1,16),(2840,'Congonhinhas','',NULL,1,16),(2841,'Conselheiro Mairinck','',NULL,1,16),(2842,'Contenda','',NULL,1,16),(2843,'Corbélia','',NULL,1,16),(2844,'Cornélio Procópio','',NULL,1,16),(2845,'Coronel Domingos Soares','',NULL,1,16),(2846,'Coronel Vivida','',NULL,1,16),(2847,'Corumbataí do Sul','',NULL,1,16),(2848,'Cruz Machado','',NULL,1,16),(2849,'Cruzeiro do Iguaçu','',NULL,1,16),(2850,'Cruzeiro do Oeste','',NULL,1,16),(2851,'Cruzeiro do Sul','',NULL,1,16),(2852,'Cruzmaltina','',NULL,1,16),(2853,'Curitiba','',NULL,1,16),(2854,'Curiúva','',NULL,1,16),(2855,'Diamante d`Oeste','',NULL,1,16),(2856,'Diamante do Norte','',NULL,1,16),(2857,'Diamante do Sul','',NULL,1,16),(2858,'Dois Vizinhos','',NULL,1,16),(2859,'Douradina','',NULL,1,16),(2860,'Doutor Camargo','',NULL,1,16),(2861,'Doutor Ulysses','',NULL,1,16),(2862,'Enéas Marques','',NULL,1,16),(2863,'Engenheiro Beltrão','',NULL,1,16),(2864,'Entre Rios do Oeste','',NULL,1,16),(2865,'Esperança Nova','',NULL,1,16),(2866,'Espigão Alto do Iguaçu','',NULL,1,16),(2867,'Farol','',NULL,1,16),(2868,'Faxinal','',NULL,1,16),(2869,'Fazenda Rio Grande','',NULL,1,16),(2870,'Fênix','',NULL,1,16),(2871,'Fernandes Pinheiro','',NULL,1,16),(2872,'Figueira','',NULL,1,16),(2873,'Flor da Serra do Sul','',NULL,1,16),(2874,'Floraí','',NULL,1,16),(2875,'Floresta','',NULL,1,16),(2876,'Florestópolis','',NULL,1,16),(2877,'Flórida','',NULL,1,16),(2878,'Formosa do Oeste','',NULL,1,16),(2879,'Foz do Iguaçu','',NULL,1,16),(2880,'Foz do Jordão','',NULL,1,16),(2881,'Francisco Alves','',NULL,1,16),(2882,'Francisco Beltrão','',NULL,1,16),(2883,'General Carneiro','',NULL,1,16),(2884,'Godoy Moreira','',NULL,1,16),(2885,'Goioerê','',NULL,1,16),(2886,'Goioxim','',NULL,1,16),(2887,'Grandes Rios','',NULL,1,16),(2888,'Guaíra','',NULL,1,16),(2889,'Guairaçá','',NULL,1,16),(2890,'Guamiranga','',NULL,1,16),(2891,'Guapirama','',NULL,1,16),(2892,'Guaporema','',NULL,1,16),(2893,'Guaraci','',NULL,1,16),(2894,'Guaraniaçu','',NULL,1,16),(2895,'Guarapuava','',NULL,1,16),(2896,'Guaraqueçaba','',NULL,1,16),(2897,'Guaratuba','',NULL,1,16),(2898,'Honório Serpa','',NULL,1,16),(2899,'Ibaiti','',NULL,1,16),(2900,'Ibema','',NULL,1,16),(2901,'Ibiporã','',NULL,1,16),(2902,'Icaraíma','',NULL,1,16),(2903,'Iguaraçu','',NULL,1,16),(2904,'Iguatu','',NULL,1,16),(2905,'Imbaú','',NULL,1,16),(2906,'Imbituva','',NULL,1,16),(2907,'Inácio Martins','',NULL,1,16),(2908,'Inajá','',NULL,1,16),(2909,'Indianópolis','',NULL,1,16),(2910,'Ipiranga','',NULL,1,16),(2911,'Iporã','',NULL,1,16),(2912,'Iracema do Oeste','',NULL,1,16),(2913,'Irati','',NULL,1,16),(2914,'Iretama','',NULL,1,16),(2915,'Itaguajé','',NULL,1,16),(2916,'Itaipulândia','',NULL,1,16),(2917,'Itambaracá','',NULL,1,16),(2918,'Itambé','',NULL,1,16),(2919,'Itapejara d`Oeste','',NULL,1,16),(2920,'Itaperuçu','',NULL,1,16),(2921,'Itaúna do Sul','',NULL,1,16),(2922,'Ivaí','',NULL,1,16),(2923,'Ivaiporã','',NULL,1,16),(2924,'Ivaté','',NULL,1,16),(2925,'Ivatuba','',NULL,1,16),(2926,'Jaboti','',NULL,1,16),(2927,'Jacarezinho','',NULL,1,16),(2928,'Jaguapitã','',NULL,1,16),(2929,'Jaguariaíva','',NULL,1,16),(2930,'Jandaia do Sul','',NULL,1,16),(2931,'Janiópolis','',NULL,1,16),(2932,'Japira','',NULL,1,16),(2933,'Japurá','',NULL,1,16),(2934,'Jardim Alegre','',NULL,1,16),(2935,'Jardim Olinda','',NULL,1,16),(2936,'Jataizinho','',NULL,1,16),(2937,'Jesuítas','',NULL,1,16),(2938,'Joaquim Távora','',NULL,1,16),(2939,'Jundiaí do Sul','',NULL,1,16),(2940,'Juranda','',NULL,1,16),(2941,'Jussara','',NULL,1,16),(2942,'Kaloré','',NULL,1,16),(2943,'Lapa','',NULL,1,16),(2944,'Laranjal','',NULL,1,16),(2945,'Laranjeiras do Sul','',NULL,1,16),(2946,'Leópolis','',NULL,1,16),(2947,'Lidianópolis','',NULL,1,16),(2948,'Lindoeste','',NULL,1,16),(2949,'Loanda','',NULL,1,16),(2950,'Lobato','',NULL,1,16),(2951,'Londrina','',NULL,1,16),(2952,'Luiziana','',NULL,1,16),(2953,'Lunardelli','',NULL,1,16),(2954,'Lupionópolis','',NULL,1,16),(2955,'Mallet','',NULL,1,16),(2956,'Mamborê','',NULL,1,16),(2957,'Mandaguaçu','',NULL,1,16),(2958,'Mandaguari','',NULL,1,16),(2959,'Mandirituba','',NULL,1,16),(2960,'Manfrinópolis','',NULL,1,16),(2961,'Mangueirinha','',NULL,1,16),(2962,'Manoel Ribas','',NULL,1,16),(2963,'Marechal Cândido Rondon','',NULL,1,16),(2964,'Maria Helena','',NULL,1,16),(2965,'Marialva','',NULL,1,16),(2966,'Marilândia do Sul','',NULL,1,16),(2967,'Marilena','',NULL,1,16),(2968,'Mariluz','',NULL,1,16),(2969,'Maringá','',NULL,1,16),(2970,'Mariópolis','',NULL,1,16),(2971,'Maripá','',NULL,1,16),(2972,'Marmeleiro','',NULL,1,16),(2973,'Marquinho','',NULL,1,16),(2974,'Marumbi','',NULL,1,16),(2975,'Matelândia','',NULL,1,16),(2976,'Matinhos','',NULL,1,16),(2977,'Mato Rico','',NULL,1,16),(2978,'Mauá da Serra','',NULL,1,16),(2979,'Medianeira','',NULL,1,16),(2980,'Mercedes','',NULL,1,16),(2981,'Mirador','',NULL,1,16),(2982,'Miraselva','',NULL,1,16),(2983,'Missal','',NULL,1,16),(2984,'Moreira Sales','',NULL,1,16),(2985,'Morretes','',NULL,1,16),(2986,'Munhoz de Melo','',NULL,1,16),(2987,'Nossa Senhora das Graças','',NULL,1,16),(2988,'Nova Aliança do Ivaí','',NULL,1,16),(2989,'Nova América da Colina','',NULL,1,16),(2990,'Nova Aurora','',NULL,1,16),(2991,'Nova Cantu','',NULL,1,16),(2992,'Nova Esperança','',NULL,1,16),(2993,'Nova Esperança do Sudoeste','',NULL,1,16),(2994,'Nova Fátima','',NULL,1,16),(2995,'Nova Laranjeiras','',NULL,1,16),(2996,'Nova Londrina','',NULL,1,16),(2997,'Nova Olímpia','',NULL,1,16),(2998,'Nova Prata do Iguaçu','',NULL,1,16),(2999,'Nova Santa Bárbara','',NULL,1,16),(3000,'Nova Santa Rosa','',NULL,1,16),(3001,'Nova Tebas','',NULL,1,16),(3002,'Novo Itacolomi','',NULL,1,16),(3003,'Ortigueira','',NULL,1,16),(3004,'Ourizona','',NULL,1,16),(3005,'Ouro Verde do Oeste','',NULL,1,16),(3006,'Paiçandu','',NULL,1,16),(3007,'Palmas','',NULL,1,16),(3008,'Palmeira','',NULL,1,16),(3009,'Palmital','',NULL,1,16),(3010,'Palotina','',NULL,1,16),(3011,'Paraíso do Norte','',NULL,1,16),(3012,'Paranacity','',NULL,1,16),(3013,'Paranaguá','',NULL,1,16),(3014,'Paranapoema','',NULL,1,16),(3015,'Paranavaí','',NULL,1,16),(3016,'Pato Bragado','',NULL,1,16),(3017,'Pato Branco','',NULL,1,16),(3018,'Paula Freitas','',NULL,1,16),(3019,'Paulo Frontin','',NULL,1,16),(3020,'Peabiru','',NULL,1,16),(3021,'Perobal','',NULL,1,16),(3022,'Pérola','',NULL,1,16),(3023,'Pérola d`Oeste','',NULL,1,16),(3024,'Piên','',NULL,1,16),(3025,'Pinhais','',NULL,1,16),(3026,'Pinhal de São Bento','',NULL,1,16),(3027,'Pinhalão','',NULL,1,16),(3028,'Pinhão','',NULL,1,16),(3029,'Piraí do Sul','',NULL,1,16),(3030,'Piraquara','',NULL,1,16),(3031,'Pitanga','',NULL,1,16),(3032,'Pitangueiras','',NULL,1,16),(3033,'Planaltina do Paraná','',NULL,1,16),(3034,'Planalto','',NULL,1,16),(3035,'Ponta Grossa','',NULL,1,16);
REPLACE INTO `sme_cidade` VALUES (3036,'Pontal do Paraná','',NULL,1,16),(3037,'Porecatu','',NULL,1,16),(3038,'Porto Amazonas','',NULL,1,16),(3039,'Porto Barreiro','',NULL,1,16),(3040,'Porto Rico','',NULL,1,16),(3041,'Porto Vitória','',NULL,1,16),(3042,'Prado Ferreira','',NULL,1,16),(3043,'Pranchita','',NULL,1,16),(3044,'Presidente Castelo Branco','',NULL,1,16),(3045,'Primeiro de Maio','',NULL,1,16),(3046,'Prudentópolis','',NULL,1,16),(3047,'Quarto Centenário','',NULL,1,16),(3048,'Quatiguá','',NULL,1,16),(3049,'Quatro Barras','',NULL,1,16),(3050,'Quatro Pontes','',NULL,1,16),(3051,'Quedas do Iguaçu','',NULL,1,16),(3052,'Querência do Norte','',NULL,1,16),(3053,'Quinta do Sol','',NULL,1,16),(3054,'Quitandinha','',NULL,1,16),(3055,'Ramilândia','',NULL,1,16),(3056,'Rancho Alegre','',NULL,1,16),(3057,'Rancho Alegre d`Oeste','',NULL,1,16),(3058,'Realeza','',NULL,1,16),(3059,'Rebouças','',NULL,1,16),(3060,'Renascença','',NULL,1,16),(3061,'Reserva','',NULL,1,16),(3062,'Reserva do Iguaçu','',NULL,1,16),(3063,'Ribeirão Claro','',NULL,1,16),(3064,'Ribeirão do Pinhal','',NULL,1,16),(3065,'Rio Azul','',NULL,1,16),(3066,'Rio Bom','',NULL,1,16),(3067,'Rio Bonito do Iguaçu','',NULL,1,16),(3068,'Rio Branco do Ivaí','',NULL,1,16),(3069,'Rio Branco do Sul','',NULL,1,16),(3070,'Rio Negro','',NULL,1,16),(3071,'Rolândia','',NULL,1,16),(3072,'Roncador','',NULL,1,16),(3073,'Rondon','',NULL,1,16),(3074,'Rosário do Ivaí','',NULL,1,16),(3075,'Sabáudia','',NULL,1,16),(3076,'Salgado Filho','',NULL,1,16),(3077,'Salto do Itararé','',NULL,1,16),(3078,'Salto do Lontra','',NULL,1,16),(3079,'Santa Amélia','',NULL,1,16),(3080,'Santa Cecília do Pavão','',NULL,1,16),(3081,'Santa Cruz de Monte Castelo','',NULL,1,16),(3082,'Santa Fé','',NULL,1,16),(3083,'Santa Helena','',NULL,1,16),(3084,'Santa Inês','',NULL,1,16),(3085,'Santa Isabel do Ivaí','',NULL,1,16),(3086,'Santa Izabel do Oeste','',NULL,1,16),(3087,'Santa Lúcia','',NULL,1,16),(3088,'Santa Maria do Oeste','',NULL,1,16),(3089,'Santa Mariana','',NULL,1,16),(3090,'Santa Mônica','',NULL,1,16),(3091,'Santa Tereza do Oeste','',NULL,1,16),(3092,'Santa Terezinha de Itaipu','',NULL,1,16),(3093,'Santana do Itararé','',NULL,1,16),(3094,'Santo Antônio da Platina','',NULL,1,16),(3095,'Santo Antônio do Caiuá','',NULL,1,16),(3096,'Santo Antônio do Paraíso','',NULL,1,16),(3097,'Santo Antônio do Sudoeste','',NULL,1,16),(3098,'Santo Inácio','',NULL,1,16),(3099,'São Carlos do Ivaí','',NULL,1,16),(3100,'São Jerônimo da Serra','',NULL,1,16),(3101,'São João','',NULL,1,16),(3102,'São João do Caiuá','',NULL,1,16),(3103,'São João do Ivaí','',NULL,1,16),(3104,'São João do Triunfo','',NULL,1,16),(3105,'São Jorge d`Oeste','',NULL,1,16),(3106,'São Jorge do Ivaí','',NULL,1,16),(3107,'São Jorge do Patrocínio','',NULL,1,16),(3108,'São José da Boa Vista','',NULL,1,16),(3109,'São José das Palmeiras','',NULL,1,16),(3110,'São José dos Pinhais','',NULL,1,16),(3111,'São Manoel do Paraná','',NULL,1,16),(3112,'São Mateus do Sul','',NULL,1,16),(3113,'São Miguel do Iguaçu','',NULL,1,16),(3114,'São Pedro do Iguaçu','',NULL,1,16),(3115,'São Pedro do Ivaí','',NULL,1,16),(3116,'São Pedro do Paraná','',NULL,1,16),(3117,'São Sebastião da Amoreira','',NULL,1,16),(3118,'São Tomé','',NULL,1,16),(3119,'Sapopema','',NULL,1,16),(3120,'Sarandi','',NULL,1,16),(3121,'Saudade do Iguaçu','',NULL,1,16),(3122,'Sengés','',NULL,1,16),(3123,'Serranópolis do Iguaçu','',NULL,1,16),(3124,'Sertaneja','',NULL,1,16),(3125,'Sertanópolis','',NULL,1,16),(3126,'Siqueira Campos','',NULL,1,16),(3127,'Sulina','',NULL,1,16),(3128,'Tamarana','',NULL,1,16),(3129,'Tamboara','',NULL,1,16),(3130,'Tapejara','',NULL,1,16),(3131,'Tapira','',NULL,1,16),(3132,'Teixeira Soares','',NULL,1,16),(3133,'Telêmaco Borba','',NULL,1,16),(3134,'Terra Boa','',NULL,1,16),(3135,'Terra Rica','',NULL,1,16),(3136,'Terra Roxa','',NULL,1,16),(3137,'Tibagi','',NULL,1,16),(3138,'Tijucas do Sul','',NULL,1,16),(3139,'Toledo','',NULL,1,16),(3140,'Tomazina','',NULL,1,16),(3141,'Três Barras do Paraná','',NULL,1,16),(3142,'Tunas do Paraná','',NULL,1,16),(3143,'Tuneiras do Oeste','',NULL,1,16),(3144,'Tupãssi','',NULL,1,16),(3145,'Turvo','',NULL,1,16),(3146,'Ubiratã','',NULL,1,16),(3147,'Umuarama','',NULL,1,16),(3148,'União da Vitória','',NULL,1,16),(3149,'Uniflor','',NULL,1,16),(3150,'Uraí','',NULL,1,16),(3151,'Ventania','',NULL,1,16),(3152,'Vera Cruz do Oeste','',NULL,1,16),(3153,'Verê','',NULL,1,16),(3154,'Vila Alta','',NULL,1,16),(3155,'Virmond','',NULL,1,16),(3156,'Vitorino','',NULL,1,16),(3157,'Wenceslau Braz','',NULL,1,16),(3158,'Xambrê','',NULL,1,16),(3159,'Abreu e Lima','',NULL,1,17),(3160,'Afogados da Ingazeira','',NULL,1,17),(3161,'Afrânio','',NULL,1,17),(3162,'Agrestina','',NULL,1,17),(3163,'Água Preta','',NULL,1,17),(3164,'Águas Belas','',NULL,1,17),(3165,'Alagoinha','',NULL,1,17),(3166,'Aliança','',NULL,1,17),(3167,'Altinho','',NULL,1,17),(3168,'Amaraji','',NULL,1,17),(3169,'Angelim','',NULL,1,17),(3170,'Araçoiaba','',NULL,1,17),(3171,'Araripina','',NULL,1,17),(3172,'Arcoverde','',NULL,1,17),(3173,'Barra de Guabiraba','',NULL,1,17),(3174,'Barreiros','',NULL,1,17),(3175,'Belém de Maria','',NULL,1,17),(3176,'Belém de São Francisco','',NULL,1,17),(3177,'Belo Jardim','',NULL,1,17),(3178,'Betânia','',NULL,1,17),(3179,'Bezerros','',NULL,1,17),(3180,'Bodocó','',NULL,1,17),(3181,'Bom Conselho','',NULL,1,17),(3182,'Bom Jardim','',NULL,1,17),(3183,'Bonito','',NULL,1,17),(3184,'Brejão','',NULL,1,17),(3185,'Brejinho','',NULL,1,17),(3186,'Brejo da Madre de Deus','',NULL,1,17),(3187,'Buenos Aires','',NULL,1,17),(3188,'Buíque','',NULL,1,17),(3189,'Cabo de Santo Agostinho','',NULL,1,17),(3190,'Cabrobó','',NULL,1,17),(3191,'Cachoeirinha','',NULL,1,17),(3192,'Caetés','',NULL,1,17),(3193,'Calçado','',NULL,1,17),(3194,'Calumbi','',NULL,1,17),(3195,'Camaragibe','',NULL,1,17),(3196,'Camocim de São Félix','',NULL,1,17),(3197,'Camutanga','',NULL,1,17),(3198,'Canhotinho','',NULL,1,17),(3199,'Capoeiras','',NULL,1,17),(3200,'Carnaíba','',NULL,1,17),(3201,'Carnaubeira da Penha','',NULL,1,17),(3202,'Carpina','',NULL,1,17),(3203,'Caruaru','',NULL,1,17),(3204,'Casinhas','',NULL,1,17),(3205,'Catende','',NULL,1,17),(3206,'Cedro','',NULL,1,17),(3207,'Chã de Alegria','',NULL,1,17),(3208,'Chã Grande','',NULL,1,17),(3209,'Condado','',NULL,1,17),(3210,'Correntes','',NULL,1,17),(3211,'Cortês','',NULL,1,17),(3212,'Cumaru','',NULL,1,17),(3213,'Cupira','',NULL,1,17),(3214,'Custódia','',NULL,1,17),(3215,'Dormentes','',NULL,1,17),(3216,'Escada','',NULL,1,17),(3217,'Exu','',NULL,1,17),(3218,'Feira Nova','',NULL,1,17),(3219,'Fernando de Noronha','',NULL,1,17),(3220,'Ferreiros','',NULL,1,17),(3221,'Flores','',NULL,1,17),(3222,'Floresta','',NULL,1,17),(3223,'Frei Miguelinho','',NULL,1,17),(3224,'Gameleira','',NULL,1,17),(3225,'Garanhuns','',NULL,1,17),(3226,'Glória do Goitá','',NULL,1,17),(3227,'Goiana','',NULL,1,17),(3228,'Granito','',NULL,1,17),(3229,'Gravatá','',NULL,1,17),(3230,'Iati','',NULL,1,17),(3231,'Ibimirim','',NULL,1,17),(3232,'Ibirajuba','',NULL,1,17),(3233,'Igarassu','',NULL,1,17),(3234,'Iguaraci','',NULL,1,17),(3235,'Inajá','',NULL,1,17),(3236,'Ingazeira','',NULL,1,17),(3237,'Ipojuca','',NULL,1,17),(3238,'Ipubi','',NULL,1,17),(3239,'Itacuruba','',NULL,1,17),(3240,'Itaíba','',NULL,1,17),(3241,'Itamaracá','',NULL,1,17),(3242,'Itambé','',NULL,1,17),(3243,'Itapetim','',NULL,1,17),(3244,'Itapissuma','',NULL,1,17),(3245,'Itaquitinga','',NULL,1,17),(3246,'Jaboatão dos Guararapes','',NULL,1,17),(3247,'Jaqueira','',NULL,1,17),(3248,'Jataúba','',NULL,1,17),(3249,'Jatobá','',NULL,1,17),(3250,'João Alfredo','',NULL,1,17),(3251,'Joaquim Nabuco','',NULL,1,17),(3252,'Jucati','',NULL,1,17),(3253,'Jupi','',NULL,1,17),(3254,'Jurema','',NULL,1,17),(3255,'Lagoa do Carro','',NULL,1,17),(3256,'Lagoa do Itaenga','',NULL,1,17),(3257,'Lagoa do Ouro','',NULL,1,17),(3258,'Lagoa dos Gatos','',NULL,1,17),(3259,'Lagoa Grande','',NULL,1,17),(3260,'Lajedo','',NULL,1,17),(3261,'Limoeiro','',NULL,1,17),(3262,'Macaparana','',NULL,1,17),(3263,'Machados','',NULL,1,17),(3264,'Manari','',NULL,1,17),(3265,'Maraial','',NULL,1,17),(3266,'Mirandiba','',NULL,1,17),(3267,'Moreilândia','',NULL,1,17),(3268,'Moreno','',NULL,1,17),(3269,'Nazaré da Mata','',NULL,1,17),(3270,'Olinda','',NULL,1,17),(3271,'Orobó','',NULL,1,17),(3272,'Orocó','',NULL,1,17),(3273,'Ouricuri','',NULL,1,17),(3274,'Palmares','',NULL,1,17),(3275,'Palmeirina','',NULL,1,17),(3276,'Panelas','',NULL,1,17),(3277,'Paranatama','',NULL,1,17),(3278,'Parnamirim','',NULL,1,17),(3279,'Passira','',NULL,1,17),(3280,'Paudalho','',NULL,1,17),(3281,'Paulista','',NULL,1,17),(3282,'Pedra','',NULL,1,17),(3283,'Pesqueira','',NULL,1,17),(3284,'Petrolândia','',NULL,1,17),(3285,'Petrolina','',NULL,1,17),(3286,'Poção','',NULL,1,17),(3287,'Pombos','',NULL,1,17),(3288,'Primavera','',NULL,1,17),(3289,'Quipapá','',NULL,1,17),(3290,'Quixaba','',NULL,1,17),(3291,'Recife','',NULL,1,17),(3292,'Riacho das Almas','',NULL,1,17),(3293,'Ribeirão','',NULL,1,17),(3294,'Rio Formoso','',NULL,1,17),(3295,'Sairé','',NULL,1,17),(3296,'Salgadinho','',NULL,1,17),(3297,'Salgueiro','',NULL,1,17),(3298,'Saloá','',NULL,1,17),(3299,'Sanharó','',NULL,1,17),(3300,'Santa Cruz','',NULL,1,17),(3301,'Santa Cruz da Baixa Verde','',NULL,1,17),(3302,'Santa Cruz do Capibaribe','',NULL,1,17),(3303,'Santa Filomena','',NULL,1,17),(3304,'Santa Maria da Boa Vista','',NULL,1,17),(3305,'Santa Maria do Cambucá','',NULL,1,17),(3306,'Santa Terezinha','',NULL,1,17),(3307,'São Benedito do Sul','',NULL,1,17),(3308,'São Bento do Una','',NULL,1,17),(3309,'São Caitano','',NULL,1,17),(3310,'São João','',NULL,1,17),(3311,'São Joaquim do Monte','',NULL,1,17),(3312,'São José da Coroa Grande','',NULL,1,17),(3313,'São José do Belmonte','',NULL,1,17),(3314,'São José do Egito','',NULL,1,17),(3315,'São Lourenço da Mata','',NULL,1,17),(3316,'São Vicente Ferrer','',NULL,1,17),(3317,'Serra Talhada','',NULL,1,17),(3318,'Serrita','',NULL,1,17),(3319,'Sertânia','',NULL,1,17),(3320,'Sirinhaém','',NULL,1,17),(3321,'Solidão','',NULL,1,17),(3322,'Surubim','',NULL,1,17),(3323,'Tabira','',NULL,1,17),(3324,'Tacaimbó','',NULL,1,17),(3325,'Tacaratu','',NULL,1,17),(3326,'Tamandaré','',NULL,1,17),(3327,'Taquaritinga do Norte','',NULL,1,17),(3328,'Terezinha','',NULL,1,17),(3329,'Terra Nova','',NULL,1,17),(3330,'Timbaúba','',NULL,1,17),(3331,'Toritama','',NULL,1,17),(3332,'Tracunhaém','',NULL,1,17),(3333,'Trindade','',NULL,1,17),(3334,'Triunfo','',NULL,1,17),(3335,'Tupanatinga','',NULL,1,17),(3336,'Tuparetama','',NULL,1,17),(3337,'Venturosa','',NULL,1,17),(3338,'Verdejante','',NULL,1,17),(3339,'Vertente do Lério','',NULL,1,17),(3340,'Vertentes','',NULL,1,17),(3341,'Vicência','',NULL,1,17),(3342,'Vitória de Santo Antão','',NULL,1,17),(3343,'Xexéu','',NULL,1,17),(3344,'Acauã','',NULL,1,18),(3345,'Agricolândia','',NULL,1,18),(3346,'Água Branca','',NULL,1,18),(3347,'Alagoinha do Piauí','',NULL,1,18),(3348,'Alegrete do Piauí','',NULL,1,18),(3349,'Alto Longá','',NULL,1,18),(3350,'Altos','',NULL,1,18),(3351,'Alvorada do Gurguéia','',NULL,1,18),(3352,'Amarante','',NULL,1,18),(3353,'Angical do Piauí','',NULL,1,18),(3354,'Anísio de Abreu','',NULL,1,18),(3355,'Antônio Almeida','',NULL,1,18),(3356,'Aroazes','',NULL,1,18),(3357,'Arraial','',NULL,1,18),(3358,'Assunção do Piauí','',NULL,1,18),(3359,'Avelino Lopes','',NULL,1,18),(3360,'Baixa Grande do Ribeiro','',NULL,1,18),(3361,'Barra d`Alcântara','',NULL,1,18),(3362,'Barras','',NULL,1,18),(3363,'Barreiras do Piauí','',NULL,1,18),(3364,'Barro Duro','',NULL,1,18),(3365,'Batalha','',NULL,1,18),(3366,'Bela Vista do Piauí','',NULL,1,18),(3367,'Belém do Piauí','',NULL,1,18),(3368,'Beneditinos','',NULL,1,18),(3369,'Bertolínia','',NULL,1,18),(3370,'Betânia do Piauí','',NULL,1,18),(3371,'Boa Hora','',NULL,1,18),(3372,'Bocaina','',NULL,1,18),(3373,'Bom Jesus','',NULL,1,18),(3374,'Bom Princípio do Piauí','',NULL,1,18),(3375,'Bonfim do Piauí','',NULL,1,18),(3376,'Boqueirão do Piauí','',NULL,1,18),(3377,'Brasileira','',NULL,1,18),(3378,'Brejo do Piauí','',NULL,1,18),(3379,'Buriti dos Lopes','',NULL,1,18),(3380,'Buriti dos Montes','',NULL,1,18),(3381,'Cabeceiras do Piauí','',NULL,1,18),(3382,'Cajazeiras do Piauí','',NULL,1,18),(3383,'Cajueiro da Praia','',NULL,1,18),(3384,'Caldeirão Grande do Piauí','',NULL,1,18),(3385,'Campinas do Piauí','',NULL,1,18),(3386,'Campo Alegre do Fidalgo','',NULL,1,18),(3387,'Campo Grande do Piauí','',NULL,1,18),(3388,'Campo Largo do Piauí','',NULL,1,18),(3389,'Campo Maior','',NULL,1,18),(3390,'Canavieira','',NULL,1,18),(3391,'Canto do Buriti','',NULL,1,18),(3392,'Capitão de Campos','',NULL,1,18),(3393,'Capitão Gervásio Oliveira','',NULL,1,18),(3394,'Caracol','',NULL,1,18),(3395,'Caraúbas do Piauí','',NULL,1,18),(3396,'Caridade do Piauí','',NULL,1,18),(3397,'Castelo do Piauí','',NULL,1,18),(3398,'Caxingó','',NULL,1,18),(3399,'Cocal','',NULL,1,18),(3400,'Cocal de Telha','',NULL,1,18),(3401,'Cocal dos Alves','',NULL,1,18),(3402,'Coivaras','',NULL,1,18),(3403,'Colônia do Gurguéia','',NULL,1,18),(3404,'Colônia do Piauí','',NULL,1,18),(3405,'Conceição do Canindé','',NULL,1,18),(3406,'Coronel José Dias','',NULL,1,18),(3407,'Corrente','',NULL,1,18),(3408,'Cristalândia do Piauí','',NULL,1,18),(3409,'Cristino Castro','',NULL,1,18),(3410,'Curimatá','',NULL,1,18),(3411,'Currais','',NULL,1,18),(3412,'Curral Novo do Piauí','',NULL,1,18),(3413,'Curralinhos','',NULL,1,18),(3414,'Demerval Lobão','',NULL,1,18),(3415,'Dirceu Arcoverde','',NULL,1,18),(3416,'Dom Expedito Lopes','',NULL,1,18),(3417,'Dom Inocêncio','',NULL,1,18),(3418,'Domingos Mourão','',NULL,1,18),(3419,'Elesbão Veloso','',NULL,1,18),(3420,'Eliseu Martins','',NULL,1,18),(3421,'Esperantina','',NULL,1,18),(3422,'Fartura do Piauí','',NULL,1,18),(3423,'Flores do Piauí','',NULL,1,18),(3424,'Floresta do Piauí','',NULL,1,18),(3425,'Floriano','',NULL,1,18),(3426,'Francinópolis','',NULL,1,18),(3427,'Francisco Ayres','',NULL,1,18),(3428,'Francisco Macedo','',NULL,1,18),(3429,'Francisco Santos','',NULL,1,18),(3430,'Fronteiras','',NULL,1,18),(3431,'Geminiano','',NULL,1,18),(3432,'Gilbués','',NULL,1,18),(3433,'Guadalupe','',NULL,1,18),(3434,'Guaribas','',NULL,1,18),(3435,'Hugo Napoleão','',NULL,1,18),(3436,'Ilha Grande','',NULL,1,18),(3437,'Inhuma','',NULL,1,18),(3438,'Ipiranga do Piauí','',NULL,1,18),(3439,'Isaías Coelho','',NULL,1,18),(3440,'Itainópolis','',NULL,1,18),(3441,'Itaueira','',NULL,1,18),(3442,'Jacobina do Piauí','',NULL,1,18),(3443,'Jaicós','',NULL,1,18),(3444,'Jardim do Mulato','',NULL,1,18),(3445,'Jatobá do Piauí','',NULL,1,18),(3446,'Jerumenha','',NULL,1,18),(3447,'João Costa','',NULL,1,18),(3448,'Joaquim Pires','',NULL,1,18),(3449,'Joca Marques','',NULL,1,18),(3450,'José de Freitas','',NULL,1,18),(3451,'Juazeiro do Piauí','',NULL,1,18),(3452,'Júlio Borges','',NULL,1,18),(3453,'Jurema','',NULL,1,18),(3454,'Lagoa Alegre','',NULL,1,18),(3455,'Lagoa de São Francisco','',NULL,1,18),(3456,'Lagoa do Barro do Piauí','',NULL,1,18),(3457,'Lagoa do Piauí','',NULL,1,18),(3458,'Lagoa do Sítio','',NULL,1,18),(3459,'Lagoinha do Piauí','',NULL,1,18),(3460,'Landri Sales','',NULL,1,18),(3461,'Luís Correia','',NULL,1,18),(3462,'Luzilândia','',NULL,1,18),(3463,'Madeiro','',NULL,1,18),(3464,'Manoel Emídio','',NULL,1,18),(3465,'Marcolândia','',NULL,1,18),(3466,'Marcos Parente','',NULL,1,18),(3467,'Massapê do Piauí','',NULL,1,18),(3468,'Matias Olímpio','',NULL,1,18),(3469,'Miguel Alves','',NULL,1,18),(3470,'Miguel Leão','',NULL,1,18),(3471,'Milton Brandão','',NULL,1,18),(3472,'Monsenhor Gil','',NULL,1,18),(3473,'Monsenhor Hipólito','',NULL,1,18),(3474,'Monte Alegre do Piauí','',NULL,1,18),(3475,'Morro Cabeça no Tempo','',NULL,1,18),(3476,'Morro do Chapéu do Piauí','',NULL,1,18),(3477,'Murici dos Portelas','',NULL,1,18),(3478,'Nazaré do Piauí','',NULL,1,18),(3479,'Nossa Senhora de Nazaré','',NULL,1,18),(3480,'Nossa Senhora dos Remédios','',NULL,1,18),(3481,'Nova Santa Rita','',NULL,1,18),(3482,'Novo Oriente do Piauí','',NULL,1,18),(3483,'Novo Santo Antônio','',NULL,1,18),(3484,'Oeiras','',NULL,1,18),(3485,'Olho d`Água do Piauí','',NULL,1,18),(3486,'Padre Marcos','',NULL,1,18),(3487,'Paes Landim','',NULL,1,18),(3488,'Pajeú do Piauí','',NULL,1,18),(3489,'Palmeira do Piauí','',NULL,1,18),(3490,'Palmeirais','',NULL,1,18),(3491,'Paquetá','',NULL,1,18),(3492,'Parnaguá','',NULL,1,18),(3493,'Parnaíba','',NULL,1,18),(3494,'Passagem Franca do Piauí','',NULL,1,18),(3495,'Patos do Piauí','',NULL,1,18),(3496,'Paulistana','',NULL,1,18),(3497,'Pavussu','',NULL,1,18),(3498,'Pedro II','',NULL,1,18),(3499,'Pedro Laurentino','',NULL,1,18),(3500,'Picos','',NULL,1,18),(3501,'Pimenteiras','',NULL,1,18),(3502,'Pio IX','',NULL,1,18),(3503,'Piracuruca','',NULL,1,18),(3504,'Piripiri','',NULL,1,18),(3505,'Porto','',NULL,1,18),(3506,'Porto Alegre do Piauí','',NULL,1,18),(3507,'Prata do Piauí','',NULL,1,18),(3508,'Queimada Nova','',NULL,1,18),(3509,'Redenção do Gurguéia','',NULL,1,18),(3510,'Regeneração','',NULL,1,18),(3511,'Riacho Frio','',NULL,1,18),(3512,'Ribeira do Piauí','',NULL,1,18),(3513,'Ribeiro Gonçalves','',NULL,1,18),(3514,'Rio Grande do Piauí','',NULL,1,18),(3515,'Santa Cruz do Piauí','',NULL,1,18),(3516,'Santa Cruz dos Milagres','',NULL,1,18),(3517,'Santa Filomena','',NULL,1,18),(3518,'Santa Luz','',NULL,1,18),(3519,'Santa Rosa do Piauí','',NULL,1,18),(3520,'Santana do Piauí','',NULL,1,18),(3521,'Santo Antônio de Lisboa','',NULL,1,18),(3522,'Santo Antônio dos Milagres','',NULL,1,18),(3523,'Santo Inácio do Piauí','',NULL,1,18),(3524,'São Braz do Piauí','',NULL,1,18),(3525,'São Félix do Piauí','',NULL,1,18),(3526,'São Francisco de Assis do Piauí','',NULL,1,18),(3527,'São Francisco do Piauí','',NULL,1,18),(3528,'São Gonçalo do Gurguéia','',NULL,1,18),(3529,'São Gonçalo do Piauí','',NULL,1,18),(3530,'São João da Canabrava','',NULL,1,18),(3531,'São João da Fronteira','',NULL,1,18),(3532,'São João da Serra','',NULL,1,18),(3533,'São João da Varjota','',NULL,1,18),(3534,'São João do Arraial','',NULL,1,18),(3535,'São João do Piauí','',NULL,1,18),(3536,'São José do Divino','',NULL,1,18),(3537,'São José do Peixe','',NULL,1,18),(3538,'São José do Piauí','',NULL,1,18),(3539,'São Julião','',NULL,1,18),(3540,'São Lourenço do Piauí','',NULL,1,18),(3541,'São Luis do Piauí','',NULL,1,18),(3542,'São Miguel da Baixa Grande','',NULL,1,18),(3543,'São Miguel do Fidalgo','',NULL,1,18),(3544,'São Miguel do Tapuio','',NULL,1,18),(3545,'São Pedro do Piauí','',NULL,1,18),(3546,'São Raimundo Nonato','',NULL,1,18),(3547,'Sebastião Barros','',NULL,1,18),(3548,'Sebastião Leal','',NULL,1,18),(3549,'Sigefredo Pacheco','',NULL,1,18),(3550,'Simões','',NULL,1,18),(3551,'Simplício Mendes','',NULL,1,18),(3552,'Socorro do Piauí','',NULL,1,18),(3553,'Sussuapara','',NULL,1,18),(3554,'Tamboril do Piauí','',NULL,1,18),(3555,'Tanque do Piauí','',NULL,1,18),(3556,'Teresina','',NULL,1,18),(3557,'União','',NULL,1,18),(3558,'Uruçuí','',NULL,1,18),(3559,'Valença do Piauí','',NULL,1,18),(3560,'Várzea Branca','',NULL,1,18),(3561,'Várzea Grande','',NULL,1,18),(3562,'Vera Mendes','',NULL,1,18),(3563,'Vila Nova do Piauí','',NULL,1,18),(3564,'Wall Ferraz','',NULL,1,18),(3565,'Angra dos Reis','',NULL,1,19),(3566,'Aperibé','',NULL,1,19),(3567,'Araruama','',NULL,1,19),(3568,'Areal','',NULL,1,19),(3569,'Armação dos Búzios','',NULL,1,19),(3570,'Arraial do Cabo','',NULL,1,19),(3571,'Barra do Piraí','',NULL,1,19),(3572,'Barra Mansa','',NULL,1,19),(3573,'Belford Roxo','',NULL,1,19),(3574,'Bom Jardim','',NULL,1,19),(3575,'Bom Jesus do Itabapoana','',NULL,1,19),(3576,'Cabo Frio','',NULL,1,19),(3577,'Cachoeiras de Macacu','',NULL,1,19),(3578,'Cambuci','',NULL,1,19),(3579,'Campos dos Goytacazes','',NULL,1,19),(3580,'Cantagalo','',NULL,1,19),(3581,'Carapebus','',NULL,1,19),(3582,'Cardoso Moreira','',NULL,1,19),(3583,'Carmo','',NULL,1,19),(3584,'Casimiro de Abreu','',NULL,1,19),(3585,'Comendador Levy Gasparian','',NULL,1,19),(3586,'Conceição de Macabu','',NULL,1,19),(3587,'Cordeiro','',NULL,1,19),(3588,'Duas Barras','',NULL,1,19),(3589,'Duque de Caxias','',NULL,1,19),(3590,'Engenheiro Paulo de Frontin','',NULL,1,19),(3591,'Guapimirim','',NULL,1,19),(3592,'Iguaba Grande','',NULL,1,19),(3593,'Itaboraí','',NULL,1,19),(3594,'Itaguaí','',NULL,1,19),(3595,'Italva','',NULL,1,19),(3596,'Itaocara','',NULL,1,19),(3597,'Itaperuna','',NULL,1,19),(3598,'Itatiaia','',NULL,1,19),(3599,'Japeri','',NULL,1,19),(3600,'Laje do Muriaé','',NULL,1,19),(3601,'Macaé','',NULL,1,19),(3602,'Macuco','',NULL,1,19),(3603,'Magé','',NULL,1,19),(3604,'Mangaratiba','',NULL,1,19),(3605,'Maricá','',NULL,1,19),(3606,'Mendes','',NULL,1,19),(3607,'Miguel Pereira','',NULL,1,19),(3608,'Miracema','',NULL,1,19),(3609,'Natividade','',NULL,1,19),(3610,'Nilópolis','',NULL,1,19),(3611,'Niterói','',NULL,1,19),(3612,'Nova Friburgo','',NULL,1,19),(3613,'Nova Iguaçu','',NULL,1,19),(3614,'Paracambi','',NULL,1,19),(3615,'Paraíba do Sul','',NULL,1,19),(3616,'Parati','',NULL,1,19),(3617,'Paty do Alferes','',NULL,1,19),(3618,'Petrópolis','',NULL,1,19),(3619,'Pinheiral','',NULL,1,19),(3620,'Piraí','',NULL,1,19),(3621,'Porciúncula','',NULL,1,19),(3622,'Porto Real','',NULL,1,19),(3623,'Quatis','',NULL,1,19),(3624,'Queimados','',NULL,1,19),(3625,'Quissamã','',NULL,1,19),(3626,'Resende','',NULL,1,19),(3627,'Rio Bonito','',NULL,1,19),(3628,'Rio Claro','',NULL,1,19),(3629,'Rio das Flores','',NULL,1,19),(3630,'Rio das Ostras','',NULL,1,19),(3631,'Rio de Janeiro','',NULL,1,19),(3632,'Santa Maria Madalena','',NULL,1,19),(3633,'Santo Antônio de Pádua','',NULL,1,19),(3634,'São Fidélis','',NULL,1,19),(3635,'São Francisco de Itabapoana','',NULL,1,19),(3636,'São Gonçalo','',NULL,1,19),(3637,'São João da Barra','',NULL,1,19),(3638,'São João de Meriti','',NULL,1,19),(3639,'São José de Ubá','',NULL,1,19),(3640,'São José do Vale do Rio Preto','',NULL,1,19),(3641,'São Pedro da Aldeia','',NULL,1,19),(3642,'São Sebastião do Alto','',NULL,1,19),(3643,'Sapucaia','',NULL,1,19),(3644,'Saquarema','',NULL,1,19),(3645,'Seropédica','',NULL,1,19),(3646,'Silva Jardim','',NULL,1,19),(3647,'Sumidouro','',NULL,1,19),(3648,'Tanguá','',NULL,1,19),(3649,'Teresópolis','',NULL,1,19),(3650,'Trajano de Morais','',NULL,1,19),(3651,'Três Rios','',NULL,1,19),(3652,'Valença','',NULL,1,19),(3653,'Varre-Sai','',NULL,1,19),(3654,'Vassouras','',NULL,1,19),(3655,'Volta Redonda','',NULL,1,19),(3656,'Acari','',NULL,1,20),(3657,'Açu','',NULL,1,20),(3658,'Afonso Bezerra','',NULL,1,20),(3659,'Água Nova','',NULL,1,20),(3660,'Alexandria','',NULL,1,20),(3661,'Almino Afonso','',NULL,1,20),(3662,'Alto do Rodrigues','',NULL,1,20),(3663,'Angicos','',NULL,1,20),(3664,'Antônio Martins','',NULL,1,20),(3665,'Apodi','',NULL,1,20),(3666,'Areia Branca','',NULL,1,20),(3667,'Arês','',NULL,1,20),(3668,'Augusto Severo','',NULL,1,20),(3669,'Baía Formosa','',NULL,1,20),(3670,'Baraúna','',NULL,1,20),(3671,'Barcelona','',NULL,1,20),(3672,'Bento Fernandes','',NULL,1,20),(3673,'Bodó','',NULL,1,20),(3674,'Bom Jesus','',NULL,1,20),(3675,'Brejinho','',NULL,1,20),(3676,'Caiçara do Norte','',NULL,1,20),(3677,'Caiçara do Rio do Vento','',NULL,1,20),(3678,'Caicó','',NULL,1,20),(3679,'Campo Redondo','',NULL,1,20),(3680,'Canguaretama','',NULL,1,20),(3681,'Caraúbas','',NULL,1,20),(3682,'Carnaúba dos Dantas','',NULL,1,20),(3683,'Carnaubais','',NULL,1,20),(3684,'Ceará-Mirim','',NULL,1,20),(3685,'Cerro Corá','',NULL,1,20),(3686,'Coronel Ezequiel','',NULL,1,20),(3687,'Coronel João Pessoa','',NULL,1,20),(3688,'Cruzeta','',NULL,1,20),(3689,'Currais Novos','',NULL,1,20),(3690,'Doutor Severiano','',NULL,1,20),(3691,'Encanto','',NULL,1,20),(3692,'Equador','',NULL,1,20),(3693,'Espírito Santo','',NULL,1,20),(3694,'Extremoz','',NULL,1,20),(3695,'Felipe Guerra','',NULL,1,20),(3696,'Fernando Pedroza','',NULL,1,20),(3697,'Florânia','',NULL,1,20),(3698,'Francisco Dantas','',NULL,1,20),(3699,'Frutuoso Gomes','',NULL,1,20),(3700,'Galinhos','',NULL,1,20),(3701,'Goianinha','',NULL,1,20),(3702,'Governador Dix-Sept Rosado','',NULL,1,20),(3703,'Grossos','',NULL,1,20),(3704,'Guamaré','',NULL,1,20),(3705,'Ielmo Marinho','',NULL,1,20),(3706,'Ipanguaçu','',NULL,1,20),(3707,'Ipueira','',NULL,1,20),(3708,'Itajá','',NULL,1,20),(3709,'Itaú','',NULL,1,20),(3710,'Jaçanã','',NULL,1,20),(3711,'Jandaíra','',NULL,1,20),(3712,'Janduís','',NULL,1,20),(3713,'Januário Cicco','',NULL,1,20),(3714,'Japi','',NULL,1,20),(3715,'Jardim de Angicos','',NULL,1,20),(3716,'Jardim de Piranhas','',NULL,1,20),(3717,'Jardim do Seridó','',NULL,1,20),(3718,'João Câmara','',NULL,1,20),(3719,'João Dias','',NULL,1,20),(3720,'José da Penha','',NULL,1,20),(3721,'Jucurutu','',NULL,1,20),(3722,'Lagoa d`Anta','',NULL,1,20),(3723,'Lagoa de Pedras','',NULL,1,20),(3724,'Lagoa de Velhos','',NULL,1,20),(3725,'Lagoa Nova','',NULL,1,20),(3726,'Lagoa Salgada','',NULL,1,20),(3727,'Lajes','',NULL,1,20),(3728,'Lajes Pintadas','',NULL,1,20),(3729,'Lucrécia','',NULL,1,20),(3730,'Luís Gomes','',NULL,1,20),(3731,'Macaíba','',NULL,1,20),(3732,'Macau','',NULL,1,20),(3733,'Major Sales','',NULL,1,20),(3734,'Marcelino Vieira','',NULL,1,20),(3735,'Martins','',NULL,1,20),(3736,'Maxaranguape','',NULL,1,20),(3737,'Messias Targino','',NULL,1,20),(3738,'Montanhas','',NULL,1,20),(3739,'Monte Alegre','',NULL,1,20),(3740,'Monte das Gameleiras','',NULL,1,20),(3741,'Mossoró','',NULL,1,20),(3742,'Natal','',NULL,1,20),(3743,'Nísia Floresta','',NULL,1,20),(3744,'Nova Cruz','',NULL,1,20),(3745,'Olho-d`Água do Borges','',NULL,1,20),(3746,'Ouro Branco','',NULL,1,20),(3747,'Paraná','',NULL,1,20),(3748,'Paraú','',NULL,1,20),(3749,'Parazinho','',NULL,1,20),(3750,'Parelhas','',NULL,1,20),(3751,'Parnamirim','',NULL,1,20),(3752,'Passa e Fica','',NULL,1,20),(3753,'Passagem','',NULL,1,20),(3754,'Patu','',NULL,1,20),(3755,'Pau dos Ferros','',NULL,1,20),(3756,'Pedra Grande','',NULL,1,20),(3757,'Pedra Preta','',NULL,1,20),(3758,'Pedro Avelino','',NULL,1,20),(3759,'Pedro Velho','',NULL,1,20),(3760,'Pendências','',NULL,1,20),(3761,'Pilões','',NULL,1,20),(3762,'Poço Branco','',NULL,1,20),(3763,'Portalegre','',NULL,1,20),(3764,'Porto do Mangue','',NULL,1,20),(3765,'Presidente Juscelino','',NULL,1,20),(3766,'Pureza','',NULL,1,20),(3767,'Rafael Fernandes','',NULL,1,20),(3768,'Rafael Godeiro','',NULL,1,20),(3769,'Riacho da Cruz','',NULL,1,20),(3770,'Riacho de Santana','',NULL,1,20),(3771,'Riachuelo','',NULL,1,20),(3772,'Rio do Fogo','',NULL,1,20),(3773,'Rodolfo Fernandes','',NULL,1,20),(3774,'Ruy Barbosa','',NULL,1,20),(3775,'Santa Cruz','',NULL,1,20),(3776,'Santa Maria','',NULL,1,20),(3777,'Santana do Matos','',NULL,1,20),(3778,'Santana do Seridó','',NULL,1,20),(3779,'Santo Antônio','',NULL,1,20),(3780,'São Bento do Norte','',NULL,1,20),(3781,'São Bento do Trairí','',NULL,1,20),(3782,'São Fernando','',NULL,1,20),(3783,'São Francisco do Oeste','',NULL,1,20),(3784,'São Gonçalo do Amarante','',NULL,1,20),(3785,'São João do Sabugi','',NULL,1,20),(3786,'São José de Mipibu','',NULL,1,20),(3787,'São José do Campestre','',NULL,1,20),(3788,'São José do Seridó','',NULL,1,20),(3789,'São Miguel','',NULL,1,20),(3790,'São Miguel de Touros','',NULL,1,20),(3791,'São Paulo do Potengi','',NULL,1,20),(3792,'São Pedro','',NULL,1,20),(3793,'São Rafael','',NULL,1,20),(3794,'São Tomé','',NULL,1,20),(3795,'São Vicente','',NULL,1,20),(3796,'Senador Elói de Souza','',NULL,1,20),(3797,'Senador Georgino Avelino','',NULL,1,20),(3798,'Serra de São Bento','',NULL,1,20),(3799,'Serra do Mel','',NULL,1,20),(3800,'Serra Negra do Norte','',NULL,1,20),(3801,'Serrinha','',NULL,1,20),(3802,'Serrinha dos Pintos','',NULL,1,20),(3803,'Severiano Melo','',NULL,1,20),(3804,'Sítio Novo','',NULL,1,20),(3805,'Taboleiro Grande','',NULL,1,20),(3806,'Taipu','',NULL,1,20),(3807,'Tangará','',NULL,1,20),(3808,'Tenente Ananias','',NULL,1,20),(3809,'Tenente Laurentino Cruz','',NULL,1,20),(3810,'Tibau','',NULL,1,20),(3811,'Tibau do Sul','',NULL,1,20),(3812,'Timbaúba dos Batistas','',NULL,1,20),(3813,'Touros','',NULL,1,20),(3814,'Triunfo Potiguar','',NULL,1,20),(3815,'Umarizal','',NULL,1,20),(3816,'Upanema','',NULL,1,20),(3817,'Várzea','',NULL,1,20),(3818,'Venha-Ver','',NULL,1,20),(3819,'Vera Cruz','',NULL,1,20),(3820,'Viçosa','',NULL,1,20),(3821,'Vila Flor','',NULL,1,20),(3822,'Água Santa','',NULL,1,21),(3823,'Agudo','',NULL,1,21),(3824,'Ajuricaba','',NULL,1,21),(3825,'Alecrim','',NULL,1,21),(3826,'Alegrete','',NULL,1,21),(3827,'Alegria','',NULL,1,21),(3828,'Alpestre','',NULL,1,21),(3829,'Alto Alegre','',NULL,1,21),(3830,'Alto Feliz','',NULL,1,21),(3831,'Alvorada','',NULL,1,21),(3832,'Amaral Ferrador','',NULL,1,21),(3833,'Ametista do Sul','',NULL,1,21),(3834,'André da Rocha','',NULL,1,21),(3835,'Anta Gorda','',NULL,1,21),(3836,'Antônio Prado','',NULL,1,21),(3837,'Arambaré','',NULL,1,21),(3838,'Araricá','',NULL,1,21),(3839,'Aratiba','',NULL,1,21),(3840,'Arroio do Meio','',NULL,1,21),(3841,'Arroio do Sal','',NULL,1,21),(3842,'Arroio do Tigre','',NULL,1,21),(3843,'Arroio dos Ratos','',NULL,1,21),(3844,'Arroio Grande','',NULL,1,21),(3845,'Arvorezinha','',NULL,1,21),(3846,'Augusto Pestana','',NULL,1,21),(3847,'Áurea','',NULL,1,21),(3848,'Bagé','',NULL,1,21),(3849,'Balneário Pinhal','',NULL,1,21),(3850,'Barão','',NULL,1,21),(3851,'Barão de Cotegipe','',NULL,1,21),(3852,'Barão do Triunfo','',NULL,1,21),(3853,'Barra do Guarita','',NULL,1,21),(3854,'Barra do Quaraí','',NULL,1,21),(3855,'Barra do Ribeiro','',NULL,1,21),(3856,'Barra do Rio Azul','',NULL,1,21),(3857,'Barra Funda','',NULL,1,21),(3858,'Barracão','',NULL,1,21),(3859,'Barros Cassal','',NULL,1,21),(3860,'Benjamin Constant do Sul','',NULL,1,21),(3861,'Bento Gonçalves','',NULL,1,21),(3862,'Boa Vista das Missões','',NULL,1,21),(3863,'Boa Vista do Buricá','',NULL,1,21),(3864,'Boa Vista do Sul','',NULL,1,21),(3865,'Bom Jesus','',NULL,1,21),(3866,'Bom Princípio','',NULL,1,21),(3867,'Bom Progresso','',NULL,1,21),(3868,'Bom Retiro do Sul','',NULL,1,21),(3869,'Boqueirão do Leão','',NULL,1,21),(3870,'Bossoroca','',NULL,1,21),(3871,'Braga','',NULL,1,21),(3872,'Brochier','',NULL,1,21),(3873,'Butiá','',NULL,1,21),(3874,'Caçapava do Sul','',NULL,1,21),(3875,'Cacequi','',NULL,1,21),(3876,'Cachoeira do Sul','',NULL,1,21),(3877,'Cachoeirinha','',NULL,1,21),(3878,'Cacique Doble','',NULL,1,21),(3879,'Caibaté','',NULL,1,21),(3880,'Caiçara','',NULL,1,21),(3881,'Camaquã','',NULL,1,21),(3882,'Camargo','',NULL,1,21),(3883,'Cambará do Sul','',NULL,1,21),(3884,'Campestre da Serra','',NULL,1,21),(3885,'Campina das Missões','',NULL,1,21),(3886,'Campinas do Sul','',NULL,1,21),(3887,'Campo Bom','',NULL,1,21),(3888,'Campo Novo','',NULL,1,21),(3889,'Campos Borges','',NULL,1,21),(3890,'Candelária','',NULL,1,21),(3891,'Cândido Godói','',NULL,1,21),(3892,'Candiota','',NULL,1,21),(3893,'Canela','',NULL,1,21),(3894,'Canguçu','',NULL,1,21),(3895,'Canoas','',NULL,1,21),(3896,'Capão da Canoa','',NULL,1,21),(3897,'Capão do Leão','',NULL,1,21),(3898,'Capela de Santana','',NULL,1,21),(3899,'Capitão','',NULL,1,21),(3900,'Capivari do Sul','',NULL,1,21),(3901,'Caraá','',NULL,1,21),(3902,'Carazinho','',NULL,1,21),(3903,'Carlos Barbosa','',NULL,1,21),(3904,'Carlos Gomes','',NULL,1,21),(3905,'Casca','',NULL,1,21),(3906,'Caseiros','',NULL,1,21),(3907,'Catuípe','',NULL,1,21),(3908,'Caxias do Sul','',NULL,1,21),(3909,'Centenário','',NULL,1,21),(3910,'Cerrito','',NULL,1,21),(3911,'Cerro Branco','',NULL,1,21),(3912,'Cerro Grande','',NULL,1,21),(3913,'Cerro Grande do Sul','',NULL,1,21),(3914,'Cerro Largo','',NULL,1,21),(3915,'Chapada','',NULL,1,21),(3916,'Charqueadas','',NULL,1,21),(3917,'Charrua','',NULL,1,21),(3918,'Chiapeta','',NULL,1,21),(3919,'Chuí','',NULL,1,21),(3920,'Chuvisca','',NULL,1,21),(3921,'Cidreira','',NULL,1,21),(3922,'Ciríaco','',NULL,1,21),(3923,'Colinas','',NULL,1,21),(3924,'Colorado','',NULL,1,21),(3925,'Condor','',NULL,1,21),(3926,'Constantina','',NULL,1,21),(3927,'Coqueiros do Sul','',NULL,1,21),(3928,'Coronel Barros','',NULL,1,21),(3929,'Coronel Bicaco','',NULL,1,21),(3930,'Cotiporã','',NULL,1,21),(3931,'Coxilha','',NULL,1,21),(3932,'Crissiumal','',NULL,1,21),(3933,'Cristal','',NULL,1,21),(3934,'Cristal do Sul','',NULL,1,21),(3935,'Cruz Alta','',NULL,1,21),(3936,'Cruzeiro do Sul','',NULL,1,21),(3937,'David Canabarro','',NULL,1,21),(3938,'Derrubadas','',NULL,1,21),(3939,'Dezesseis de Novembro','',NULL,1,21),(3940,'Dilermando de Aguiar','',NULL,1,21),(3941,'Dois Irmãos','',NULL,1,21),(3942,'Dois Irmãos das Missões','',NULL,1,21),(3943,'Dois Lajeados','',NULL,1,21),(3944,'Dom Feliciano','',NULL,1,21),(3945,'Dom Pedrito','',NULL,1,21),(3946,'Dom Pedro de Alcântara','',NULL,1,21),(3947,'Dona Francisca','',NULL,1,21),(3948,'Doutor Maurício Cardoso','',NULL,1,21),(3949,'Doutor Ricardo','',NULL,1,21),(3950,'Eldorado do Sul','',NULL,1,21),(3951,'Encantado','',NULL,1,21),(3952,'Encruzilhada do Sul','',NULL,1,21),(3953,'Engenho Velho','',NULL,1,21),(3954,'Entre Rios do Sul','',NULL,1,21),(3955,'Entre-Ijuís','',NULL,1,21),(3956,'Erebango','',NULL,1,21),(3957,'Erechim','',NULL,1,21),(3958,'Ernestina','',NULL,1,21),(3959,'Erval Grande','',NULL,1,21),(3960,'Erval Seco','',NULL,1,21),(3961,'Esmeralda','',NULL,1,21),(3962,'Esperança do Sul','',NULL,1,21),(3963,'Espumoso','',NULL,1,21),(3964,'Estação','',NULL,1,21),(3965,'Estância Velha','',NULL,1,21),(3966,'Esteio','',NULL,1,21),(3967,'Estrela','',NULL,1,21),(3968,'Estrela Velha','',NULL,1,21),(3969,'Eugênio de Castro','',NULL,1,21),(3970,'Fagundes Varela','',NULL,1,21),(3971,'Farroupilha','',NULL,1,21),(3972,'Faxinal do Soturno','',NULL,1,21),(3973,'Faxinalzinho','',NULL,1,21),(3974,'Fazenda Vilanova','',NULL,1,21),(3975,'Feliz','',NULL,1,21),(3976,'Flores da Cunha','',NULL,1,21),(3977,'Floriano Peixoto','',NULL,1,21),(3978,'Fontoura Xavier','',NULL,1,21),(3979,'Formigueiro','',NULL,1,21),(3980,'Fortaleza dos Valos','',NULL,1,21),(3981,'Frederico Westphalen','',NULL,1,21),(3982,'Garibaldi','',NULL,1,21),(3983,'Garruchos','',NULL,1,21),(3984,'Gaurama','',NULL,1,21),(3985,'General Câmara','',NULL,1,21),(3986,'Gentil','',NULL,1,21),(3987,'Getúlio Vargas','',NULL,1,21),(3988,'Giruá','',NULL,1,21),(3989,'Glorinha','',NULL,1,21),(3990,'Gramado','',NULL,1,21),(3991,'Gramado dos Loureiros','',NULL,1,21),(3992,'Gramado Xavier','',NULL,1,21),(3993,'Gravataí','',NULL,1,21),(3994,'Guabiju','',NULL,1,21),(3995,'Guaíba','',NULL,1,21),(3996,'Guaporé','',NULL,1,21),(3997,'Guarani das Missões','',NULL,1,21),(3998,'Harmonia','',NULL,1,21),(3999,'Herval','',NULL,1,21),(4000,'Herveiras','',NULL,1,21),(4001,'Horizontina','',NULL,1,21),(4002,'Hulha Negra','',NULL,1,21),(4003,'Humaitá','',NULL,1,21),(4004,'Ibarama','',NULL,1,21),(4005,'Ibiaçá','',NULL,1,21),(4006,'Ibiraiaras','',NULL,1,21),(4007,'Ibirapuitã','',NULL,1,21),(4008,'Ibirubá','',NULL,1,21),(4009,'Igrejinha','',NULL,1,21),(4010,'Ijuí','',NULL,1,21),(4011,'Ilópolis','',NULL,1,21),(4012,'Imbé','',NULL,1,21),(4013,'Imigrante','',NULL,1,21),(4014,'Independência','',NULL,1,21),(4015,'Inhacorá','',NULL,1,21),(4016,'Ipê','',NULL,1,21),(4017,'Ipiranga do Sul','',NULL,1,21),(4018,'Iraí','',NULL,1,21),(4019,'Itaara','',NULL,1,21),(4020,'Itacurubi','',NULL,1,21),(4021,'Itapuca','',NULL,1,21),(4022,'Itaqui','',NULL,1,21),(4023,'Itatiba do Sul','',NULL,1,21),(4024,'Ivorá','',NULL,1,21),(4025,'Ivoti','',NULL,1,21),(4026,'Jaboticaba','',NULL,1,21),(4027,'Jacutinga','',NULL,1,21),(4028,'Jaguarão','',NULL,1,21),(4029,'Jaguari','',NULL,1,21),(4030,'Jaquirana','',NULL,1,21),(4031,'Jari','',NULL,1,21),(4032,'Jóia','',NULL,1,21),(4033,'Júlio de Castilhos','',NULL,1,21),(4034,'Lagoa dos Três Cantos','',NULL,1,21),(4035,'Lagoa Vermelha','',NULL,1,21),(4036,'Lagoão','',NULL,1,21),(4037,'Lajeado','',NULL,1,21),(4038,'Lajeado do Bugre','',NULL,1,21),(4039,'Lavras do Sul','',NULL,1,21),(4040,'Liberato Salzano','',NULL,1,21),(4041,'Lindolfo Collor','',NULL,1,21),(4042,'Linha Nova','',NULL,1,21),(4043,'Maçambara','',NULL,1,21),(4044,'Machadinho','',NULL,1,21),(4045,'Mampituba','',NULL,1,21),(4046,'Manoel Viana','',NULL,1,21),(4047,'Maquiné','',NULL,1,21),(4048,'Maratá','',NULL,1,21),(4049,'Marau','',NULL,1,21),(4050,'Marcelino Ramos','',NULL,1,21),(4051,'Mariana Pimentel','',NULL,1,21),(4052,'Mariano Moro','',NULL,1,21),(4053,'Marques de Souza','',NULL,1,21),(4054,'Mata','',NULL,1,21),(4055,'Mato Castelhano','',NULL,1,21),(4056,'Mato Leitão','',NULL,1,21),(4057,'Maximiliano de Almeida','',NULL,1,21),(4058,'Minas do Leão','',NULL,1,21),(4059,'Miraguaí','',NULL,1,21),(4060,'Montauri','',NULL,1,21),(4061,'Monte Alegre dos Campos','',NULL,1,21),(4062,'Monte Belo do Sul','',NULL,1,21),(4063,'Montenegro','',NULL,1,21),(4064,'Mormaço','',NULL,1,21),(4065,'Morrinhos do Sul','',NULL,1,21),(4066,'Morro Redondo','',NULL,1,21),(4067,'Morro Reuter','',NULL,1,21),(4068,'Mostardas','',NULL,1,21),(4069,'Muçum','',NULL,1,21),(4070,'Muitos Capões','',NULL,1,21),(4071,'Muliterno','',NULL,1,21),(4072,'Não-Me-Toque','',NULL,1,21),(4073,'Nicolau Vergueiro','',NULL,1,21),(4074,'Nonoai','',NULL,1,21),(4075,'Nova Alvorada','',NULL,1,21),(4076,'Nova Araçá','',NULL,1,21),(4077,'Nova Bassano','',NULL,1,21),(4078,'Nova Boa Vista','',NULL,1,21),(4079,'Nova Bréscia','',NULL,1,21),(4080,'Nova Candelária','',NULL,1,21),(4081,'Nova Esperança do Sul','',NULL,1,21),(4082,'Nova Hartz','',NULL,1,21),(4083,'Nova Pádua','',NULL,1,21),(4084,'Nova Palma','',NULL,1,21),(4085,'Nova Petrópolis','',NULL,1,21),(4086,'Nova Prata','',NULL,1,21),(4087,'Nova Ramada','',NULL,1,21),(4088,'Nova Roma do Sul','',NULL,1,21),(4089,'Nova Santa Rita','',NULL,1,21),(4090,'Novo Barreiro','',NULL,1,21),(4091,'Novo Cabrais','',NULL,1,21),(4092,'Novo Hamburgo','',NULL,1,21),(4093,'Novo Machado','',NULL,1,21),(4094,'Novo Tiradentes','',NULL,1,21),(4095,'Osório','',NULL,1,21),(4096,'Paim Filho','',NULL,1,21),(4097,'Palmares do Sul','',NULL,1,21),(4098,'Palmeira das Missões','',NULL,1,21),(4099,'Palmitinho','',NULL,1,21),(4100,'Panambi','',NULL,1,21),(4101,'Pantano Grande','',NULL,1,21),(4102,'Paraí','',NULL,1,21),(4103,'Paraíso do Sul','',NULL,1,21),(4104,'Pareci Novo','',NULL,1,21),(4105,'Parobé','',NULL,1,21),(4106,'Passa Sete','',NULL,1,21),(4107,'Passo do Sobrado','',NULL,1,21),(4108,'Passo Fundo','',NULL,1,21),(4109,'Paverama','',NULL,1,21),(4110,'Pedro Osório','',NULL,1,21),(4111,'Pejuçara','',NULL,1,21),(4112,'Pelotas','',NULL,1,21),(4113,'Picada Café','',NULL,1,21),(4114,'Pinhal','',NULL,1,21),(4115,'Pinhal Grande','',NULL,1,21),(4116,'Pinheirinho do Vale','',NULL,1,21),(4117,'Pinheiro Machado','',NULL,1,21),(4118,'Pirapó','',NULL,1,21),(4119,'Piratini','',NULL,1,21),(4120,'Planalto','',NULL,1,21),(4121,'Poço das Antas','',NULL,1,21),(4122,'Pontão','',NULL,1,21),(4123,'Ponte Preta','',NULL,1,21),(4124,'Portão','',NULL,1,21),(4125,'Porto Alegre','',NULL,1,21),(4126,'Porto Lucena','',NULL,1,21),(4127,'Porto Mauá','',NULL,1,21),(4128,'Porto Vera Cruz','',NULL,1,21),(4129,'Porto Xavier','',NULL,1,21),(4130,'Pouso Novo','',NULL,1,21),(4131,'Presidente Lucena','',NULL,1,21),(4132,'Progresso','',NULL,1,21),(4133,'Protásio Alves','',NULL,1,21),(4134,'Putinga','',NULL,1,21),(4135,'Quaraí','',NULL,1,21),(4136,'Quevedos','',NULL,1,21),(4137,'Quinze de Novembro','',NULL,1,21),(4138,'Redentora','',NULL,1,21),(4139,'Relvado','',NULL,1,21),(4140,'Restinga Seca','',NULL,1,21),(4141,'Rio dos Índios','',NULL,1,21),(4142,'Rio Grande','',NULL,1,21),(4143,'Rio Pardo','',NULL,1,21),(4144,'Riozinho','',NULL,1,21),(4145,'Roca Sales','',NULL,1,21),(4146,'Rodeio Bonito','',NULL,1,21),(4147,'Rolante','',NULL,1,21),(4148,'Ronda Alta','',NULL,1,21),(4149,'Rondinha','',NULL,1,21),(4150,'Roque Gonzales','',NULL,1,21),(4151,'Rosário do Sul','',NULL,1,21),(4152,'Sagrada Família','',NULL,1,21),(4153,'Saldanha Marinho','',NULL,1,21),(4154,'Salto do Jacuí','',NULL,1,21),(4155,'Salvador das Missões','',NULL,1,21),(4156,'Salvador do Sul','',NULL,1,21),(4157,'Sananduva','',NULL,1,21),(4158,'Santa Bárbara do Sul','',NULL,1,21),(4159,'Santa Clara do Sul','',NULL,1,21),(4160,'Santa Cruz do Sul','',NULL,1,21),(4161,'Santa Maria','',NULL,1,21),(4162,'Santa Maria do Herval','',NULL,1,21),(4163,'Santa Rosa','',NULL,1,21),(4164,'Santa Tereza','',NULL,1,21),(4165,'Santa Vitória do Palmar','',NULL,1,21),(4166,'Santana da Boa Vista','',NULL,1,21),(4167,'Santana do Livramento','',NULL,1,21),(4168,'Santiago','',NULL,1,21),(4169,'Santo Ângelo','',NULL,1,21),(4170,'Santo Antônio da Patrulha','',NULL,1,21),(4171,'Santo Antônio das Missões','',NULL,1,21),(4172,'Santo Antônio do Palma','',NULL,1,21),(4173,'Santo Antônio do Planalto','',NULL,1,21),(4174,'Santo Augusto','',NULL,1,21),(4175,'Santo Cristo','',NULL,1,21),(4176,'Santo Expedito do Sul','',NULL,1,21),(4177,'São Borja','',NULL,1,21),(4178,'São Domingos do Sul','',NULL,1,21),(4179,'São Francisco de Assis','',NULL,1,21),(4180,'São Francisco de Paula','',NULL,1,21),(4181,'São Gabriel','',NULL,1,21),(4182,'São Jerônimo','',NULL,1,21),(4183,'São João da Urtiga','',NULL,1,21),(4184,'São João do Polêsine','',NULL,1,21),(4185,'São Jorge','',NULL,1,21),(4186,'São José das Missões','',NULL,1,21),(4187,'São José do Herval','',NULL,1,21),(4188,'São José do Hortêncio','',NULL,1,21),(4189,'São José do Inhacorá','',NULL,1,21),(4190,'São José do Norte','',NULL,1,21),(4191,'São José do Ouro','',NULL,1,21),(4192,'São José dos Ausentes','',NULL,1,21),(4193,'São Leopoldo','',NULL,1,21),(4194,'São Lourenço do Sul','',NULL,1,21),(4195,'São Luiz Gonzaga','',NULL,1,21),(4196,'São Marcos','',NULL,1,21),(4197,'São Martinho','',NULL,1,21),(4198,'São Martinho da Serra','',NULL,1,21),(4199,'São Miguel das Missões','',NULL,1,21),(4200,'São Nicolau','',NULL,1,21),(4201,'São Paulo das Missões','',NULL,1,21),(4202,'São Pedro da Serra','',NULL,1,21),(4203,'São Pedro do Butiá','',NULL,1,21),(4204,'São Pedro do Sul','',NULL,1,21),(4205,'São Sebastião do Caí','',NULL,1,21),(4206,'São Sepé','',NULL,1,21),(4207,'São Valentim','',NULL,1,21),(4208,'São Valentim do Sul','',NULL,1,21),(4209,'São Valério do Sul','',NULL,1,21),(4210,'São Vendelino','',NULL,1,21),(4211,'São Vicente do Sul','',NULL,1,21),(4212,'Sapiranga','',NULL,1,21),(4213,'Sapucaia do Sul','',NULL,1,21),(4214,'Sarandi','',NULL,1,21),(4215,'Seberi','',NULL,1,21),(4216,'Sede Nova','',NULL,1,21),(4217,'Segredo','',NULL,1,21),(4218,'Selbach','',NULL,1,21),(4219,'Senador Salgado Filho','',NULL,1,21),(4220,'Sentinela do Sul','',NULL,1,21),(4221,'Serafina Corrêa','',NULL,1,21),(4222,'Sério','',NULL,1,21),(4223,'Sertão','',NULL,1,21),(4224,'Sertão Santana','',NULL,1,21),(4225,'Sete de Setembro','',NULL,1,21),(4226,'Severiano de Almeida','',NULL,1,21),(4227,'Silveira Martins','',NULL,1,21),(4228,'Sinimbu','',NULL,1,21),(4229,'Sobradinho','',NULL,1,21),(4230,'Soledade','',NULL,1,21),(4231,'Tabaí','',NULL,1,21),(4232,'Tapejara','',NULL,1,21),(4233,'Tapera','',NULL,1,21),(4234,'Tapes','',NULL,1,21),(4235,'Taquara','',NULL,1,21),(4236,'Taquari','',NULL,1,21),(4237,'Taquaruçu do Sul','',NULL,1,21),(4238,'Tavares','',NULL,1,21),(4239,'Tenente Portela','',NULL,1,21),(4240,'Terra de Areia','',NULL,1,21),(4241,'Teutônia','',NULL,1,21),(4242,'Tiradentes do Sul','',NULL,1,21),(4243,'Toropi','',NULL,1,21),(4244,'Torres','',NULL,1,21),(4245,'Tramandaí','',NULL,1,21),(4246,'Travesseiro','',NULL,1,21),(4247,'Três Arroios','',NULL,1,21),(4248,'Três Cachoeiras','',NULL,1,21),(4249,'Três Coroas','',NULL,1,21),(4250,'Três de Maio','',NULL,1,21),(4251,'Três Forquilhas','',NULL,1,21),(4252,'Três Palmeiras','',NULL,1,21),(4253,'Três Passos','',NULL,1,21),(4254,'Trindade do Sul','',NULL,1,21),(4255,'Triunfo','',NULL,1,21),(4256,'Tucunduva','',NULL,1,21),(4257,'Tunas','',NULL,1,21),(4258,'Tupanci do Sul','',NULL,1,21),(4259,'Tupanciretã','',NULL,1,21),(4260,'Tupandi','',NULL,1,21),(4261,'Tuparendi','',NULL,1,21),(4262,'Turuçu','',NULL,1,21),(4263,'Ubiretama','',NULL,1,21),(4264,'União da Serra','',NULL,1,21),(4265,'Unistalda','',NULL,1,21),(4266,'Uruguaiana','',NULL,1,21),(4267,'Vacaria','',NULL,1,21),(4268,'Vale do Sol','',NULL,1,21),(4269,'Vale Real','',NULL,1,21),(4270,'Vale Verde','',NULL,1,21),(4271,'Vanini','',NULL,1,21),(4272,'Venâncio Aires','',NULL,1,21),(4273,'Vera Cruz','',NULL,1,21),(4274,'Veranópolis','',NULL,1,21),(4275,'Vespasiano Correa','',NULL,1,21),(4276,'Viadutos','',NULL,1,21),(4277,'Viamão','',NULL,1,21),(4278,'Vicente Dutra','',NULL,1,21),(4279,'Victor Graeff','',NULL,1,21),(4280,'Vila Flores','',NULL,1,21),(4281,'Vila Lângaro','',NULL,1,21),(4282,'Vila Maria','',NULL,1,21),(4283,'Vila Nova do Sul','',NULL,1,21),(4284,'Vista Alegre','',NULL,1,21),(4285,'Vista Alegre do Prata','',NULL,1,21),(4286,'Vista Gaúcha','',NULL,1,21),(4287,'Vitória das Missões','',NULL,1,21),(4288,'Xangri-lá','',NULL,1,21),(4289,'Alta Floresta d`Oeste','',NULL,1,22),(4290,'Alto Alegre dos Parecis','',NULL,1,22),(4291,'Alto Paraíso','',NULL,1,22),(4292,'Alvorada d`Oeste','',NULL,1,22),(4293,'Ariquemes','',NULL,1,22),(4294,'Buritis','',NULL,1,22),(4295,'Cabixi','',NULL,1,22),(4296,'Cacaulândia','',NULL,1,22),(4297,'Cacoal','',NULL,1,22),(4298,'Campo Novo de Rondônia','',NULL,1,22),(4299,'Candeias do Jamari','',NULL,1,22),(4300,'Castanheiras','',NULL,1,22),(4301,'Cerejeiras','',NULL,1,22),(4302,'Chupinguaia','',NULL,1,22),(4303,'Colorado do Oeste','',NULL,1,22),(4304,'Corumbiara','',NULL,1,22),(4305,'Costa Marques','',NULL,1,22),(4306,'Cujubim','',NULL,1,22),(4307,'Espigão d`Oeste','',NULL,1,22),(4308,'Governador Jorge Teixeira','',NULL,1,22),(4309,'Guajará-Mirim','',NULL,1,22),(4310,'Itapuã do Oeste','',NULL,1,22),(4311,'Jaru','',NULL,1,22),(4312,'Ji-Paraná','',NULL,1,22),(4313,'Machadinho d`Oeste','',NULL,1,22),(4314,'Ministro Andreazza','',NULL,1,22),(4315,'Mirante da Serra','',NULL,1,22),(4316,'Monte Negro','',NULL,1,22),(4317,'Nova Brasilândia d`Oeste','',NULL,1,22),(4318,'Nova Mamoré','',NULL,1,22),(4319,'Nova União','',NULL,1,22),(4320,'Novo Horizonte do Oeste','',NULL,1,22),(4321,'Ouro Preto do Oeste','',NULL,1,22),(4322,'Parecis','',NULL,1,22),(4323,'Pimenta Bueno','',NULL,1,22),(4324,'Pimenteiras do Oeste','',NULL,1,22),(4325,'Porto Velho','',NULL,1,22),(4326,'Presidente Médici','',NULL,1,22),(4327,'Primavera de Rondônia','',NULL,1,22),(4328,'Rio Crespo','',NULL,1,22),(4329,'Rolim de Moura','',NULL,1,22),(4330,'Santa Luzia d`Oeste','',NULL,1,22),(4331,'São Felipe d`Oeste','',NULL,1,22),(4332,'São Francisco do Guaporé','',NULL,1,22),(4333,'São Miguel do Guaporé','',NULL,1,22),(4334,'Seringueiras','',NULL,1,22),(4335,'Teixeirópolis','',NULL,1,22),(4336,'Theobroma','',NULL,1,22),(4337,'Urupá','',NULL,1,22),(4338,'Vale do Anari','',NULL,1,22),(4339,'Vale do Paraíso','',NULL,1,22),(4340,'Vilhena','',NULL,1,22),(4341,'Alto Alegre','',NULL,1,23),(4342,'Amajari','',NULL,1,23),(4343,'Boa Vista','',NULL,1,23),(4344,'Bonfim','',NULL,1,23),(4345,'Cantá','',NULL,1,23),(4346,'Caracaraí','',NULL,1,23),(4347,'Caroebe','',NULL,1,23),(4348,'Iracema','',NULL,1,23),(4349,'Mucajaí','',NULL,1,23),(4350,'Normandia','',NULL,1,23),(4351,'Pacaraima','',NULL,1,23),(4352,'Rorainópolis','',NULL,1,23),(4353,'São João da Baliza','',NULL,1,23),(4354,'São Luiz','',NULL,1,23),(4355,'Uiramutã','',NULL,1,23),(4356,'Abdon Batista','',NULL,1,24),(4357,'Abelardo Luz','',NULL,1,24),(4358,'Agrolândia','',NULL,1,24),(4359,'Agronômica','',NULL,1,24),(4360,'Água Doce','',NULL,1,24),(4361,'Águas de Chapecó','',NULL,1,24),(4362,'Águas Frias','',NULL,1,24),(4363,'Águas Mornas','',NULL,1,24),(4364,'Alfredo Wagner','',NULL,1,24),(4365,'Alto Bela Vista','',NULL,1,24),(4366,'Anchieta','',NULL,1,24),(4367,'Angelina','',NULL,1,24),(4368,'Anita Garibaldi','',NULL,1,24),(4369,'Anitápolis','',NULL,1,24),(4370,'Antônio Carlos','',NULL,1,24),(4371,'Apiúna','',NULL,1,24),(4372,'Arabutã','',NULL,1,24),(4373,'Araquari','',NULL,1,24),(4374,'Araranguá','',NULL,1,24),(4375,'Armazém','',NULL,1,24),(4376,'Arroio Trinta','',NULL,1,24),(4377,'Arvoredo','',NULL,1,24),(4378,'Ascurra','',NULL,1,24),(4379,'Atalanta','',NULL,1,24),(4380,'Aurora','',NULL,1,24),(4381,'Balneário Arroio do Silva','',NULL,1,24),(4382,'Balneário Barra do Sul','',NULL,1,24),(4383,'Balneário Camboriú','',NULL,1,24),(4384,'Balneário Gaivota','',NULL,1,24),(4385,'Bandeirante','',NULL,1,24),(4386,'Barra Bonita','',NULL,1,24),(4387,'Barra Velha','',NULL,1,24),(4388,'Bela Vista do Toldo','',NULL,1,24),(4389,'Belmonte','',NULL,1,24),(4390,'Benedito Novo','',NULL,1,24),(4391,'Biguaçu','',NULL,1,24),(4392,'Blumenau','',NULL,1,24),(4393,'Bocaina do Sul','',NULL,1,24),(4394,'Bom Jardim da Serra','',NULL,1,24),(4395,'Bom Jesus','',NULL,1,24),(4396,'Bom Jesus do Oeste','',NULL,1,24),(4397,'Bom Retiro','',NULL,1,24),(4398,'Bombinhas','',NULL,1,24),(4399,'Botuverá','',NULL,1,24),(4400,'Braço do Norte','',NULL,1,24),(4401,'Braço do Trombudo','',NULL,1,24),(4402,'Brunópolis','',NULL,1,24),(4403,'Brusque','',NULL,1,24),(4404,'Caçador','',NULL,1,24),(4405,'Caibi','',NULL,1,24),(4406,'Calmon','',NULL,1,24),(4407,'Camboriú','',NULL,1,24),(4408,'Campo Alegre','',NULL,1,24),(4409,'Campo Belo do Sul','',NULL,1,24),(4410,'Campo Erê','',NULL,1,24),(4411,'Campos Novos','',NULL,1,24),(4412,'Canelinha','',NULL,1,24),(4413,'Canoinhas','',NULL,1,24),(4414,'Capão Alto','',NULL,1,24),(4415,'Capinzal','',NULL,1,24),(4416,'Capivari de Baixo','',NULL,1,24),(4417,'Catanduvas','',NULL,1,24),(4418,'Caxambu do Sul','',NULL,1,24),(4419,'Celso Ramos','',NULL,1,24),(4420,'Cerro Negro','',NULL,1,24),(4421,'Chapadão do Lageado','',NULL,1,24),(4422,'Chapecó','',NULL,1,24),(4423,'Cocal do Sul','',NULL,1,24),(4424,'Concórdia','',NULL,1,24),(4425,'Cordilheira Alta','',NULL,1,24),(4426,'Coronel Freitas','',NULL,1,24),(4427,'Coronel Martins','',NULL,1,24),(4428,'Correia Pinto','',NULL,1,24),(4429,'Corupá','',NULL,1,24),(4430,'Criciúma','',NULL,1,24),(4431,'Cunha Porã','',NULL,1,24),(4432,'Cunhataí','',NULL,1,24),(4433,'Curitibanos','',NULL,1,24),(4434,'Descanso','',NULL,1,24),(4435,'Dionísio Cerqueira','',NULL,1,24),(4436,'Dona Emma','',NULL,1,24),(4437,'Doutor Pedrinho','',NULL,1,24),(4438,'Entre Rios','',NULL,1,24),(4439,'Ermo','',NULL,1,24),(4440,'Erval Velho','',NULL,1,24),(4441,'Faxinal dos Guedes','',NULL,1,24),(4442,'Flor do Sertão','',NULL,1,24),(4443,'Florianópolis','',NULL,1,24),(4444,'Formosa do Sul','',NULL,1,24),(4445,'Forquilhinha','',NULL,1,24),(4446,'Fraiburgo','',NULL,1,24),(4447,'Frei Rogério','',NULL,1,24),(4448,'Galvão','',NULL,1,24),(4449,'Garopaba','',NULL,1,24),(4450,'Garuva','',NULL,1,24),(4451,'Gaspar','',NULL,1,24),(4452,'Governador Celso Ramos','',NULL,1,24),(4453,'Grão Pará','',NULL,1,24),(4454,'Gravatal','',NULL,1,24),(4455,'Guabiruba','',NULL,1,24),(4456,'Guaraciaba','',NULL,1,24),(4457,'Guaramirim','',NULL,1,24),(4458,'Guarujá do Sul','',NULL,1,24),(4459,'Guatambú','',NULL,1,24),(4460,'Herval d`Oeste','',NULL,1,24),(4461,'Ibiam','',NULL,1,24),(4462,'Ibicaré','',NULL,1,24),(4463,'Ibirama','',NULL,1,24),(4464,'Içara','',NULL,1,24),(4465,'Ilhota','',NULL,1,24),(4466,'Imaruí','',NULL,1,24),(4467,'Imbituba','',NULL,1,24),(4468,'Imbuia','',NULL,1,24),(4469,'Indaial','',NULL,1,24),(4470,'Iomerê','',NULL,1,24),(4471,'Ipira','',NULL,1,24),(4472,'Iporã do Oeste','',NULL,1,24),(4473,'Ipuaçu','',NULL,1,24),(4474,'Ipumirim','',NULL,1,24),(4475,'Iraceminha','',NULL,1,24),(4476,'Irani','',NULL,1,24),(4477,'Irati','',NULL,1,24),(4478,'Irineópolis','',NULL,1,24),(4479,'Itá','',NULL,1,24),(4480,'Itaiópolis','',NULL,1,24),(4481,'Itajaí','IAI',NULL,1,24),(4482,'Itapema','',NULL,1,24),(4483,'Itapiranga','',NULL,1,24),(4484,'Itapoá','',NULL,1,24),(4485,'Ituporanga','',NULL,1,24),(4486,'Jaborá','',NULL,1,24),(4487,'Jacinto Machado','',NULL,1,24),(4488,'Jaguaruna','',NULL,1,24),(4489,'Jaraguá do Sul','',NULL,1,24),(4490,'Jardinópolis','',NULL,1,24),(4491,'Joaçaba','',NULL,1,24),(4492,'Joinville','',NULL,1,24),(4493,'José Boiteux','',NULL,1,24),(4494,'Jupiá','',NULL,1,24),(4495,'Lacerdópolis','',NULL,1,24),(4496,'Lages','',NULL,1,24),(4497,'Laguna','',NULL,1,24),(4498,'Lajeado Grande','',NULL,1,24),(4499,'Laurentino','',NULL,1,24),(4500,'Lauro Muller','',NULL,1,24),(4501,'Lebon Régis','',NULL,1,24),(4502,'Leoberto Leal','',NULL,1,24),(4503,'Lindóia do Sul','',NULL,1,24),(4504,'Lontras','',NULL,1,24),(4505,'Luiz Alves','',NULL,1,24),(4506,'Luzerna','',NULL,1,24),(4507,'Macieira','',NULL,1,24),(4508,'Mafra','',NULL,1,24),(4509,'Major Gercino','',NULL,1,24),(4510,'Major Vieira','',NULL,1,24),(4511,'Maracajá','',NULL,1,24),(4512,'Maravilha','',NULL,1,24),(4513,'Marema','',NULL,1,24),(4514,'Massaranduba','',NULL,1,24),(4515,'Matos Costa','',NULL,1,24),(4516,'Meleiro','',NULL,1,24),(4517,'Mirim Doce','',NULL,1,24),(4518,'Modelo','',NULL,1,24),(4519,'Mondaí','',NULL,1,24),(4520,'Monte Carlo','',NULL,1,24),(4521,'Monte Castelo','',NULL,1,24),(4522,'Morro da Fumaça','',NULL,1,24),(4523,'Morro Grande','',NULL,1,24),(4524,'Navegantes','',NULL,1,24),(4525,'Nova Erechim','',NULL,1,24),(4526,'Nova Itaberaba','',NULL,1,24),(4527,'Nova Trento','',NULL,1,24),(4528,'Nova Veneza','',NULL,1,24),(4529,'Novo Horizonte','',NULL,1,24),(4530,'Orleans','',NULL,1,24),(4531,'Otacílio Costa','',NULL,1,24),(4532,'Ouro','',NULL,1,24),(4533,'Ouro Verde','',NULL,1,24),(4534,'Paial','',NULL,1,24),(4535,'Painel','',NULL,1,24),(4536,'Palhoça','',NULL,1,24),(4537,'Palma Sola','',NULL,1,24),(4538,'Palmeira','',NULL,1,24),(4539,'Palmitos','',NULL,1,24),(4540,'Papanduva','',NULL,1,24),(4541,'Paraíso','',NULL,1,24),(4542,'Passo de Torres','',NULL,1,24),(4543,'Passos Maia','',NULL,1,24),(4544,'Paulo Lopes','',NULL,1,24),(4545,'Pedras Grandes','',NULL,1,24),(4546,'Penha','',NULL,1,24),(4547,'Peritiba','',NULL,1,24),(4548,'Petrolândia','',NULL,1,24),(4549,'Piçarras','',NULL,1,24),(4550,'Pinhalzinho','',NULL,1,24),(4551,'Pinheiro Preto','',NULL,1,24),(4552,'Piratuba','',NULL,1,24),(4553,'Planalto Alegre','',NULL,1,24),(4554,'Pomerode','',NULL,1,24),(4555,'Ponte Alta','',NULL,1,24),(4556,'Ponte Alta do Norte','',NULL,1,24),(4557,'Ponte Serrada','',NULL,1,24),(4558,'Porto Belo','',NULL,1,24),(4559,'Porto União','',NULL,1,24),(4560,'Pouso Redondo','',NULL,1,24),(4561,'Praia Grande','',NULL,1,24),(4562,'Presidente Castelo Branco','',NULL,1,24),(4563,'Presidente Getúlio','',NULL,1,24),(4564,'Presidente Nereu','',NULL,1,24),(4565,'Princesa','',NULL,1,24),(4566,'Quilombo','',NULL,1,24),(4567,'Rancho Queimado','',NULL,1,24),(4568,'Rio das Antas','',NULL,1,24),(4569,'Rio do Campo','',NULL,1,24),(4570,'Rio do Oeste','',NULL,1,24),(4571,'Rio do Sul','',NULL,1,24),(4572,'Rio dos Cedros','',NULL,1,24),(4573,'Rio Fortuna','',NULL,1,24),(4574,'Rio Negrinho','',NULL,1,24),(4575,'Rio Rufino','',NULL,1,24),(4576,'Riqueza','',NULL,1,24),(4577,'Rodeio','',NULL,1,24),(4578,'Romelândia','',NULL,1,24),(4579,'Salete','',NULL,1,24),(4580,'Saltinho','',NULL,1,24),(4581,'Salto Veloso','',NULL,1,24),(4582,'Sangão','',NULL,1,24),(4583,'Santa Cecília','',NULL,1,24),(4584,'Santa Helena','',NULL,1,24),(4585,'Santa Rosa de Lima','',NULL,1,24),(4586,'Santa Rosa do Sul','',NULL,1,24),(4587,'Santa Terezinha','',NULL,1,24),(4588,'Santa Terezinha do Progresso','',NULL,1,24),(4589,'Santiago do Sul','',NULL,1,24),(4590,'Santo Amaro da Imperatriz','',NULL,1,24),(4591,'São Bento do Sul','',NULL,1,24),(4592,'São Bernardino','',NULL,1,24),(4593,'São Bonifácio','',NULL,1,24),(4594,'São Carlos','',NULL,1,24),(4595,'São Cristovão do Sul','',NULL,1,24),(4596,'São Domingos','',NULL,1,24),(4597,'São Francisco do Sul','',NULL,1,24),(4598,'São João Batista','',NULL,1,24),(4599,'São João do Itaperiú','',NULL,1,24),(4600,'São João do Oeste','',NULL,1,24),(4601,'São João do Sul','',NULL,1,24),(4602,'São Joaquim','',NULL,1,24),(4603,'São José','',NULL,1,24),(4604,'São José do Cedro','',NULL,1,24),(4605,'São José do Cerrito','',NULL,1,24),(4606,'São Lourenço do Oeste','',NULL,1,24),(4607,'São Ludgero','',NULL,1,24),(4608,'São Martinho','',NULL,1,24),(4609,'São Miguel da Boa Vista','',NULL,1,24),(4610,'São Miguel do Oeste','',NULL,1,24),(4611,'São Pedro de Alcântara','',NULL,1,24),(4612,'Saudades','',NULL,1,24),(4613,'Schroeder','',NULL,1,24),(4614,'Seara','',NULL,1,24),(4615,'Serra Alta','',NULL,1,24),(4616,'Siderópolis','',NULL,1,24),(4617,'Sombrio','',NULL,1,24),(4618,'Sul Brasil','',NULL,1,24),(4619,'Taió','',NULL,1,24),(4620,'Tangará','',NULL,1,24),(4621,'Tigrinhos','',NULL,1,24),(4622,'Tijucas','',NULL,1,24),(4623,'Timbé do Sul','',NULL,1,24),(4624,'Timbó','',NULL,1,24),(4625,'Timbó Grande','',NULL,1,24),(4626,'Três Barras','',NULL,1,24),(4627,'Treviso','',NULL,1,24),(4628,'Treze de Maio','',NULL,1,24),(4629,'Treze Tílias','',NULL,1,24),(4630,'Trombudo Central','',NULL,1,24),(4631,'Tubarão','',NULL,1,24),(4632,'Tunápolis','',NULL,1,24),(4633,'Turvo','',NULL,1,24),(4634,'União do Oeste','',NULL,1,24),(4635,'Urubici','',NULL,1,24),(4636,'Urupema','',NULL,1,24),(4637,'Urussanga','',NULL,1,24),(4638,'Vargeão','',NULL,1,24),(4639,'Vargem','',NULL,1,24),(4640,'Vargem Bonita','',NULL,1,24),(4641,'Vidal Ramos','',NULL,1,24),(4642,'Videira','',NULL,1,24),(4643,'Vitor Meireles','',NULL,1,24),(4644,'Witmarsum','',NULL,1,24),(4645,'Xanxerê','',NULL,1,24),(4646,'Xavantina','',NULL,1,24),(4647,'Xaxim','',NULL,1,24),(4648,'Zortéa','',NULL,1,24),(4649,'Adamantina','',NULL,1,25),(4650,'Adolfo','',NULL,1,25),(4651,'Aguaí','',NULL,1,25),(4652,'Águas da Prata','',NULL,1,25),(4653,'Águas de Lindóia','',NULL,1,25),(4654,'Águas de Santa Bárbara','',NULL,1,25),(4655,'Águas de São Pedro','',NULL,1,25),(4656,'Agudos','',NULL,1,25),(4657,'Alambari','',NULL,1,25),(4658,'Alfredo Marcondes','',NULL,1,25),(4659,'Altair','',NULL,1,25),(4660,'Altinópolis','',NULL,1,25),(4661,'Alto Alegre','',NULL,1,25),(4662,'Alumínio','',NULL,1,25),(4663,'Álvares Florence','',NULL,1,25),(4664,'Álvares Machado','',NULL,1,25),(4665,'Álvaro de Carvalho','',NULL,1,25),(4666,'Alvinlândia','',NULL,1,25),(4667,'Americana','',NULL,1,25),(4668,'Américo Brasiliense','',NULL,1,25),(4669,'Américo de Campos','',NULL,1,25),(4670,'Amparo','',NULL,1,25),(4671,'Analândia','',NULL,1,25),(4672,'Andradina','',NULL,1,25),(4673,'Angatuba','',NULL,1,25),(4674,'Anhembi','',NULL,1,25),(4675,'Anhumas','',NULL,1,25),(4676,'Aparecida','',NULL,1,25),(4677,'Aparecida d`Oeste','',NULL,1,25),(4678,'Apiaí','',NULL,1,25),(4679,'Araçariguama','',NULL,1,25),(4680,'Araçatuba','',NULL,1,25),(4681,'Araçoiaba da Serra','',NULL,1,25),(4682,'Aramina','',NULL,1,25),(4683,'Arandu','',NULL,1,25),(4684,'Arapeí','',NULL,1,25),(4685,'Araraquara','',NULL,1,25),(4686,'Araras','',NULL,1,25),(4687,'Arco-Íris','',NULL,1,25),(4688,'Arealva','',NULL,1,25),(4689,'Areias','',NULL,1,25),(4690,'Areiópolis','',NULL,1,25),(4691,'Ariranha','',NULL,1,25),(4692,'Artur Nogueira','',NULL,1,25),(4693,'Arujá','',NULL,1,25),(4694,'Aspásia','',NULL,1,25),(4695,'Assis','',NULL,1,25),(4696,'Atibaia','',NULL,1,25),(4697,'Auriflama','',NULL,1,25),(4698,'Avaí','',NULL,1,25),(4699,'Avanhandava','',NULL,1,25),(4700,'Avaré','',NULL,1,25),(4701,'Bady Bassitt','',NULL,1,25),(4702,'Balbinos','',NULL,1,25),(4703,'Bálsamo','',NULL,1,25),(4704,'Bananal','',NULL,1,25),(4705,'Barão de Antonina','',NULL,1,25),(4706,'Barbosa','',NULL,1,25),(4707,'Bariri','',NULL,1,25),(4708,'Barra Bonita','',NULL,1,25),(4709,'Barra do Chapéu','',NULL,1,25),(4710,'Barra do Turvo','',NULL,1,25),(4711,'Barretos','',NULL,1,25),(4712,'Barrinha','',NULL,1,25),(4713,'Barueri','',NULL,1,25),(4714,'Bastos','',NULL,1,25),(4715,'Batatais','',NULL,1,25),(4716,'Bauru','',NULL,1,25),(4717,'Bebedouro','',NULL,1,25),(4718,'Bento de Abreu','',NULL,1,25),(4719,'Bernardino de Campos','',NULL,1,25),(4720,'Bertioga','',NULL,1,25),(4721,'Bilac','',NULL,1,25),(4722,'Birigui','',NULL,1,25),(4723,'Biritiba-Mirim','',NULL,1,25),(4724,'Boa Esperança do Sul','',NULL,1,25),(4725,'Bocaina','',NULL,1,25),(4726,'Bofete','',NULL,1,25),(4727,'Boituva','',NULL,1,25),(4728,'Bom Jesus dos Perdões','',NULL,1,25),(4729,'Bom Sucesso de Itararé','',NULL,1,25),(4730,'Borá','',NULL,1,25),(4731,'Boracéia','',NULL,1,25),(4732,'Borborema','',NULL,1,25),(4733,'Borebi','',NULL,1,25),(4734,'Botucatu','',NULL,1,25),(4735,'Bragança Paulista','',NULL,1,25),(4736,'Braúna','',NULL,1,25),(4737,'Brejo Alegre','',NULL,1,25),(4738,'Brodowski','',NULL,1,25),(4739,'Brotas','',NULL,1,25),(4740,'Buri','',NULL,1,25),(4741,'Buritama','',NULL,1,25),(4742,'Buritizal','',NULL,1,25),(4743,'Cabrália Paulista','',NULL,1,25),(4744,'Cabreúva','',NULL,1,25),(4745,'Caçapava','',NULL,1,25),(4746,'Cachoeira Paulista','',NULL,1,25),(4747,'Caconde','',NULL,1,25),(4748,'Cafelândia','',NULL,1,25),(4749,'Caiabu','',NULL,1,25),(4750,'Caieiras','',NULL,1,25),(4751,'Caiuá','',NULL,1,25),(4752,'Cajamar','',NULL,1,25),(4753,'Cajati','',NULL,1,25),(4754,'Cajobi','',NULL,1,25),(4755,'Cajuru','',NULL,1,25),(4756,'Campina do Monte Alegre','',NULL,1,25),(4757,'Campinas','',NULL,1,25),(4758,'Campo Limpo Paulista','',NULL,1,25),(4759,'Campos do Jordão','',NULL,1,25),(4760,'Campos Novos Paulista','',NULL,1,25),(4761,'Cananéia','',NULL,1,25),(4762,'Canas','',NULL,1,25),(4763,'Cândido Mota','',NULL,1,25),(4764,'Cândido Rodrigues','',NULL,1,25),(4765,'Canitar','',NULL,1,25),(4766,'Capão Bonito','',NULL,1,25),(4767,'Capela do Alto','',NULL,1,25),(4768,'Capivari','',NULL,1,25),(4769,'Caraguatatuba','',NULL,1,25),(4770,'Carapicuíba','',NULL,1,25),(4771,'Cardoso','',NULL,1,25),(4772,'Casa Branca','',NULL,1,25),(4773,'Cássia dos Coqueiros','',NULL,1,25),(4774,'Castilho','',NULL,1,25),(4775,'Catanduva','',NULL,1,25),(4776,'Catiguá','',NULL,1,25),(4777,'Cedral','',NULL,1,25),(4778,'Cerqueira César','',NULL,1,25),(4779,'Cerquilho','',NULL,1,25),(4780,'Cesário Lange','',NULL,1,25),(4781,'Charqueada','',NULL,1,25),(4782,'Chavantes','',NULL,1,25),(4783,'Clementina','',NULL,1,25),(4784,'Colina','',NULL,1,25),(4785,'Colômbia','',NULL,1,25),(4786,'Conchal','',NULL,1,25),(4787,'Conchas','',NULL,1,25),(4788,'Cordeirópolis','',NULL,1,25),(4789,'Coroados','',NULL,1,25),(4790,'Coronel Macedo','',NULL,1,25),(4791,'Corumbataí','',NULL,1,25),(4792,'Cosmópolis','',NULL,1,25),(4793,'Cosmorama','',NULL,1,25),(4794,'Cotia','',NULL,1,25),(4795,'Cravinhos','',NULL,1,25),(4796,'Cristais Paulista','',NULL,1,25),(4797,'Cruzália','',NULL,1,25),(4798,'Cruzeiro','',NULL,1,25),(4799,'Cubatão','',NULL,1,25),(4800,'Cunha','',NULL,1,25),(4801,'Descalvado','',NULL,1,25),(4802,'Diadema','',NULL,1,25),(4803,'Dirce Reis','',NULL,1,25),(4804,'Divinolândia','',NULL,1,25),(4805,'Dobrada','',NULL,1,25),(4806,'Dois Córregos','',NULL,1,25),(4807,'Dolcinópolis','',NULL,1,25),(4808,'Dourado','',NULL,1,25),(4809,'Dracena','',NULL,1,25),(4810,'Duartina','',NULL,1,25),(4811,'Dumont','',NULL,1,25),(4812,'Echaporã','',NULL,1,25),(4813,'Eldorado','',NULL,1,25),(4814,'Elias Fausto','',NULL,1,25),(4815,'Elisiário','',NULL,1,25),(4816,'Embaúba','',NULL,1,25),(4817,'Embu','',NULL,1,25),(4818,'Embu-Guaçu','',NULL,1,25),(4819,'Emilianópolis','',NULL,1,25),(4820,'Engenheiro Coelho','',NULL,1,25),(4821,'Espírito Santo do Pinhal','',NULL,1,25),(4822,'Espírito Santo do Turvo','',NULL,1,25),(4823,'Estiva Gerbi','',NULL,1,25),(4824,'Estrela d`Oeste','',NULL,1,25),(4825,'Estrela do Norte','',NULL,1,25),(4826,'Euclides da Cunha Paulista','',NULL,1,25),(4827,'Fartura','',NULL,1,25),(4828,'Fernando Prestes','',NULL,1,25),(4829,'Fernandópolis','',NULL,1,25),(4830,'Fernão','',NULL,1,25),(4831,'Ferraz de Vasconcelos','',NULL,1,25),(4832,'Flora Rica','',NULL,1,25),(4833,'Floreal','',NULL,1,25),(4834,'Florínia','',NULL,1,25),(4835,'Flórida Paulista','',NULL,1,25),(4836,'Franca','',NULL,1,25),(4837,'Francisco Morato','',NULL,1,25),(4838,'Franco da Rocha','',NULL,1,25),(4839,'Gabriel Monteiro','',NULL,1,25),(4840,'Gália','',NULL,1,25),(4841,'Garça','',NULL,1,25),(4842,'Gastão Vidigal','',NULL,1,25),(4843,'Gavião Peixoto','',NULL,1,25),(4844,'General Salgado','',NULL,1,25),(4845,'Getulina','',NULL,1,25),(4846,'Glicério','',NULL,1,25),(4847,'Guaiçara','',NULL,1,25),(4848,'Guaimbê','',NULL,1,25),(4849,'Guaíra','',NULL,1,25),(4850,'Guapiaçu','',NULL,1,25),(4851,'Guapiara','',NULL,1,25),(4852,'Guará','',NULL,1,25),(4853,'Guaraçaí','',NULL,1,25),(4854,'Guaraci','',NULL,1,25),(4855,'Guarani d`Oeste','',NULL,1,25),(4856,'Guarantã','',NULL,1,25),(4857,'Guararapes','',NULL,1,25),(4858,'Guararema','',NULL,1,25),(4859,'Guaratinguetá','',NULL,1,25),(4860,'Guareí','',NULL,1,25),(4861,'Guariba','',NULL,1,25),(4862,'Guarujá','',NULL,1,25),(4863,'Guarulhos','',NULL,1,25),(4864,'Guatapará','',NULL,1,25),(4865,'Guzolândia','',NULL,1,25),(4866,'Herculândia','',NULL,1,25),(4867,'Holambra','',NULL,1,25),(4868,'Hortolândia','',NULL,1,25),(4869,'Iacanga','',NULL,1,25),(4870,'Iacri','',NULL,1,25),(4871,'Iaras','',NULL,1,25),(4872,'Ibaté','',NULL,1,25),(4873,'Ibirá','',NULL,1,25),(4874,'Ibirarema','',NULL,1,25),(4875,'Ibitinga','',NULL,1,25),(4876,'Ibiúna','',NULL,1,25),(4877,'Icém','',NULL,1,25),(4878,'Iepê','',NULL,1,25),(4879,'Igaraçu do Tietê','',NULL,1,25),(4880,'Igarapava','',NULL,1,25),(4881,'Igaratá','',NULL,1,25),(4882,'Iguape','',NULL,1,25),(4883,'Ilha Comprida','',NULL,1,25),(4884,'Ilha Solteira','',NULL,1,25),(4885,'Ilhabela','',NULL,1,25),(4886,'Indaiatuba','',NULL,1,25),(4887,'Indiana','',NULL,1,25),(4888,'Indiaporã','',NULL,1,25),(4889,'Inúbia Paulista','',NULL,1,25),(4890,'Ipauçu','',NULL,1,25),(4891,'Iperó','',NULL,1,25),(4892,'Ipeúna','',NULL,1,25),(4893,'Ipiguá','',NULL,1,25),(4894,'Iporanga','',NULL,1,25),(4895,'Ipuã','',NULL,1,25),(4896,'Iracemápolis','',NULL,1,25),(4897,'Irapuã','',NULL,1,25),(4898,'Irapuru','',NULL,1,25),(4899,'Itaberá','',NULL,1,25),(4900,'Itaí','',NULL,1,25),(4901,'Itajobi','',NULL,1,25),(4902,'Itaju','',NULL,1,25),(4903,'Itanhaém','',NULL,1,25),(4904,'Itaóca','',NULL,1,25),(4905,'Itapecerica da Serra','',NULL,1,25),(4906,'Itapetininga','',NULL,1,25),(4907,'Itapeva','',NULL,1,25),(4908,'Itapevi','',NULL,1,25),(4909,'Itapira','',NULL,1,25),(4910,'Itapirapuã Paulista','',NULL,1,25),(4911,'Itápolis','',NULL,1,25),(4912,'Itaporanga','',NULL,1,25),(4913,'Itapuí','',NULL,1,25),(4914,'Itapura','',NULL,1,25),(4915,'Itaquaquecetuba','',NULL,1,25),(4916,'Itararé','',NULL,1,25),(4917,'Itariri','',NULL,1,25),(4918,'Itatiba','',NULL,1,25),(4919,'Itatinga','',NULL,1,25),(4920,'Itirapina','',NULL,1,25),(4921,'Itirapuã','',NULL,1,25),(4922,'Itobi','',NULL,1,25),(4923,'Itu','',NULL,1,25),(4924,'Itupeva','',NULL,1,25),(4925,'Ituverava','',NULL,1,25),(4926,'Jaborandi','',NULL,1,25),(4927,'Jaboticabal','',NULL,1,25),(4928,'Jacareí','',NULL,1,25),(4929,'Jaci','',NULL,1,25),(4930,'Jacupiranga','',NULL,1,25),(4931,'Jaguariúna','',NULL,1,25),(4932,'Jales','',NULL,1,25),(4933,'Jambeiro','',NULL,1,25),(4934,'Jandira','',NULL,1,25),(4935,'Jardinópolis','',NULL,1,25),(4936,'Jarinu','',NULL,1,25),(4937,'Jaú','',NULL,1,25),(4938,'Jeriquara','',NULL,1,25),(4939,'Joanópolis','',NULL,1,25),(4940,'João Ramalho','',NULL,1,25),(4941,'José Bonifácio','',NULL,1,25),(4942,'Júlio Mesquita','',NULL,1,25),(4943,'Jumirim','',NULL,1,25),(4944,'Jundiaí','',NULL,1,25),(4945,'Junqueirópolis','',NULL,1,25),(4946,'Juquiá','',NULL,1,25),(4947,'Juquitiba','',NULL,1,25),(4948,'Lagoinha','',NULL,1,25),(4949,'Laranjal Paulista','',NULL,1,25),(4950,'Lavínia','',NULL,1,25),(4951,'Lavrinhas','',NULL,1,25),(4952,'Leme','',NULL,1,25),(4953,'Lençóis Paulista','',NULL,1,25),(4954,'Limeira','',NULL,1,25),(4955,'Lindóia','',NULL,1,25),(4956,'Lins','',NULL,1,25),(4957,'Lorena','',NULL,1,25),(4958,'Lourdes','',NULL,1,25),(4959,'Louveira','',NULL,1,25),(4960,'Lucélia','',NULL,1,25),(4961,'Lucianópolis','',NULL,1,25),(4962,'Luís Antônio','',NULL,1,25),(4963,'Luiziânia','',NULL,1,25),(4964,'Lupércio','',NULL,1,25),(4965,'Lutécia','',NULL,1,25),(4966,'Macatuba','',NULL,1,25),(4967,'Macaubal','',NULL,1,25),(4968,'Macedônia','',NULL,1,25),(4969,'Magda','',NULL,1,25),(4970,'Mairinque','',NULL,1,25),(4971,'Mairiporã','',NULL,1,25),(4972,'Manduri','',NULL,1,25),(4973,'Marabá Paulista','',NULL,1,25),(4974,'Maracaí','',NULL,1,25),(4975,'Marapoama','',NULL,1,25),(4976,'Mariápolis','',NULL,1,25),(4977,'Marília','',NULL,1,25),(4978,'Marinópolis','',NULL,1,25),(4979,'Martinópolis','',NULL,1,25),(4980,'Matão','',NULL,1,25),(4981,'Mauá','',NULL,1,25),(4982,'Mendonça','',NULL,1,25),(4983,'Meridiano','',NULL,1,25),(4984,'Mesópolis','',NULL,1,25),(4985,'Miguelópolis','',NULL,1,25),(4986,'Mineiros do Tietê','',NULL,1,25),(4987,'Mira Estrela','',NULL,1,25),(4988,'Miracatu','',NULL,1,25),(4989,'Mirandópolis','',NULL,1,25),(4990,'Mirante do Paranapanema','',NULL,1,25),(4991,'Mirassol','',NULL,1,25),(4992,'Mirassolândia','',NULL,1,25),(4993,'Mococa','',NULL,1,25),(4994,'Mogi das Cruzes','',NULL,1,25),(4995,'Mogi Guaçu','',NULL,1,25),(4996,'Mogi-Mirim','',NULL,1,25),(4997,'Mombuca','',NULL,1,25),(4998,'Monções','',NULL,1,25),(4999,'Mongaguá','',NULL,1,25),(5000,'Monte Alegre do Sul','',NULL,1,25),(5001,'Monte Alto','',NULL,1,25),(5002,'Monte Aprazível','',NULL,1,25),(5003,'Monte Azul Paulista','',NULL,1,25),(5004,'Monte Castelo','',NULL,1,25),(5005,'Monte Mor','',NULL,1,25),(5006,'Monteiro Lobato','',NULL,1,25),(5007,'Morro Agudo','',NULL,1,25),(5008,'Morungaba','',NULL,1,25),(5009,'Motuca','',NULL,1,25),(5010,'Murutinga do Sul','',NULL,1,25),(5011,'Nantes','',NULL,1,25),(5012,'Narandiba','',NULL,1,25),(5013,'Natividade da Serra','',NULL,1,25),(5014,'Nazaré Paulista','',NULL,1,25),(5015,'Neves Paulista','',NULL,1,25),(5016,'Nhandeara','',NULL,1,25),(5017,'Nipoã','',NULL,1,25),(5018,'Nova Aliança','',NULL,1,25),(5019,'Nova Campina','',NULL,1,25),(5020,'Nova Canaã Paulista','',NULL,1,25),(5021,'Nova Castilho','',NULL,1,25),(5022,'Nova Europa','',NULL,1,25),(5023,'Nova Granada','',NULL,1,25),(5024,'Nova Guataporanga','',NULL,1,25),(5025,'Nova Independência','',NULL,1,25),(5026,'Nova Luzitânia','',NULL,1,25),(5027,'Nova Odessa','',NULL,1,25),(5028,'Novais','',NULL,1,25),(5029,'Novo Horizonte','',NULL,1,25),(5030,'Nuporanga','',NULL,1,25),(5031,'Ocauçu','',NULL,1,25),(5032,'Óleo','',NULL,1,25),(5033,'Olímpia','',NULL,1,25),(5034,'Onda Verde','',NULL,1,25),(5035,'Oriente','',NULL,1,25),(5036,'Orindiúva','',NULL,1,25),(5037,'Orlândia','',NULL,1,25),(5038,'Osasco','',NULL,1,25),(5039,'Oscar Bressane','',NULL,1,25),(5040,'Osvaldo Cruz','',NULL,1,25),(5041,'Ourinhos','',NULL,1,25),(5042,'Ouro Verde','',NULL,1,25),(5043,'Ouroeste','',NULL,1,25),(5044,'Pacaembu','',NULL,1,25),(5045,'Palestina','',NULL,1,25),(5046,'Palmares Paulista','',NULL,1,25),(5047,'Palmeira d`Oeste','',NULL,1,25),(5048,'Palmital','',NULL,1,25),(5049,'Panorama','',NULL,1,25),(5050,'Paraguaçu Paulista','',NULL,1,25),(5051,'Paraibuna','',NULL,1,25),(5052,'Paraíso','',NULL,1,25),(5053,'Paranapanema','',NULL,1,25),(5054,'Paranapuã','',NULL,1,25),(5055,'Parapuã','',NULL,1,25),(5056,'Pardinho','',NULL,1,25),(5057,'Pariquera-Açu','',NULL,1,25),(5058,'Parisi','',NULL,1,25),(5059,'Patrocínio Paulista','',NULL,1,25),(5060,'Paulicéia','',NULL,1,25),(5061,'Paulínia','',NULL,1,25),(5062,'Paulistânia','',NULL,1,25),(5063,'Paulo de Faria','',NULL,1,25),(5064,'Pederneiras','',NULL,1,25),(5065,'Pedra Bela','',NULL,1,25),(5066,'Pedranópolis','',NULL,1,25),(5067,'Pedregulho','',NULL,1,25),(5068,'Pedreira','',NULL,1,25),(5069,'Pedrinhas Paulista','',NULL,1,25),(5070,'Pedro de Toledo','',NULL,1,25),(5071,'Penápolis','',NULL,1,25),(5072,'Pereira Barreto','',NULL,1,25),(5073,'Pereiras','',NULL,1,25),(5074,'Peruíbe','',NULL,1,25),(5075,'Piacatu','',NULL,1,25),(5076,'Piedade','',NULL,1,25),(5077,'Pilar do Sul','',NULL,1,25),(5078,'Pindamonhangaba','',NULL,1,25),(5079,'Pindorama','',NULL,1,25),(5080,'Pinhalzinho','',NULL,1,25),(5081,'Piquerobi','',NULL,1,25),(5082,'Piquete','',NULL,1,25),(5083,'Piracaia','',NULL,1,25),(5084,'Piracicaba','',NULL,1,25),(5085,'Piraju','',NULL,1,25),(5086,'Pirajuí','',NULL,1,25),(5087,'Pirangi','',NULL,1,25),(5088,'Pirapora do Bom Jesus','',NULL,1,25),(5089,'Pirapozinho','',NULL,1,25),(5090,'Pirassununga','',NULL,1,25),(5091,'Piratininga','',NULL,1,25),(5092,'Pitangueiras','',NULL,1,25),(5093,'Planalto','',NULL,1,25),(5094,'Platina','',NULL,1,25),(5095,'Poá','',NULL,1,25),(5096,'Poloni','',NULL,1,25),(5097,'Pompéia','',NULL,1,25),(5098,'Pongaí','',NULL,1,25),(5099,'Pontal','',NULL,1,25),(5100,'Pontalinda','',NULL,1,25),(5101,'Pontes Gestal','',NULL,1,25),(5102,'Populina','',NULL,1,25),(5103,'Porangaba','',NULL,1,25),(5104,'Porto Feliz','',NULL,1,25),(5105,'Porto Ferreira','',NULL,1,25),(5106,'Potim','',NULL,1,25),(5107,'Potirendaba','',NULL,1,25),(5108,'Pracinha','',NULL,1,25),(5109,'Pradópolis','',NULL,1,25),(5110,'Praia Grande','',NULL,1,25),(5111,'Pratânia','',NULL,1,25),(5112,'Presidente Alves','',NULL,1,25),(5113,'Presidente Bernardes','',NULL,1,25),(5114,'Presidente Epitácio','',NULL,1,25),(5115,'Presidente Prudente','',NULL,1,25),(5116,'Presidente Venceslau','',NULL,1,25),(5117,'Promissão','',NULL,1,25),(5118,'Quadra','',NULL,1,25),(5119,'Quatá','',NULL,1,25),(5120,'Queiroz','',NULL,1,25),(5121,'Queluz','',NULL,1,25),(5122,'Quintana','',NULL,1,25),(5123,'Rafard','',NULL,1,25),(5124,'Rancharia','',NULL,1,25),(5125,'Redenção da Serra','',NULL,1,25),(5126,'Regente Feijó','',NULL,1,25),(5127,'Reginópolis','',NULL,1,25),(5128,'Registro','',NULL,1,25),(5129,'Restinga','',NULL,1,25),(5130,'Ribeira','',NULL,1,25),(5131,'Ribeirão Bonito','',NULL,1,25),(5132,'Ribeirão Branco','',NULL,1,25),(5133,'Ribeirão Corrente','',NULL,1,25),(5134,'Ribeirão do Sul','',NULL,1,25),(5135,'Ribeirão dos Índios','',NULL,1,25),(5136,'Ribeirão Grande','',NULL,1,25),(5137,'Ribeirão Pires','',NULL,1,25),(5138,'Ribeirão Preto','',NULL,1,25),(5139,'Rifaina','',NULL,1,25),(5140,'Rincão','',NULL,1,25),(5141,'Rinópolis','',NULL,1,25),(5142,'Rio Claro','',NULL,1,25),(5143,'Rio das Pedras','',NULL,1,25),(5144,'Rio Grande da Serra','',NULL,1,25),(5145,'Riolândia','',NULL,1,25),(5146,'Riversul','',NULL,1,25),(5147,'Rosana','',NULL,1,25),(5148,'Roseira','',NULL,1,25),(5149,'Rubiácea','',NULL,1,25),(5150,'Rubinéia','',NULL,1,25),(5151,'Sabino','',NULL,1,25),(5152,'Sagres','',NULL,1,25),(5153,'Sales','',NULL,1,25),(5154,'Sales Oliveira','',NULL,1,25),(5155,'Salesópolis','',NULL,1,25),(5156,'Salmourão','',NULL,1,25),(5157,'Saltinho','',NULL,1,25),(5158,'Salto','',NULL,1,25),(5159,'Salto de Pirapora','',NULL,1,25),(5160,'Salto Grande','',NULL,1,25),(5161,'Sandovalina','',NULL,1,25),(5162,'Santa Adélia','',NULL,1,25),(5163,'Santa Albertina','',NULL,1,25),(5164,'Santa Bárbara d`Oeste','',NULL,1,25),(5165,'Santa Branca','',NULL,1,25),(5166,'Santa Clara d`Oeste','',NULL,1,25),(5167,'Santa Cruz da Conceição','',NULL,1,25),(5168,'Santa Cruz da Esperança','',NULL,1,25),(5169,'Santa Cruz das Palmeiras','',NULL,1,25),(5170,'Santa Cruz do Rio Pardo','',NULL,1,25),(5171,'Santa Ernestina','',NULL,1,25),(5172,'Santa Fé do Sul','',NULL,1,25),(5173,'Santa Gertrudes','',NULL,1,25),(5174,'Santa Isabel','',NULL,1,25),(5175,'Santa Lúcia','',NULL,1,25),(5176,'Santa Maria da Serra','',NULL,1,25),(5177,'Santa Mercedes','',NULL,1,25),(5178,'Santa Rita d`Oeste','',NULL,1,25),(5179,'Santa Rita do Passa Quatro','',NULL,1,25),(5180,'Santa Rosa de Viterbo','',NULL,1,25),(5181,'Santa Salete','',NULL,1,25),(5182,'Santana da Ponte Pensa','',NULL,1,25),(5183,'Santana de Parnaíba','',NULL,1,25),(5184,'Santo Anastácio','',NULL,1,25),(5185,'Santo André','',NULL,1,25),(5186,'Santo Antônio da Alegria','',NULL,1,25),(5187,'Santo Antônio de Posse','',NULL,1,25),(5188,'Santo Antônio do Aracanguá','',NULL,1,25),(5189,'Santo Antônio do Jardim','',NULL,1,25),(5190,'Santo Antônio do Pinhal','',NULL,1,25),(5191,'Santo Expedito','',NULL,1,25),(5192,'Santópolis do Aguapeí','',NULL,1,25),(5193,'Santos','',NULL,1,25),(5194,'São Bento do Sapucaí','',NULL,1,25),(5195,'São Bernardo do Campo','',NULL,1,25),(5196,'São Caetano do Sul','',NULL,1,25),(5197,'São Carlos','',NULL,1,25),(5198,'São Francisco','',NULL,1,25),(5199,'São João da Boa Vista','',NULL,1,25),(5200,'São João das Duas Pontes','',NULL,1,25),(5201,'São João de Iracema','',NULL,1,25),(5202,'São João do Pau d`Alho','',NULL,1,25),(5203,'São Joaquim da Barra','',NULL,1,25),(5204,'São José da Bela Vista','',NULL,1,25),(5205,'São José do Barreiro','',NULL,1,25),(5206,'São José do Rio Pardo','',NULL,1,25),(5207,'São José do Rio Preto','',NULL,1,25),(5208,'São José dos Campos','',NULL,1,25),(5209,'São Lourenço da Serra','',NULL,1,25),(5210,'São Luís do Paraitinga','',NULL,1,25),(5211,'São Manuel','',NULL,1,25),(5212,'São Miguel Arcanjo','',NULL,1,25),(5213,'São Paulo','',NULL,1,25),(5214,'São Pedro','',NULL,1,25),(5215,'São Pedro do Turvo','',NULL,1,25),(5216,'São Roque','',NULL,1,25),(5217,'São Sebastião','',NULL,1,25),(5218,'São Sebastião da Grama','',NULL,1,25),(5219,'São Simão','',NULL,1,25),(5220,'São Vicente','',NULL,1,25),(5221,'Sarapuí','',NULL,1,25),(5222,'Sarutaiá','',NULL,1,25),(5223,'Sebastianópolis do Sul','',NULL,1,25),(5224,'Serra Azul','',NULL,1,25),(5225,'Serra Negra','',NULL,1,25),(5226,'Serrana','',NULL,1,25),(5227,'Sertãozinho','',NULL,1,25),(5228,'Sete Barras','',NULL,1,25),(5229,'Severínia','',NULL,1,25),(5230,'Silveiras','',NULL,1,25),(5231,'Socorro','',NULL,1,25),(5232,'Sorocaba','',NULL,1,25),(5233,'Sud Mennucci','',NULL,1,25),(5234,'Sumaré','',NULL,1,25),(5235,'Suzanápolis','',NULL,1,25),(5236,'Suzano','',NULL,1,25),(5237,'Tabapuã','',NULL,1,25),(5238,'Tabatinga','',NULL,1,25),(5239,'Taboão da Serra','',NULL,1,25),(5240,'Taciba','',NULL,1,25),(5241,'Taguaí','',NULL,1,25),(5242,'Taiaçu','',NULL,1,25),(5243,'Taiúva','',NULL,1,25),(5244,'Tambaú','',NULL,1,25),(5245,'Tanabi','',NULL,1,25),(5246,'Tapiraí','',NULL,1,25),(5247,'Tapiratiba','',NULL,1,25),(5248,'Taquaral','',NULL,1,25),(5249,'Taquaritinga','',NULL,1,25),(5250,'Taquarituba','',NULL,1,25),(5251,'Taquarivaí','',NULL,1,25),(5252,'Tarabai','',NULL,1,25),(5253,'Tarumã','',NULL,1,25),(5254,'Tatuí','',NULL,1,25),(5255,'Taubaté','',NULL,1,25),(5256,'Tejupá','',NULL,1,25),(5257,'Teodoro Sampaio','',NULL,1,25),(5258,'Terra Roxa','',NULL,1,25),(5259,'Tietê','',NULL,1,25),(5260,'Timburi','',NULL,1,25),(5261,'Torre de Pedra','',NULL,1,25),(5262,'Torrinha','',NULL,1,25),(5263,'Trabiju','',NULL,1,25),(5264,'Tremembé','',NULL,1,25),(5265,'Três Fronteiras','',NULL,1,25),(5266,'Tuiuti','',NULL,1,25),(5267,'Tupã','',NULL,1,25),(5268,'Tupi Paulista','',NULL,1,25),(5269,'Turiúba','',NULL,1,25),(5270,'Turmalina','',NULL,1,25),(5271,'Ubarana','',NULL,1,25),(5272,'Ubatuba','',NULL,1,25),(5273,'Ubirajara','',NULL,1,25),(5274,'Uchoa','',NULL,1,25),(5275,'União Paulista','',NULL,1,25),(5276,'Urânia','',NULL,1,25),(5277,'Uru','',NULL,1,25),(5278,'Urupês','',NULL,1,25),(5279,'Valentim Gentil','',NULL,1,25),(5280,'Valinhos','',NULL,1,25),(5281,'Valparaíso','',NULL,1,25),(5282,'Vargem','',NULL,1,25),(5283,'Vargem Grande do Sul','',NULL,1,25),(5284,'Vargem Grande Paulista','',NULL,1,25),(5285,'Várzea Paulista','',NULL,1,25),(5286,'Vera Cruz','',NULL,1,25),(5287,'Vinhedo','',NULL,1,25),(5288,'Viradouro','',NULL,1,25),(5289,'Vista Alegre do Alto','',NULL,1,25),(5290,'Vitória Brasil','',NULL,1,25),(5291,'Votorantim','',NULL,1,25),(5292,'Votuporanga','',NULL,1,25),(5293,'Zacarias','',NULL,1,25),(5294,'Amparo de São Francisco','',NULL,1,26),(5295,'Aquidabã','',NULL,1,26),(5296,'Aracaju','',NULL,1,26),(5297,'Arauá','',NULL,1,26),(5298,'Areia Branca','',NULL,1,26),(5299,'Barra dos Coqueiros','',NULL,1,26),(5300,'Boquim','',NULL,1,26),(5301,'Brejo Grande','',NULL,1,26),(5302,'Campo do Brito','',NULL,1,26),(5303,'Canhoba','',NULL,1,26),(5304,'Canindé de São Francisco','',NULL,1,26),(5305,'Capela','',NULL,1,26),(5306,'Carira','',NULL,1,26),(5307,'Carmópolis','',NULL,1,26),(5308,'Cedro de São João','',NULL,1,26),(5309,'Cristinápolis','',NULL,1,26),(5310,'Cumbe','',NULL,1,26),(5311,'Divina Pastora','',NULL,1,26),(5312,'Estância','',NULL,1,26),(5313,'Feira Nova','',NULL,1,26),(5314,'Frei Paulo','',NULL,1,26),(5315,'Gararu','',NULL,1,26),(5316,'General Maynard','',NULL,1,26),(5317,'Gracho Cardoso','',NULL,1,26),(5318,'Ilha das Flores','',NULL,1,26),(5319,'Indiaroba','',NULL,1,26),(5320,'Itabaiana','',NULL,1,26),(5321,'Itabaianinha','',NULL,1,26),(5322,'Itabi','',NULL,1,26),(5323,'Itaporanga d`Ajuda','',NULL,1,26),(5324,'Japaratuba','',NULL,1,26),(5325,'Japoatã','',NULL,1,26),(5326,'Lagarto','',NULL,1,26),(5327,'Laranjeiras','',NULL,1,26),(5328,'Macambira','',NULL,1,26),(5329,'Malhada dos Bois','',NULL,1,26),(5330,'Malhador','',NULL,1,26),(5331,'Maruim','',NULL,1,26),(5332,'Moita Bonita','',NULL,1,26),(5333,'Monte Alegre de Sergipe','',NULL,1,26),(5334,'Muribeca','',NULL,1,26),(5335,'Neópolis','',NULL,1,26),(5336,'Nossa Senhora Aparecida','',NULL,1,26),(5337,'Nossa Senhora da Glória','',NULL,1,26),(5338,'Nossa Senhora das Dores','',NULL,1,26),(5339,'Nossa Senhora de Lourdes','',NULL,1,26),(5340,'Nossa Senhora do Socorro','',NULL,1,26),(5341,'Pacatuba','',NULL,1,26),(5342,'Pedra Mole','',NULL,1,26),(5343,'Pedrinhas','',NULL,1,26),(5344,'Pinhão','',NULL,1,26),(5345,'Pirambu','',NULL,1,26),(5346,'Poço Redondo','',NULL,1,26),(5347,'Poço Verde','',NULL,1,26),(5348,'Porto da Folha','',NULL,1,26),(5349,'Propriá','',NULL,1,26),(5350,'Riachão do Dantas','',NULL,1,26),(5351,'Riachuelo','',NULL,1,26),(5352,'Ribeirópolis','',NULL,1,26),(5353,'Rosário do Catete','',NULL,1,26),(5354,'Salgado','',NULL,1,26),(5355,'Santa Luzia do Itanhy','',NULL,1,26),(5356,'Santa Rosa de Lima','',NULL,1,26),(5357,'Santana do São Francisco','',NULL,1,26),(5358,'Santo Amaro das Brotas','',NULL,1,26),(5359,'São Cristóvão','',NULL,1,26),(5360,'São Domingos','',NULL,1,26),(5361,'São Francisco','',NULL,1,26),(5362,'São Miguel do Aleixo','',NULL,1,26),(5363,'Simão Dias','',NULL,1,26),(5364,'Siriri','',NULL,1,26),(5365,'Telha','',NULL,1,26),(5366,'Tobias Barreto','',NULL,1,26),(5367,'Tomar do Geru','',NULL,1,26),(5368,'Umbaúba','',NULL,1,26),(5369,'Abreulândia','',NULL,1,27),(5370,'Aguiarnópolis','',NULL,1,27),(5371,'Aliança do Tocantins','',NULL,1,27),(5372,'Almas','',NULL,1,27),(5373,'Alvorada','',NULL,1,27),(5374,'Ananás','',NULL,1,27),(5375,'Angico','',NULL,1,27),(5376,'Aparecida do Rio Negro','',NULL,1,27),(5377,'Aragominas','',NULL,1,27),(5378,'Araguacema','',NULL,1,27),(5379,'Araguaçu','',NULL,1,27),(5380,'Araguaína','',NULL,1,27),(5381,'Araguanã','',NULL,1,27),(5382,'Araguatins','',NULL,1,27),(5383,'Arapoema','',NULL,1,27),(5384,'Arraias','',NULL,1,27),(5385,'Augustinópolis','',NULL,1,27),(5386,'Aurora do Tocantins','',NULL,1,27),(5387,'Axixá do Tocantins','',NULL,1,27),(5388,'Babaçulândia','',NULL,1,27),(5389,'Bandeirantes do Tocantins','',NULL,1,27),(5390,'Barra do Ouro','',NULL,1,27),(5391,'Barrolândia','',NULL,1,27),(5392,'Bernardo Sayão','',NULL,1,27),(5393,'Bom Jesus do Tocantins','',NULL,1,27),(5394,'Brasilândia do Tocantins','',NULL,1,27),(5395,'Brejinho de Nazaré','',NULL,1,27),(5396,'Buriti do Tocantins','',NULL,1,27),(5397,'Cachoeirinha','',NULL,1,27),(5398,'Campos Lindos','',NULL,1,27),(5399,'Cariri do Tocantins','',NULL,1,27),(5400,'Carmolândia','',NULL,1,27),(5401,'Carrasco Bonito','',NULL,1,27),(5402,'Caseara','',NULL,1,27),(5403,'Centenário','',NULL,1,27),(5404,'Chapada da Natividade','',NULL,1,27),(5405,'Chapada de Areia','',NULL,1,27),(5406,'Colinas do Tocantins','',NULL,1,27),(5407,'Colméia','',NULL,1,27),(5408,'Combinado','',NULL,1,27),(5409,'Conceição do Tocantins','',NULL,1,27),(5410,'Couto de Magalhães','',NULL,1,27),(5411,'Cristalândia','',NULL,1,27),(5412,'Crixás do Tocantins','',NULL,1,27),(5413,'Darcinópolis','',NULL,1,27),(5414,'Dianópolis','',NULL,1,27),(5415,'Divinópolis do Tocantins','',NULL,1,27),(5416,'Dois Irmãos do Tocantins','',NULL,1,27),(5417,'Dueré','',NULL,1,27),(5418,'Esperantina','',NULL,1,27),(5419,'Fátima','',NULL,1,27),(5420,'Figueirópolis','',NULL,1,27),(5421,'Filadélfia','',NULL,1,27),(5422,'Formoso do Araguaia','',NULL,1,27),(5423,'Fortaleza do Tabocão','',NULL,1,27),(5424,'Goianorte','',NULL,1,27),(5425,'Goiatins','',NULL,1,27),(5426,'Guaraí','',NULL,1,27),(5427,'Gurupi','',NULL,1,27),(5428,'Ipueiras','',NULL,1,27),(5429,'Itacajá','',NULL,1,27),(5430,'Itaguatins','',NULL,1,27),(5431,'Itapiratins','',NULL,1,27),(5432,'Itaporã do Tocantins','',NULL,1,27),(5433,'Jaú do Tocantins','',NULL,1,27),(5434,'Juarina','',NULL,1,27),(5435,'Lagoa da Confusão','',NULL,1,27),(5436,'Lagoa do Tocantins','',NULL,1,27),(5437,'Lajeado','',NULL,1,27),(5438,'Lavandeira','',NULL,1,27),(5439,'Lizarda','',NULL,1,27),(5440,'Luzinópolis','',NULL,1,27),(5441,'Marianópolis do Tocantins','',NULL,1,27),(5442,'Mateiros','',NULL,1,27),(5443,'Maurilândia do Tocantins','',NULL,1,27),(5444,'Miracema do Tocantins','',NULL,1,27),(5445,'Miranorte','',NULL,1,27),(5446,'Monte do Carmo','',NULL,1,27),(5447,'Monte Santo do Tocantins','',NULL,1,27),(5448,'Muricilândia','',NULL,1,27),(5449,'Natividade','',NULL,1,27),(5450,'Nazaré','',NULL,1,27),(5451,'Nova Olinda','',NULL,1,27),(5452,'Nova Rosalândia','',NULL,1,27),(5453,'Novo Acordo','',NULL,1,27),(5454,'Novo Alegre','',NULL,1,27),(5455,'Novo Jardim','',NULL,1,27),(5456,'Oliveira de Fátima','',NULL,1,27),(5457,'Palmas','',NULL,1,27),(5458,'Palmeirante','',NULL,1,27),(5459,'Palmeiras do Tocantins','',NULL,1,27),(5460,'Palmeirópolis','',NULL,1,27),(5461,'Paraíso do Tocantins','',NULL,1,27),(5462,'Paranã','',NULL,1,27),(5463,'Pau d`Arco','',NULL,1,27),(5464,'Pedro Afonso','',NULL,1,27),(5465,'Peixe','',NULL,1,27),(5466,'Pequizeiro','',NULL,1,27),(5467,'Pindorama do Tocantins','',NULL,1,27),(5468,'Piraquê','',NULL,1,27),(5469,'Pium','',NULL,1,27),(5470,'Ponte Alta do Bom Jesus','',NULL,1,27),(5471,'Ponte Alta do Tocantins','',NULL,1,27),(5472,'Porto Alegre do Tocantins','',NULL,1,27),(5473,'Porto Nacional','',NULL,1,27),(5474,'Praia Norte','',NULL,1,27),(5475,'Presidente Kennedy','',NULL,1,27),(5476,'Pugmil','',NULL,1,27),(5477,'Recursolândia','',NULL,1,27),(5478,'Riachinho','',NULL,1,27),(5479,'Rio da Conceição','',NULL,1,27),(5480,'Rio dos Bois','',NULL,1,27),(5481,'Rio Sono','',NULL,1,27),(5482,'Sampaio','',NULL,1,27),(5483,'Sandolândia','',NULL,1,27),(5484,'Santa Fé do Araguaia','',NULL,1,27),(5485,'Santa Maria do Tocantins','',NULL,1,27),(5486,'Santa Rita do Tocantins','',NULL,1,27),(5487,'Santa Rosa do Tocantins','',NULL,1,27),(5488,'Santa Tereza do Tocantins','',NULL,1,27),(5489,'Santa Terezinha do Tocantins','',NULL,1,27),(5490,'São Bento do Tocantins','',NULL,1,27),(5491,'São Félix do Tocantins','',NULL,1,27),(5492,'São Miguel do Tocantins','',NULL,1,27),(5493,'São Salvador do Tocantins','',NULL,1,27),(5494,'São Sebastião do Tocantins','',NULL,1,27),(5495,'São Valério da Natividade','',NULL,1,27),(5496,'Silvanópolis','',NULL,1,27),(5497,'Sítio Novo do Tocantins','',NULL,1,27),(5498,'Sucupira','',NULL,1,27),(5499,'Taguatinga','',NULL,1,27),(5500,'Taipas do Tocantins','',NULL,1,27),(5501,'Talismã','',NULL,1,27),(5502,'Tocantínia','',NULL,1,27),(5503,'Tocantinópolis','',NULL,1,27),(5504,'Tupirama','',NULL,1,27),(5505,'Tupiratins','',NULL,1,27),(5506,'Wanderlândia','',NULL,1,27),(5507,'Xambioá','',NULL,1,27);

#
# Structure for table "sme_endereco"
#

CREATE TABLE `sme_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `complemento` varchar(255) NOT NULL,
  `bairro` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `cidade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B4A606A09586CC8` (`cidade_id`),
  CONSTRAINT `endereco_fk01` FOREIGN KEY (`cidade_id`) REFERENCES `sme_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12893 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=196 COMMENT='InnoDB free: 10240 kB; (`cidade_id`) REFER `dgp/sme_cidade`(';

#
# Data for table "sme_endereco"
#

REPLACE INTO `sme_endereco` VALUES (12892,'Avenida Vereador Abrahão João Francisco','3855','','Carvalho','88307303','2016-04-28 16:21:02','0000-00-00 00:00:00',NULL,'-26.92915','-48.68328',1,4481);

#
# Structure for table "sme_particularidade"
#

CREATE TABLE `sme_particularidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `tipo` enum('DEFICIENCIA','TRANSTORNO','SUPERDOTACAO') NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Data for table "sme_particularidade"
#

REPLACE INTO `sme_particularidade` VALUES (1,'Baixa visão','DEFICIENCIA',1),(2,'Cegueira\r','DEFICIENCIA',1),(3,'Deficiência auditiva','DEFICIENCIA',1),(4,'Deficiência física\r','DEFICIENCIA',1),(5,'Deficiência intelectual','DEFICIENCIA',1),(6,'Surdez\r','DEFICIENCIA',1),(7,'Surdocegueira\r','DEFICIENCIA',1),(8,'Deficiência múltipla','DEFICIENCIA',1),(9,'Autismo infantil\r','DEFICIENCIA',1),(10,'Síndrome de Asperger','DEFICIENCIA',1),(11,'Síndrome de Rett','DEFICIENCIA',1),(12,'Transtorno desintegrativo\r\nda infância','TRANSTORNO',1),(13,'Altas habilidades/\r\nSuperdotação','SUPERDOTACAO',1);

#
# Structure for table "sme_pessoa"
#

CREATE TABLE `sme_pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf_cnpj` varchar(14) NOT NULL,
  `data_nascimento` date NOT NULL,
  `email` varchar(200) NOT NULL,
  `genero` varchar(1) NOT NULL,
  `inep` varchar(255) NOT NULL,
  `tipo_pessoa` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `endereco_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `arquivo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endereco_id_UNIQUE` (`endereco_id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  KEY `pessoa_fk03` (`arquivo_id`),
  CONSTRAINT `pessoa_fk03` FOREIGN KEY (`arquivo_id`) REFERENCES `gestaoescolar`.`edu_arquivo` (`id`),
  CONSTRAINT `pessoa_fk01` FOREIGN KEY (`endereco_id`) REFERENCES `sme_endereco` (`id`),
  CONSTRAINT `pessoa_fk02` FOREIGN KEY (`usuario_id`) REFERENCES `sme_intranet_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41905 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=114 COMMENT='InnoDB free: 10240 kB; (`endereco_id`) REFER `dgp/sme_endere';

#
# Data for table "sme_pessoa"
#

REPLACE INTO `sme_pessoa` VALUES (16138,'Secretaria Municipal de Educação','','0000-00-00','educacao@itajai.sc.gov.br','','','Instituicao','2016-06-03 13:34:56','0000-00-00 00:00:00',NULL,1,12892,NULL,NULL),(41904,'Administrador','admin','0000-00-00','','','','PessoaFisica','2016-07-08 15:18:48','0000-00-00 00:00:00',NULL,1,NULL,1,NULL);

#
# Structure for table "edu_unidade_ensino"
#

CREATE TABLE `edu_unidade_ensino` (
  `id` int(11) NOT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_ensino_fk02_idx` (`tipo_id`),
  CONSTRAINT `FK_C03EFDE1BF396750` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `unidade_ensino_fk02` FOREIGN KEY (`tipo_id`) REFERENCES `edu_tipo_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_unidade_ensino"
#


#
# Structure for table "edu_unidade_ensino_curso"
#

CREATE TABLE `edu_unidade_ensino_curso` (
  `unidade_ensino_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`unidade_ensino_id`,`curso_id`),
  KEY `unidade_ensino_curso_fk01_idx` (`unidade_ensino_id`),
  KEY `unidade_ensino_curso_fk02_idx` (`curso_id`),
  CONSTRAINT `unidade_ensino_curso_fk01` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `unidade_ensino_curso_fk02` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_unidade_ensino_curso"
#


#
# Structure for table "edu_quadro_horario"
#

CREATE TABLE `edu_quadro_horario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `turno_inicio` time NOT NULL,
  `turno_termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `modelo_id` int(11) DEFAULT NULL,
  `unidade_ensino_id` int(11) DEFAULT NULL,
  `turno_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_unidade_fk013_idx` (`modelo_id`),
  KEY `quadro_horario_unidade_fk02_idx` (`unidade_ensino_id`),
  KEY `quadro_horario_unidade_fk03_idx` (`turno_id`),
  CONSTRAINT `quadro_horario_unidade_fk01` FOREIGN KEY (`modelo_id`) REFERENCES `edu_quadro_horario_modelo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_unidade_fk02` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_unidade_fk03` FOREIGN KEY (`turno_id`) REFERENCES `edu_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario"
#


#
# Structure for table "edu_quadro_horario_dia_semana"
#

CREATE TABLE `edu_quadro_horario_dia_semana` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dia_semana` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `quadro_horario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_dia_semana_fk01_idx` (`quadro_horario_id`),
  CONSTRAINT `quadro_horario_dia_semana_fk01` FOREIGN KEY (`quadro_horario_id`) REFERENCES `edu_quadro_horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_dia_semana"
#


#
# Structure for table "edu_quadro_horario_aula"
#

CREATE TABLE `edu_quadro_horario_aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `quadro_horario_id` int(11) DEFAULT NULL,
  `quadro_horario_dia_semana_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_aula_fk01_idx` (`quadro_horario_id`),
  KEY `quadro_horario_aula_fk02_idx` (`quadro_horario_dia_semana_id`),
  CONSTRAINT `quadro_horario_aula_fk01` FOREIGN KEY (`quadro_horario_id`) REFERENCES `edu_quadro_horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_aula_fk02` FOREIGN KEY (`quadro_horario_dia_semana_id`) REFERENCES `edu_quadro_horario_dia_semana` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_aula"
#


#
# Structure for table "edu_instituicao"
#

CREATE TABLE `edu_instituicao` (
  `id` int(11) NOT NULL,
  `instituicao_pai_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD57CCD222EAC624` (`instituicao_pai_id`),
  CONSTRAINT `FK_CD57CCD222EAC624` FOREIGN KEY (`instituicao_pai_id`) REFERENCES `edu_instituicao` (`id`),
  CONSTRAINT `FK_CD57CCD2BF396750` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_instituicao"
#

REPLACE INTO `edu_instituicao` VALUES (16138,NULL);

#
# Structure for table "edu_calendario"
#

CREATE TABLE `edu_calendario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `calendario_base_id` int(11) DEFAULT NULL,
  `instituicao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendario_fk02_idx` (`instituicao_id`),
  KEY `IDX_8CB334B73B5FC2BB` (`calendario_base_id`),
  CONSTRAINT `calendario_fk02` FOREIGN KEY (`instituicao_id`) REFERENCES `edu_instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_8CB334B73B5FC2BB` FOREIGN KEY (`calendario_base_id`) REFERENCES `edu_calendario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario"
#


#
# Structure for table "edu_turma"
#

CREATE TABLE `edu_turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `apelido` varchar(255) NOT NULL,
  `limite_alunos` int(11) NOT NULL,
  `data_encerramento` datetime NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `unidade_ensino_id` int(11) DEFAULT NULL,
  `etapa_id` int(11) DEFAULT NULL,
  `turno_id` int(11) DEFAULT NULL,
  `turma_agrupamento_id` int(11) DEFAULT NULL,
  `calendario_id` int(11) DEFAULT NULL,
  `quadro_horario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_fk0_idx` (`etapa_id`),
  KEY `turma_fk1_idx` (`unidade_ensino_id`),
  KEY `turma_fk2_idx` (`turno_id`),
  KEY `turma_fk4_idx` (`turma_agrupamento_id`),
  KEY `turma_fk5_idx` (`calendario_id`),
  KEY `turma_fk00_idx` (`quadro_horario_id`),
  CONSTRAINT `turma_fk01` FOREIGN KEY (`etapa_id`) REFERENCES `edu_etapa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk02` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk03` FOREIGN KEY (`turno_id`) REFERENCES `edu_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk05` FOREIGN KEY (`turma_agrupamento_id`) REFERENCES `edu_turma_agrupamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk06` FOREIGN KEY (`calendario_id`) REFERENCES `edu_calendario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_fk07` FOREIGN KEY (`quadro_horario_id`) REFERENCES `edu_quadro_horario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma"
#


#
# Structure for table "edu_turma_disciplina"
#

CREATE TABLE `edu_turma_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turma_id` int(11) DEFAULT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_disciplina_fk01_idx` (`turma_id`),
  KEY `turma_disciplina_fk02_idx` (`disciplina_id`),
  CONSTRAINT `turma_disciplina_fk01` FOREIGN KEY (`turma_id`) REFERENCES `edu_turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_disciplina_fk02` FOREIGN KEY (`disciplina_id`) REFERENCES `edu_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_disciplina"
#


#
# Structure for table "edu_quadro_horario_aula_turma"
#

CREATE TABLE `edu_quadro_horario_aula_turma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `quadro_horario_aula_id` int(11) DEFAULT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quadro_horario_aula_turma_fk01_idx` (`quadro_horario_aula_id`),
  KEY `quadro_horario_aula_turma_fk02_idx` (`turma_disciplina_id`),
  CONSTRAINT `quadro_horario_aula_turma_fk01` FOREIGN KEY (`quadro_horario_aula_id`) REFERENCES `edu_quadro_horario_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `quadro_horario_aula_turma_fk02` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_quadro_horario_aula_turma"
#


#
# Structure for table "edu_calendario_periodo"
#

CREATE TABLE `edu_calendario_periodo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media` int(11) NOT NULL DEFAULT '0',
  `data_inicio` date NOT NULL DEFAULT '0000-00-00',
  `data_termino` date NOT NULL DEFAULT '0000-00-00',
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_modificacao` timestamp NULL DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `calendario_id` int(11) NOT NULL DEFAULT '0',
  `sistema_avaliacao_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `calendario_periodo_fk02` (`sistema_avaliacao_id`),
  KEY `calendario_periodo_fk01` (`calendario_id`),
  CONSTRAINT `calendario_periodo_fk01` FOREIGN KEY (`calendario_id`) REFERENCES `edu_calendario` (`id`),
  CONSTRAINT `calendario_periodo_fk02` FOREIGN KEY (`sistema_avaliacao_id`) REFERENCES `edu_sistema_avaliacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_periodo"
#


#
# Structure for table "edu_calendario_dia"
#

CREATE TABLE `edu_calendario_dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_dia` date NOT NULL,
  `letivo` tinyint(1) NOT NULL,
  `efetivo` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `calendario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dia_calendario_fk01_idx` (`calendario_id`),
  CONSTRAINT `calendario_dia_fk01` FOREIGN KEY (`calendario_id`) REFERENCES `edu_calendario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_dia"
#


#
# Structure for table "edu_aula"
#

CREATE TABLE `edu_aula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  `dia_id` int(11) DEFAULT NULL,
  `quadro_horario_aula_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aula_fk01_idx` (`turma_disciplina_id`),
  KEY `aula_fk02_idx` (`dia_id`),
  KEY `aula_fk03_idx` (`quadro_horario_aula_id`),
  CONSTRAINT `aula_fk01` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aula_fk02` FOREIGN KEY (`dia_id`) REFERENCES `edu_calendario_dia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aula_fk03` FOREIGN KEY (`quadro_horario_aula_id`) REFERENCES `edu_quadro_horario_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_aula"
#


#
# Structure for table "edu_avaliacao"
#

CREATE TABLE `edu_avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `media` int(11) NOT NULL,
  `tipo_avaliacao` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `aula_id` int(11) DEFAULT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `avaliacao_fk01_idx` (`aula_id`),
  KEY `avaliacao_fk02_idx` (`turma_disciplina_id`),
  KEY `avaliacao_fk03_idx` (`tipo_id`),
  CONSTRAINT `avaliacao_fk01` FOREIGN KEY (`aula_id`) REFERENCES `edu_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `avaliacao_fk02` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `avaliacao_fk03` FOREIGN KEY (`tipo_id`) REFERENCES `edu_avaliacao_tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao"
#


#
# Structure for table "edu_avaliacao_qualitativa"
#

CREATE TABLE `edu_avaliacao_qualitativa` (
  `id` int(11) NOT NULL,
  `regime_fechamento` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_56BA43E2BF396750` FOREIGN KEY (`id`) REFERENCES `edu_avaliacao` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_qualitativa"
#


#
# Structure for table "edu_avaliacao_qualitativa_habilidade"
#

CREATE TABLE `edu_avaliacao_qualitativa_habilidade` (
  `habilidade_id` int(11) NOT NULL,
  `avaliacao_qualitativa_id` int(11) NOT NULL,
  PRIMARY KEY (`avaliacao_qualitativa_id`,`habilidade_id`),
  KEY `avaliacao_qualitativa_habilidade_fk01_idx` (`habilidade_id`),
  KEY `avaliacao_qualitativa_habilidade_fk02_idx` (`avaliacao_qualitativa_id`),
  CONSTRAINT `avaliacao_qualitativa_habilidade_fk01` FOREIGN KEY (`habilidade_id`) REFERENCES `edu_avaliacao_habilidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `avaliacao_qualitativa_habilidade_fk02` FOREIGN KEY (`avaliacao_qualitativa_id`) REFERENCES `edu_avaliacao_qualitativa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_qualitativa_habilidade"
#


#
# Structure for table "edu_avaliacao_quantitativa"
#

CREATE TABLE `edu_avaliacao_quantitativa` (
  `id` int(11) NOT NULL,
  `peso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_22351265BF396750` FOREIGN KEY (`id`) REFERENCES `edu_avaliacao` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_avaliacao_quantitativa"
#


#
# Structure for table "edu_calendario_evento_dia"
#

CREATE TABLE `edu_calendario_evento_dia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inicio` time NOT NULL,
  `termino` time NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `dia_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dia_evento_fk01_idx` (`evento_id`),
  KEY `calendario_evento_dia_fk02_idx` (`dia_id`),
  CONSTRAINT `calendario_evento_dia_fk01` FOREIGN KEY (`evento_id`) REFERENCES `edu_calendario_evento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `calendario_evento_dia_fk02` FOREIGN KEY (`dia_id`) REFERENCES `edu_calendario_dia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_calendario_evento_dia"
#


#
# Structure for table "sme_pessoa_juridica"
#

CREATE TABLE `sme_pessoa_juridica` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_juridica_fk01_idx` (`id`),
  CONSTRAINT `pessoa_juridica_fk01` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=143 COMMENT='InnoDB free: 10240 kB; (`id`) REFER `dgp/sme_pessoa`(`id`); ';

#
# Data for table "sme_pessoa_juridica"
#

REPLACE INTO `sme_pessoa_juridica` VALUES (16138);

#
# Structure for table "sme_pessoa_telefone"
#

CREATE TABLE `sme_pessoa_telefone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `falar_com` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_telefone_fk01` (`pessoa_id`),
  CONSTRAINT `pessoa_telefone_fk01` FOREIGN KEY (`pessoa_id`) REFERENCES `sme_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=59 COMMENT='InnoDB free: 10240 kB; (`pessoa_id`) REFER `dgp/sme_pessoa`(';

#
# Data for table "sme_pessoa_telefone"
#


#
# Structure for table "sme_raca"
#

CREATE TABLE `sme_raca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "sme_raca"
#

REPLACE INTO `sme_raca` VALUES (1,'Branca',1),(2,'Preta',1),(3,'Parda',1),(4,'Amarela',1),(5,'Indígena',1);

#
# Structure for table "sme_pessoa_fisica"
#

CREATE TABLE `sme_pessoa_fisica` (
  `id` int(11) NOT NULL,
  `rg_numero` varchar(255) NOT NULL,
  `rg_orgao_expedidor` varchar(255) NOT NULL,
  `rg_data_expedicao` date NOT NULL,
  `nacionalidade_tipo` varchar(255) NOT NULL,
  `mae_nome` varchar(255) NOT NULL,
  `pai_nome` varchar(255) NOT NULL,
  `responsavel_nome` varchar(255) NOT NULL,
  `certidao_nascimento_completa` varchar(32) NOT NULL,
  `certidao_nascimento_data_expedicao` date NOT NULL,
  `carteira_trabalho_numero` varchar(255) NOT NULL,
  `carteira_trabalho_serie` varchar(255) NOT NULL,
  `carteira_trabalho_data_expedicao` date NOT NULL,
  `nis` varchar(255) NOT NULL,
  `carteira_trabalho_estado_id` int(11) DEFAULT NULL,
  `cidade_nascimento_id` int(11) DEFAULT NULL,
  `estado_civil_id` int(11) DEFAULT NULL,
  `raca_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pessoa_fisica_fk02_idx` (`estado_civil_id`),
  KEY `pessoa_fisica_fk04_idx` (`cidade_nascimento_id`),
  KEY `pessoa_fisica_fk05_idx` (`carteira_trabalho_estado_id`),
  KEY `pessoa_fisica_fk06_idx` (`raca_id`),
  CONSTRAINT `FK_F4375A60BF396750` FOREIGN KEY (`id`) REFERENCES `sme_pessoa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pessoa_fisica_fk02` FOREIGN KEY (`estado_civil_id`) REFERENCES `sme_estado_civil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_fk04` FOREIGN KEY (`cidade_nascimento_id`) REFERENCES `sme_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_fk05` FOREIGN KEY (`carteira_trabalho_estado_id`) REFERENCES `sme_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_fk06` FOREIGN KEY (`raca_id`) REFERENCES `sme_raca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=133 COMMENT='InnoDB free: 10240 kB; (`estado_civil_id`) REFER `dgp/sme_es';

#
# Data for table "sme_pessoa_fisica"
#

REPLACE INTO `sme_pessoa_fisica` VALUES (41904,'','','0000-00-00','','','','','','0000-00-00','','','0000-00-00','',NULL,NULL,NULL,NULL);

#
# Structure for table "sme_pessoa_fisica_particularidade"
#

CREATE TABLE `sme_pessoa_fisica_particularidade` (
  `pessoa_fisica_id` int(11) NOT NULL,
  `particularidade_id` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_fisica_id`,`particularidade_id`),
  KEY `sme_pessoa_fisica_particularidade_fk0_idx` (`pessoa_fisica_id`),
  KEY `sme_pessoa_fisica_particularidade_fk1_idx` (`particularidade_id`),
  CONSTRAINT `pessoa_fisica_particularidade_fk01` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_particularidade_fk02` FOREIGN KEY (`particularidade_id`) REFERENCES `sme_particularidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sme_pessoa_fisica_particularidade"
#


#
# Structure for table "sme_pessoa_fisica_necessidade_especial"
#

CREATE TABLE `sme_pessoa_fisica_necessidade_especial` (
  `pessoa_fisica_id` int(11) NOT NULL,
  `necessidade_especial_id` int(11) NOT NULL,
  PRIMARY KEY (`pessoa_fisica_id`,`necessidade_especial_id`),
  KEY `sme_pessoa_fisica_necessidade_especial_fk0_idx` (`pessoa_fisica_id`),
  KEY `sme_pessoa_fisica_necessidade_especial_fk1_idx` (`necessidade_especial_id`),
  CONSTRAINT `pessoa_fisica_necessidade_especial_fk01` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pessoa_fisica_necessidade_especial_fk02` FOREIGN KEY (`necessidade_especial_id`) REFERENCES `sme_necessidade_especial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "sme_pessoa_fisica_necessidade_especial"
#


#
# Structure for table "edu_matricula"
#

CREATE TABLE `edu_matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `alfabetizado` year(4) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `status` enum('CURSANDO','APROVADO','REPROVADO','TRANCADO','ABANDONO','FALECIDO') NOT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_fisica_aluno_id` int(11) DEFAULT NULL,
  `curso_id` int(11) DEFAULT NULL,
  `unidade_ensino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matricula_fk2_idx` (`pessoa_fisica_aluno_id`),
  KEY `matricula_fk2_idx1` (`curso_id`),
  KEY `matricula_fk4_idx` (`unidade_ensino_id`),
  CONSTRAINT `matricula_fk2` FOREIGN KEY (`pessoa_fisica_aluno_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_fk3` FOREIGN KEY (`curso_id`) REFERENCES `edu_curso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_fk4` FOREIGN KEY (`unidade_ensino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_matricula"
#


#
# Structure for table "edu_movimentacao"
#

CREATE TABLE `edu_movimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `justificativa` varchar(255) NOT NULL,
  `tipo_movimentacao` enum('TRANSFERENCIA','MOVIMENTACAO_TURMA','DESLIGAMENTO') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimentacao_fk01_idx` (`matricula_id`),
  CONSTRAINT `movimentacao_fk01` FOREIGN KEY (`matricula_id`) REFERENCES `edu_matricula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao"
#


#
# Structure for table "edu_movimentacao_desligamento"
#

CREATE TABLE `edu_movimentacao_desligamento` (
  `id` int(11) NOT NULL,
  `destino` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_64B3CC05BF396750` FOREIGN KEY (`id`) REFERENCES `edu_movimentacao` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao_desligamento"
#


#
# Structure for table "edu_movimentacao_transferencia"
#

CREATE TABLE `edu_movimentacao_transferencia` (
  `id` int(11) NOT NULL,
  `resposta` varchar(255) NOT NULL,
  `status` enum('PENDENTE','ACEITO','RECUSADO') NOT NULL,
  `data_encerramento` datetime NOT NULL,
  `data_agendamento` date NOT NULL,
  `unidade_ensino_origem_id` int(11) DEFAULT NULL,
  `unidade_ensino_destino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transferencia_fk02_idx` (`unidade_ensino_origem_id`),
  KEY `transferencia_fk03_idx` (`unidade_ensino_destino_id`),
  CONSTRAINT `FK_1AE9B8C1BF396750` FOREIGN KEY (`id`) REFERENCES `edu_movimentacao` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transferencia_fk02` FOREIGN KEY (`unidade_ensino_origem_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `transferencia_fk03` FOREIGN KEY (`unidade_ensino_destino_id`) REFERENCES `edu_unidade_ensino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao_transferencia"
#


#
# Structure for table "edu_enturmacao"
#

CREATE TABLE `edu_enturmacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `encerrado` tinyint(1) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  `turma_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enturmacao_fk01_idx` (`matricula_id`),
  KEY `enturmacao_fk02_idx` (`turma_id`),
  CONSTRAINT `enturmacao_fk01` FOREIGN KEY (`matricula_id`) REFERENCES `edu_matricula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `enturmacao_fk02` FOREIGN KEY (`turma_id`) REFERENCES `edu_turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_enturmacao"
#


#
# Structure for table "edu_matricula_disciplina"
#

CREATE TABLE `edu_matricula_disciplina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('CURSANDO','APROVADO','REPROVADO','DISPENSADO','INCOMPLETO') NOT NULL,
  `frequencia_total` varchar(255) NOT NULL,
  `media_final` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_encerramento` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_id` int(11) DEFAULT NULL,
  `enturmacao_id` int(11) DEFAULT NULL,
  `disciplina_id` int(11) DEFAULT NULL,
  `turma_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `matricula_disciplina_fk01_idx` (`matricula_id`),
  KEY `matricula_disciplina_fk02_idx` (`enturmacao_id`),
  KEY `matricula_disciplina_fk03_idx` (`disciplina_id`),
  KEY `matricula_disciplina_fk04_idx` (`turma_disciplina_id`),
  CONSTRAINT `matricula_disciplina_fk01` FOREIGN KEY (`matricula_id`) REFERENCES `edu_matricula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_disciplina_fk02` FOREIGN KEY (`enturmacao_id`) REFERENCES `edu_enturmacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_disciplina_fk03` FOREIGN KEY (`disciplina_id`) REFERENCES `edu_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `matricula_disciplina_fk04` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_matricula_disciplina"
#


#
# Structure for table "edu_media"
#

CREATE TABLE `edu_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `matricula_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_fk01_idx` (`matricula_disciplina_id`),
  CONSTRAINT `media_fk01` FOREIGN KEY (`matricula_disciplina_id`) REFERENCES `edu_matricula_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_media"
#


#
# Structure for table "edu_nota"
#

CREATE TABLE `edu_nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `tipo_nota` enum('NOTA_QUANTITATIVA','NOTA_QUALITATIVA') NOT NULL,
  `avaliacao_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_fk01_idx` (`avaliacao_id`),
  KEY `nota_fk02_idx` (`media_id`),
  CONSTRAINT `nota_fk01` FOREIGN KEY (`avaliacao_id`) REFERENCES `edu_avaliacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_fk02` FOREIGN KEY (`media_id`) REFERENCES `edu_media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota"
#


#
# Structure for table "edu_nota_qualitativa"
#

CREATE TABLE `edu_nota_qualitativa` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_6050A232BF396750` FOREIGN KEY (`id`) REFERENCES `edu_nota` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota_qualitativa"
#


#
# Structure for table "edu_nota_qualitativa_habilidade"
#

CREATE TABLE `edu_nota_qualitativa_habilidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `habilidade_id` int(11) DEFAULT NULL,
  `conceito_id` int(11) DEFAULT NULL,
  `nota_qualitativa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nota_qualitativa_habilidade_fk01_idx` (`habilidade_id`),
  KEY `nota_qualitativa_habilidade_fk01_idx1` (`conceito_id`),
  KEY `nota_qualitativa_habilidade_fk03_idx` (`nota_qualitativa_id`),
  CONSTRAINT `nota_qualitativa_habilidade_fk01` FOREIGN KEY (`habilidade_id`) REFERENCES `edu_avaliacao_habilidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_qualitativa_habilidade_fk02` FOREIGN KEY (`conceito_id`) REFERENCES `edu_avaliacao_conceito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nota_qualitativa_habilidade_fk03` FOREIGN KEY (`nota_qualitativa_id`) REFERENCES `edu_nota_qualitativa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota_qualitativa_habilidade"
#


#
# Structure for table "edu_nota_quantitativa"
#

CREATE TABLE `edu_nota_quantitativa` (
  `id` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_A4D02A50BF396750` FOREIGN KEY (`id`) REFERENCES `edu_nota` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_nota_quantitativa"
#


#
# Structure for table "edu_turma_media"
#

CREATE TABLE `edu_turma_media` (
  `id` int(11) NOT NULL,
  `numero` tinyint(1) NOT NULL,
  `data_abertura` timestamp NULL DEFAULT NULL,
  `data_fechamento` timestamp NULL DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_modificacao` timestamp NULL DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `turma_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `turma_media_fk01_idx` (`turma_id`),
  KEY `turma_media_fk02_idx` (`media_id`),
  CONSTRAINT `turma_media_fk01` FOREIGN KEY (`turma_id`) REFERENCES `edu_turma` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_media_fk02` FOREIGN KEY (`media_id`) REFERENCES `edu_media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_media"
#


#
# Structure for table "edu_frequencia"
#

CREATE TABLE `edu_frequencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('FALTA','FALTA_JUSTIFICADA','PRESENCA','DISPENSA') NOT NULL,
  `justificativa` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `aula_id` int(11) DEFAULT NULL,
  `matricula_disciplina_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `frequencia_fk02_idx` (`aula_id`),
  KEY `frequencia_fk01_idx` (`matricula_disciplina_id`),
  CONSTRAINT `frequencia_fk01` FOREIGN KEY (`matricula_disciplina_id`) REFERENCES `edu_matricula_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `frequencia_fk02` FOREIGN KEY (`aula_id`) REFERENCES `edu_aula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_frequencia"
#


#
# Structure for table "edu_movimentacao_turma"
#

CREATE TABLE `edu_movimentacao_turma` (
  `id` int(11) NOT NULL,
  `enturmacao_origem_id` int(11) DEFAULT NULL,
  `enturmacao_destino_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimentacao_turma_fk02_idx` (`enturmacao_origem_id`),
  KEY `movimentacao_turma_fk03_idx` (`enturmacao_destino_id`),
  CONSTRAINT `FK_BD6FA8ABBF396750` FOREIGN KEY (`id`) REFERENCES `edu_movimentacao` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movimentacao_turma_fk02` FOREIGN KEY (`enturmacao_origem_id`) REFERENCES `edu_enturmacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `movimentacao_turma_fk03` FOREIGN KEY (`enturmacao_destino_id`) REFERENCES `edu_enturmacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_movimentacao_turma"
#


#
# Structure for table "edu_solicitacao_vaga"
#

CREATE TABLE `edu_solicitacao_vaga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `data_solicitacao` varchar(255) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_fisica_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D08A08679B4F7` (`pessoa_fisica_id`),
  CONSTRAINT `solicitacao_vaga_fk01` FOREIGN KEY (`pessoa_fisica_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_solicitacao_vaga"
#


#
# Structure for table "edu_vinculo"
#

CREATE TABLE `edu_vinculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(255) NOT NULL,
  `tipo_contrato` enum('EFETIVO','TEMPORARIO') NOT NULL,
  `carga_horaria` int(11) NOT NULL,
  `status` enum('ATIVO','AFASTADO','DESLIGADO') NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `pessoa_fisica_funcionario_id` int(11) DEFAULT NULL,
  `instituicao_id` int(11) DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vinculo_fk01_idx` (`pessoa_fisica_funcionario_id`),
  KEY `vinculo_fk02_idx` (`instituicao_id`),
  KEY `vincilo_fk03_idx` (`cargo_id`),
  CONSTRAINT `vincilo_fk03` FOREIGN KEY (`cargo_id`) REFERENCES `edu_cargo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vinculo_fk01` FOREIGN KEY (`pessoa_fisica_funcionario_id`) REFERENCES `sme_pessoa_fisica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vinculo_fk02` FOREIGN KEY (`instituicao_id`) REFERENCES `edu_instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_vinculo"
#


#
# Structure for table "edu_alocacao"
#

CREATE TABLE `edu_alocacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carga_horaria` int(11) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_modificacao` datetime NOT NULL,
  `data_exclusao` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL,
  `vinculo_id` int(11) DEFAULT NULL,
  `instituicao_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alocacao_fk01_idx` (`vinculo_id`),
  KEY `alocacao_fk02_idx` (`instituicao_id`),
  CONSTRAINT `alocacao_fk01` FOREIGN KEY (`vinculo_id`) REFERENCES `edu_vinculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `alocacao_fk02` FOREIGN KEY (`instituicao_id`) REFERENCES `edu_instituicao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_alocacao"
#


#
# Structure for table "edu_turma_disciplina_alocacao"
#

CREATE TABLE `edu_turma_disciplina_alocacao` (
  `turma_disciplina_id` int(11) NOT NULL,
  `alocacao_id` int(11) NOT NULL,
  PRIMARY KEY (`turma_disciplina_id`,`alocacao_id`),
  KEY `disciplina_ofertada_professor_fk01_idx` (`turma_disciplina_id`),
  KEY `disciplina_ofertada_professor_fk02_idx` (`alocacao_id`),
  CONSTRAINT `turma_disciplina_alocacao_fk01` FOREIGN KEY (`turma_disciplina_id`) REFERENCES `edu_turma_disciplina` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `turma_disciplina_alocacao_fk02` FOREIGN KEY (`alocacao_id`) REFERENCES `edu_alocacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "edu_turma_disciplina_alocacao"
#

