# AWS re/Start — Laboratório 241: Gerenciar Serviços

Este laboratório apresenta conceitos de gerenciamento e monitoramento de serviços em uma instância Amazon Linux EC2. Foram praticados o gerenciamento do serviço `httpd` utilizando `systemctl`, o monitoramento de processos com `top` e a observação de métricas da instância utilizando o AWS CloudWatch.

## Objetivos

* Verificar o status do serviço `httpd`.
* Iniciar e parar o serviço `httpd`.
* Confirmar o funcionamento do servidor HTTP.
* Utilizar o comando `top` para monitorar processos e recursos do sistema.
* Executar uma carga de trabalho para observar o aumento do uso da CPU.
* Utilizar o AWS CloudWatch para monitorar métricas da instância EC2.
* Observar a variação da utilização da CPU no CloudWatch.

## Ambiente

* **AWS re/Start**
* **AWS Vocareum**
* **Amazon EC2**
* **Amazon Linux**
* **SSH**
* **Windows**
* **PuTTY**
* **Chave:** `labsuser.ppk`
* **Usuário:** `ec2-user`

---

## 1. Conexão com a instância EC2

Neste laboratório, a conexão com a instância EC2 foi realizada utilizando o PuTTY no Windows.

Configuração utilizada:

```text
Host Name: <PublicIP>
Port: 22
Connection type: SSH
```

A chave `labsuser.ppk` foi configurada em:

```text
Connection > SSH > Auth > Credentials
```

Após a conexão, foi utilizado o usuário:

```text
ec2-user
```

> A chave privada utilizada para a conexão não deve ser enviada para o GitHub.

---

## 2. Gerenciar o serviço httpd

O `httpd` é o serviço do servidor web Apache instalado na instância.

O primeiro passo foi verificar o estado do serviço:

```bash
sudo systemctl status httpd.service
```

Inicialmente, o serviço poderia aparecer como:

```text
inactive (dead)
```

Isso indica que o serviço está instalado e carregado, mas não está em execução.

### Iniciar o serviço

Para iniciar o Apache:

```bash
sudo systemctl start httpd.service
```

Depois, o estado foi verificado novamente:

```bash
sudo systemctl status httpd.service
```

Quando iniciado corretamente, o serviço aparece como:

```text
active (running)
```

### Testar o servidor HTTP

Com o serviço `httpd` em execução, foi possível testar o servidor utilizando o endereço IP público da instância:

```text
http://<PublicIP>
```

O acesso pelo navegador deve apresentar a página de teste do Apache HTTP Server.

### Parar o serviço

Após o teste, o serviço foi interrompido:

```bash
sudo systemctl stop httpd.service
```

---

## 3. Comandos utilizados para o serviço

| Comando            | Função                                            |
| ------------------ | ------------------------------------------------- |
| `systemctl status` | Verifica o estado de um serviço                   |
| `systemctl start`  | Inicia um serviço                                 |
| `systemctl stop`   | Para um serviço                                   |
| `sudo`             | Executa o comando com privilégios administrativos |

Os comandos utilizados no laboratório foram:

```bash
sudo systemctl status httpd.service
sudo systemctl start httpd.service
sudo systemctl status httpd.service
sudo systemctl stop httpd.service
```

---

## 4. Monitoramento com o comando top

O comando `top` foi utilizado para visualizar os processos em execução e acompanhar a utilização dos recursos da instância.

Para iniciar o monitoramento:

```bash
top
```

O `top` apresenta informações como:

* Processos em execução;
* Uso da CPU;
* Uso da memória;
* Número de tarefas;
* Processos em diferentes estados;
* Informações sobre os recursos do sistema.

Para sair do `top`, foi utilizada a tecla:

```text
q
```

---

## 5. Simular uma carga de trabalho

O laboratório disponibiliza o script `stress.sh`, utilizado para simular uma carga de trabalho na CPU da instância.

O comando utilizado foi:

```bash
./stress.sh & top
```

O símbolo `&` permite que o script seja executado em segundo plano enquanto o `top` é iniciado para acompanhar o comportamento do sistema.

Durante a execução do script, foi possível observar um aumento na utilização da CPU.

O script foi projetado para executar uma carga durante aproximadamente seis minutos, conforme descrito no laboratório.

---

## 6. Monitoramento com AWS CloudWatch

Depois de observar o comportamento da instância utilizando o `top`, foi utilizado o **AWS CloudWatch** para visualizar métricas da instância EC2.

No AWS Management Console, foi acessado o serviço:

```text
CloudWatch
```

Em seguida:

```text
Dashboard
→ Automatic dashboards
→ EC2
```

O dashboard automático do EC2 apresenta métricas relacionadas às instâncias.

Entre as métricas observadas estão:

* CPU Utilization;
* DiskReadBytes;
* DiskReadOps;
* DiskWriteBytes;
* DiskWriteOps;
* NetworkIn.

---

## 7. Observar o uso da CPU

Durante a execução do `stress.sh`, foi possível observar uma elevação na utilização da CPU.

Essa elevação também pôde ser identificada no gráfico de **CPU Utilization** do CloudWatch.

O objetivo foi comparar o comportamento observado diretamente no Linux com as métricas disponibilizadas pelo serviço AWS CloudWatch.

Após o término da carga de trabalho, a utilização da CPU voltou a diminuir.

O laboratório orienta aguardar alguns minutos e retornar ao dashboard para observar essa redução.

---

## 8. CloudWatch e monitoramento

O CloudWatch permite acompanhar métricas dos recursos da AWS.

Neste laboratório, foi utilizado principalmente para observar a utilização da CPU da instância EC2.

O dashboard automático do EC2 fornece uma visão das métricas da instância sem a necessidade de executar comandos diretamente no terminal.

Os dashboards do CloudWatch também podem ser personalizados para organizar e acompanhar diferentes métricas.

---

## 9. Conceitos praticados

### `systemctl`

Utilizado para consultar e controlar serviços no Linux.

### `httpd`

Serviço do servidor web Apache utilizado neste laboratório.

### `top`

Utilizado para acompanhar processos e utilização dos recursos do sistema em tempo real.

### `stress.sh`

Script disponibilizado no laboratório para simular uma carga de trabalho na CPU.

### AWS CloudWatch

Serviço da AWS utilizado para monitoramento e visualização de métricas dos recursos.

### CPU Utilization

Métrica utilizada para acompanhar a utilização da CPU da instância EC2.

---

## 10. Principais comandos

```bash
# Verificar o status do Apache
sudo systemctl status httpd.service

# Iniciar o Apache
sudo systemctl start httpd.service

# Verificar novamente o status
sudo systemctl status httpd.service

# Parar o Apache
sudo systemctl stop httpd.service

# Monitorar processos e recursos
top

# Executar o script de carga e iniciar o monitoramento
./stress.sh & top
```

---

## 11. Aprendizados

Neste laboratório, foram praticados:

* Gerenciamento de serviços Linux;
* Verificação do estado de um serviço;
* Inicialização e parada de serviços;
* Utilização do `systemctl`;
* Teste de um servidor HTTP;
* Monitoramento de processos com `top`;
* Observação da utilização da CPU;
* Simulação de carga de trabalho;
* Monitoramento de uma instância EC2 com CloudWatch;
* Análise da métrica de utilização da CPU.

## 12. Arquivos do repositório

```text
aws-restart-laboratorio-241-gerenciar-servicos/
├── README.md
├── comandos.sh
└── .gitignore
```

### `README.md`

Documentação do laboratório, procedimentos realizados, comandos e conceitos aprendidos.

### `comandos.sh`

Comandos utilizados durante o laboratório, acompanhados de comentários explicativos.

### `.gitignore`

Arquivos e extensões que não devem ser enviados para o repositório, principalmente chaves privadas e arquivos temporários.

## Conclusão

O laboratório permitiu compreender como gerenciar serviços em uma instância Linux utilizando `systemctl` e como verificar o funcionamento de um servidor web Apache.

Também foi possível comparar o monitoramento realizado diretamente no Linux com `top` com o monitoramento disponibilizado pelo AWS CloudWatch, observando principalmente o comportamento da utilização da CPU durante uma carga de trabalho.
