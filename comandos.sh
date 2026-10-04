#!/bin/bash

# ============================================================

# AWS re/Start - Laboratório 241

# Gerenciar Serviços

#

# Este arquivo documenta os principais comandos utilizados

# durante o laboratório.

#

# A conexão com a instância foi realizada no Windows usando:

# PuTTY + labsuser.ppk + usuário ec2-user

#

# Este arquivo serve como documentação dos comandos.

# Alguns comandos dependem do ambiente do laboratório e

# não devem ser executados todos de uma vez.

# ============================================================

# ============================================================

# 1. GERENCIAR O SERVIÇO HTTPD

# ============================================================

# Verifica o estado atual do serviço Apache.

sudo systemctl status httpd.service

# Inicia o serviço Apache.

sudo systemctl start httpd.service

# Verifica novamente se o serviço está em execução.

sudo systemctl status httpd.service

# Para o serviço Apache.

sudo systemctl stop httpd.service

# ============================================================

# 2. TESTAR O SERVIDOR HTTP

# ============================================================

# Depois de iniciar o serviço httpd, o servidor pode ser

# acessado pelo navegador utilizando o IP público da instância.

#

# Exemplo:

#

# http://<PublicIP>

#

# Não coloque o IP público real da instância no repositório.

# ============================================================

# 3. MONITORAR O SISTEMA COM TOP

# ============================================================

# Exibe os processos em execução e informações sobre

# utilização de CPU e memória.

top

# Para sair do comando top:

# pressione q

# ============================================================

# 4. EXECUTAR A CARGA DE TRABALHO

# ============================================================

# Executa o script stress.sh em segundo plano e inicia

# o comando top para acompanhar a utilização dos recursos.

./stress.sh & top

# Durante a execução do stress.sh, observe principalmente:

#

# - Utilização da CPU

# - Processos em execução

# - Memória utilizada

#

# Para sair do top:

# pressione q

# ============================================================

# 5. AWS CLOUDWATCH

# ============================================================

# O CloudWatch foi acessado pelo AWS Management Console.

#

# Caminho utilizado no laboratório:

#

# AWS Management Console

# ↓

# CloudWatch

# ↓

# Dashboard

# ↓

# Automatic dashboards

# ↓

# EC2

#

# No dashboard foram observadas métricas como:

#

# CPU Utilization

# DiskReadBytes

# DiskReadOps

# DiskWriteBytes

# DiskWriteOps

# NetworkIn

# ============================================================

# 6. OBSERVAÇÃO DA CPU

# ============================================================

# Durante a execução do stress.sh, a utilização da CPU

# apresentou aumento.

#

# O objetivo foi observar esse aumento:

#

# 1. Diretamente no Linux utilizando o comando top.

# 2. No AWS CloudWatch utilizando a métrica CPU Utilization.

#

# Após o término da carga de trabalho, a utilização da CPU

# voltou a diminuir.

# ============================================================

# 7. CONEXÃO SSH - REFERÊNCIA

# ============================================================

# A conexão real deste laboratório foi feita pelo Windows

# utilizando PuTTY e a chave labsuser.ppk.

#

# Configuração utilizada:

#

# Host Name: <PublicIP>

# Port: 22

# Connection type: SSH

#

# Chave:

# Connection > SSH > Auth > Credentials > labsuser.ppk

#

# Usuário:

# ec2-user

# ============================================================

# OBSERVAÇÃO SOBRE PEM

# ============================================================

# O material do laboratório também apresenta um procedimento

# para usuários macOS/Linux utilizando uma chave .pem.

#

# Esse procedimento NÃO foi utilizado na conexão deste

# laboratório.

#

# Exemplo apenas como referência:

#

# chmod 400 labsuser.pem

# ssh -i labsuser.pem ec2-user@<public-ip>

#

# Nunca coloque arquivos .pem ou .ppk no GitHub.
