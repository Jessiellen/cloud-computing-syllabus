# Projeto Terraform: Cluster Kubernetes Multicliente com Implantação Odoo

Este projeto usa o **Terraform** para criar uma infraestrutura que gerencia um cluster Kubernetes multicliente, com implantação do **Odoo** e **PostgreSQL**. A infraestrutura é projetada para suportar múltiplos clientes, com namespaces dinâmicos e acesso HTTPS seguro ao Odoo.

## Objetivo do Projeto

Automatizar a criação de uma infraestrutura flexível e escalável que atenda aos seguintes requisitos:

- **Suporte a múltiplos clientes** (Netflix, Meta, Estrela do Rock).
- **Criação de namespaces dinâmicos** no Kubernetes (por exemplo: `dev`, `qa`, `prod`).
- **Implantação do Odoo** e PostgreSQL no Kubernetes.
- **Configuração de acesso HTTPS seguro** para o Odoo usando o Ingress e certificados SSL/TLS.

## Estrutura do Projeto

A estrutura de diretórios e arquivos do projeto é a seguinte:









## Como Executar o Projeto ### 
Antes de começar, você precisa ter os seguintes programas instalados: - 

[Terraform](https://www.terraform.io/downloads.html) (versão 1.0 ou superior) - 

[Minikube](https://minikube.sigs.k8s.io/docs/) (para criar o cluster Kubernetes localmente) - 

[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (para interagir com o Kubernetes) 

### Passo 1: Inicializar o Terraform Clone o repositório e entre no diretório do projeto: 
```bash git clone https://github.com/usuario/terraform-k8s-odoo.git cd terraform-k8s-odoo

Agora, inicialize o Terraform:

terraform init

### Passo 2: Configurar os Espaços de Trabalho e Variáveis

O projeto utiliza espaços de trabalho no Terraform para cada cliente. Selecione o espaço de trabalho para o cliente desejado. Exemplo para o cliente "Netflix":

terraform workspace new netflix      # Cria o espaço de trabalho para Netflix

terraform workspace select netflix   # Seleciona o espaço de trabalho para Netflix

Depois, defina as variáveis específicas para o cliente escolhendo o arquivo .tfvars correspondente:

terraform apply -var-file=netflix.tfvars

### Passo 3: Aplicar a Infraestrutura

Execute o comando para aplicar a infraestrutura e implantar o cluster Kubernetes, o Odoo, e outros recursos necessários:

terraform apply

Isso criará os recursos do Kubernetes, incluindo o cluster, namespaces, deployments e o Ingress para o Odoo. Além disso, o PostgreSQL será configurado conforme as necessidades do Odoo.

### Passo 4: Verificar o Acesso HTTPS

Após a implantação, o acesso ao Odoo será gerenciado via Ingress e configurado para usar HTTPS. Acesse o aplicativo pela URL fornecida.

### Passo 5: Destruir a Infraestrutura

Caso precise destruir os recursos criados, utilize o comando:

terraform destroy

Isso removerá todos os recursos provisionados, incluindo o cluster Kubernetes e os deployments do Odoo.

### Detalhes dos Arquivos
- cluster.tf

Define a criação do cluster Kubernetes, incluindo os provedores e os recursos necessários para a configuração do cluster.

- odoo.tf:

Configura a implantação do Odoo no Kubernetes, incluindo o deployment, service e persistência de dados.

- postgress.tf

Configura o banco de dados PostgreSQL necessário para o Odoo, incluindo os serviços e volumes persistentes.

-ingress.yaml

Contém a configuração do Ingress Controller no Kubernetes para gerenciar o tráfego HTTPS. Inclui a definição de regras de roteamento e certificados SSL/TLS.

-secrets.yaml

Define os Secrets no Kubernetes, como senhas e outras informações sensíveis necessárias para o Odoo e o PostgreSQL.

###Contribuições

Contribuições são bem-vindas! Para contribuir:

Fork o repositório.
Crie uma branch com suas modificações (git checkout -b feature/novos-requisitos).
Faça commit das suas mudanças (git commit -am 'Adiciona novas configurações').
Push para a branch (git push origin feature/novos-requisitos).
Abra um Pull Request.
Certifique-se de que o código esteja bem documentado e que os testes sejam executados.


##Licença
Este projeto está licenciado sob a MIT License.


