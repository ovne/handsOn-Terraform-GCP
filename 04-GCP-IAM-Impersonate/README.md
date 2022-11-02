# Provisionando recursos GCP via representação de conta da serviço (Impersonation) no Terraform

<b>
    <h2>
        Requisitos
</b></h2>

<p align="justify">
    <ul>
    <li>Instalação local ou in cloud do Terraform by HashiCorp.</li>
    <li>GCP user account ou service account com papéis IAM necessários para criação/edição de recursos cloud.</li>
    <li>GCP user account ou service account com papél IAM roles/iam.serviceAccountTokenCreator.</li>
    </ul>
</p>

<b>
    <h2>
        Contexto e problema
</b></h2>

<p align="justify">&nbsp &nbsp É comum ter que utilizar chaves de autenticação para conectar nossa aplicação com uma API de qualquer finalidade. Em um primeiro contato com o Terraform não é diferente, e para provisionar recursos de infra na núvem via código tf, o caminho mais curto é obter e armazenar essas chaves que serão utilizadas em algum ponto do código.
<br>&nbsp &nbsp Porém, o problema direto dessa prática é que ela eleva o risco de segurança em todo desenvolvimento/manutenção da infra, uma vez que, o vazamento da chave implica o vazamento de acessos/concessões restritos, o que pode ser bastante problemático.</p>

<b>
    <h2>
        Solução
</b></h2>

<p align="justify">&nbsp &nbsp Visando esse problema, em particular no contexto de utilizar o Terraform para operar recursos do Google Cloud Plataform, que a Google desenvolve e disponibiliza um processo alternativo como solução: a representação de contas de serviço por um usuário ou mesmo por outra conta de serviço. Ná prática, trata-se de utilizar as políticas de acesso e concessão do Identity Access Management (IAM) do google cloud para trabalhar com duas contas especiais:
    <ul>
        <li>Conta de ALTO privilégio: com todas as concessões (papéis do IAM) necessárias para provisionar os recursos da infra (preferivelmente uma conta de serviço).</li>
        <li>Conta de BAIXO privilégio: permissões minimas de edição e OBRIGATÓRIAMENTE o papél criador de token da conta de serviço (roles/iam.serviceAccountTokenCreator)</li>
    </ul>
</p>
<p align="justify">&nbsp &nbspComo já se pode esperar, a conta de baixo privilégio (preferêncialmente) tem o único papel de criar o token temporário de acesso à conta de alto privilégio.<br>
&nbsp &nbspO Terraform por sua vez, vai apenas validar os papéis de cada conta, bem como o token temporário para então seguir com o deploy dos recursos. É por essa razão que as contas devem ser previamente criadas e/ou configuradas no IAM do respectivo projeto GCP a que a infra atente, este é o passo mais importante e como podemos ver não envolve o código tf.
</p>

<b>
    <h2>
        Detalhes técnicos
</b></h2>

<p align="justify">Escrever uma breve descrição</p>

<b>
    <h2>
        referências
</b></h2>

<p align="justify">
    <ul>
        <li>
            <a>https://cloud.google.com/blog/topics/developers-practitioners/using-google-cloud-service-account-impersonation-your-terraform-code</a></li>
        <li>
            <a>https://blog.chy.la/posts/using-service-account-impersonation-with-terraform/</a></li>
        <li>
            <a>https://cloud.google.com/iam/docs/service-accounts?hl=pt_br</a></li>
        <li>
            <a>https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference</a></li>
     </ul>
</p>