### * Atalhos WebMedia 2020
- [você está aqui] Rechat: Código-Fonte do Painel Web
- [Vídeo Demonstrativo](*)
- [Artigo em PDF (ACM/Webmedia)](https://drive.google.com/file/d/162U6fJmwhcIZFwMeF_JTvnyl7YhPSshK/view?usp=sharing)
- Configurações Temporárias
    - [Link do Painel Web configurado](http://ec2-18-228-83-110.sa-east-1.compute.amazonaws.com)
    - [Rechat: APK do Aplicativo Simulador](*)
---

# Rechat (Painel Web)

##### Aplicativo simulador disponível em [Rechat (APK)](https://breakdance.github.io/breakdance/)

--  
Rechat é uma ferramenta de coleta e processamento de dados para pesquisadores
interessados no estudo do comportamento de usuários em sistemas de bate-papo
móvel, principalmente sobre aqueles expostos à conteúdos negativos. 

##### Funcionamento
Além do diagrama que apresenta o funcionamento e recursos, criamos um  [vídeo que explica na prática](https://breakdance.github.io/breakdance/).

![Arquitetura de Funcionamento](https://raw.githubusercontent.com/ribaslucian/rails-chat-channel/master/public/rechat_arquitetura.jpg)


### Requisitos
* Servidor Web: Ruby (versão 2), Rails (versão 5), Python (versão 3)
* *Smartphone* Android 4.0+

### Instalação
**Painel Web:**
1. Configure um servidor com os requisitos descritos.
2. Através de um terminal, faça clone do painel web (esse repositório) e acesse seu diretório:

```sh
$ git clone https://github.com/ribaslucian/rails-chat-channel
$ cd rails-chat-channel
```

3. Prepare o ambiente lógico do painel web gerando seu banco de dados e inserindo dados iniciais:
```sh
$ rails db:migrate db:seed
```

4. Inicie o servidor vinculando ao IP do host local a porta 3000 (você pode usar a porta que desejar):
```sh
$ rails s -b 0.0.0.0 -p 3000
```

5. Pelo navegador, teste o funcionamento acessando `localhost:3000` — a página de acesso do Rechat deve ser exibida.


**Aplicativo:**
1. Baixe a APK do aplicativo nesse endereço e instale em um celular.
Nota 1: Deve estar configurada a permissão para instalar de fontes desconhecidas.
Nota 2: O aplicativo deve estar na mesma rede que o painel.

2. Abra o aplicativo e faça a sincronização com o painel, informando seu endereço IP e a porta no menu "sincronizar com painel web": `IP_DO_HOST:3000`
3. Se aplicativo retornar uma mensagem verde e redirecionar para tela de acesso, tudo está configurado.

### Utilização
[Vídeo Demonstrativo](https://breakdance.github.io/breakdance/)

[Artigo em PDF (ACM/Webmedia)](https://breakdance.github.io/breakdance/)

---
**Licença e Apoios**

<sup> [*Creative Commons* Atribuição-NãoComercial-SemDerivações Internacional 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/legalcode}) 
Pesquisa intermediada pela Universidade Tecnologica Federal do Paraná (UTFPR), através do Programa de Pós-Graduação em Computação Aplicada (PPGCA). Apoiado parcialmente pelo projeto GoodWeb (processo \#2018/23011-1 da FAPESP), CAPES e empresa Emissora e Gerenciadora de Cartões Brasil LTDA.
</sup>
