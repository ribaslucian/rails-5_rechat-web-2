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
    name: 'Interacão 01',
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