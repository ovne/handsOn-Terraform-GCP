# Provisionando recursos GCP via representação de conta da serviço (Impersonation) no Terraform

- ## Contexto e problema
<p align="justify">&nbsp &nbsp É comum ter que utilizar chaves de autenticação para conectar nossa aplicação com uma API de qualquer finalidade. Em um primeiro contato com o Terraform não é diferente, e para provisionar recursos de infra na núvem via código tf, o caminho mais curto é obter e armazenar essas chaves que serão utilizadas em algum ponto do código.
<br>&nbsp &nbsp Porém, o problema direto dessa prática é que ela eleva o risco de segurança em todo desenvolvimento/manutenção da infra, uma vez que, o vazamento da chave implica o vazamento de acessos/concessões restritos, o que pode ser bastante problemático.</p>

- ## Solução
<p align="justify">&nbsp &nbsp Visando esse problema, em particular no contexto de utilizar o Terraform para operar recursos do Google Cloud Plataform, que a Google desenvolveu e disponibiliza uma alternativa como solução: a representação de contas de serviço por um usuário ou mesmo por outra conta de serviço.<br> 
&nbsp &nbsp Ná prática, trata-se de utilizar as politicas de acesso e concessão do Identity Access Management (IAM) do google cloud para trabalhar com duas contas especiais:
    <ul>
        <li>Conta de ALTO privilégio: com todas as concessões (papéis do IAM) necessários para provisionar os recursos da infra (preferivelmente uma(s) conta(s) de serviço).</li>
        <li>Conta de BAIXO privilégio: permissões minimas de edição e OBRIGATÓRIAMENTE o pápal criador de token da conta de serviço (roles/iam.serviceAccountTokenCreator)</li>
    </ul>
</p>
<p align="justify">&nbsp &nbspComo já se pode esperar, a conta de baixo privilégio (preferêncialmente) tem único papel de criar o token temporario de acesso à conta de alto privilégio.<br>
&nbsp &nbspO Terraform por sua vez, vai apenas validar os papéis de cada conta, bem como o token temporário para então seguir com o deploy. E é por essa razão que as contas devem ser previamente criadas e/ou configuradas no IAM do respectivo projeto GCP a que a infra atente.
</p>

- ## detalhes técnicos
<p align="justify">Escrever uma breve descrição</p>

- ## Requisitos
<p align="justify">Escrever uma breve descrição</p>

- ## referências
<p align="justify">Escrever uma breve descrição</p>