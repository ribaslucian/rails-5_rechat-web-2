Acronym.seeds

User.create({
    name: 'usuario01',
    type_acronym_id: 200,
  })

User.create({
    name: 'usuario02',
    type_acronym_id: 201,
  })


Interaction.create!({
    name: 'Bot Bom',
    messages_attributes: [
      {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Olá!',
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Tudo bem ?',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Assim, estou assim também.',
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 51,
        content: 'https://ogimg.infoglobo.com.br/in/24406017-58e-d36/FT1086A/652/x87828951_Sorocaba-SP-11-04-2020Hidroxicloroquina-e-COVID-19Foto-conceitual-do-medicamentoHidr.jpg.pagespeed.ic.WPMG6WucNM.jpg',
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 50,
        content: 'Você sabia disso ? Com os serviços de saúde colapsando por causa do grande número de casos de Covid-19, uma medicação eficiente para tratar a doença seria um caminho não só para desafogar os leitos de UTI como também para salvar vidas. É por isso que estudos com medicamentos que já existem estão sendo realizados por todo mundo.',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Interessante né. Se souber de algo mais lhe conto.',
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Até logo!',
      },  
    ]
  })


Interaction.create!({
    name: 'Bot Neutro',
    messages_attributes: [
      {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Mensagem 01',
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Mensagem 02',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 50,
        content: 'Mensagem 03 [alvo]',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 50,
        content: 'Mensagem 04 [alvo]',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Mensagem 05',
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Mensagem 06',
      },  {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Mensagem 07',
      },  
    ]
  })


Interaction.create!({
    name: 'Bot Ruim',
    messages_attributes: [
      {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Eu não gosto de você',
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 50,
        content: 'E estou com muita raiva',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 51,
        content: 'https://s2.glbimg.com/kMBhrrNz-6Fy2jGdkDEsKWzZhXY=/512x320/smart/e.glbimg.com/og/ed/f/original/2016/01/20/diarioweb_filme_divertidamente_raiva.jpg',
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 50,
        content: 'Estou muito triste.',
      }, {
        type_acronym_id: 5,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Não quero mais conversar.',
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Adeus',
      },  
    ]
  })