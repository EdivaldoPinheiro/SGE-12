create database Escola;
use Escola;

create table area_formacao(
    id_area_formacao int not null primary key,
    nome_area_formacao varchar(50) not null
);

create table curso(
    id_curso int not null primary key,
    nome_curso varchar(50) not null,
    cod_area_formacao int,
    Foreign Key(cod_area_formacao) references area_formacao(id_area_formacao)
);
create table classe(
    id_classe int not null primary key,
    nivel varchar(50) not null,
    preco_propina float
);

create table turma (
    id_turma int not null primary key,
    nome_turma varchar(50) not null,
    cod_curso int,
    Foreign Key(cod_curso) references curso(id_curso),
    cod_classe int,
    Foreign Key(cod_classe) references classe(id_classe)
);

create table matricula (
    id_matricula int not null primary key auto_increment,
    num_processo int not null unique 
);

create table aluno (
    id_aluno int not null primary key auto_increment,
    nome_aluno varchar(50) not null,
    data_nascimento date not null,
    sexo enum("M", "F") not null,
    nome_pai varchar(50) not null,
    nome_mae varchar(50) not null,
    estado_civil enum("C","S","D") not null,
    cod_matricula int,
    contacto_encarregado int,
    FOREIGN KEY(contacto_encarregado) REFERENCES contactos_encarregados(contacto),
    Foreign key(cod_matricula) references matricula(id_matricula),
    cod_turma int,
    Foreign Key(cod_turma) references turma(id_turma)
);

create table meses (
    id_mes int not null primary key auto_increment,
    nome_mes varchar(20) not null
);

create table propina (
    id_propina int not null primary key auto_increment,
    cod_mes int,
    Foreign Key(cod_mes) references meses(id_mes),
    cod_matricula int,
    Foreign Key(cod_matricula) references matricula(id_matricula),
    cod_classe int,
    Foreign Key(cod_classe) references classe(id_classe),
    data_propina date not null,
    valor_pago float not null
);
create table contactos_encarregados(
    id_contacto int auto_increment primary key,
    contacto int not null
);