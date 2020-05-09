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
        interaction_ids: 1,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Tudo bem ?',
        interaction_ids: 2,
      }, {
        type_acronym_id: 5,
        interaction_ids: 3,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Você sabia disso:',
        interaction_ids: 4,
      }, {
        type_acronym_id: 2,
        type_content_acronym_id: 50,
        content: 'Com os serviços de saúde colapsando por causa do grande número de casos de Covid-19, uma medicação eficiente para tratar a doença seria um caminho não só para desafogar os leitos de UTI como também para salvar vidas. É por isso que estudos com medicamentos que já existem estão sendo realizados por todo mundo.',
        interaction_ids: 5,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 51,
        content: 'https://conteudo.imguol.com.br/c/noticias/1e/2020/04/12/foto-conceitual-do-medicamento-hidroxicloroquina-que-esta-sendo-usado-no-combate-a-covid-19-cloroquina-contra-o-coronavirus-1586703804119_v2_450x337.jpg',
        interaction_ids: 6,
      }, {
        type_acronym_id: 5,
        interaction_ids: 7,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Interessante né. Se souber de algo mais lhe conto.',
        interaction_ids: 8,
      }, {
        type_acronym_id: 1,
        type_content_acronym_id: 50,
        content: 'Até logo!',
        interaction_ids: 9,
      },  
    ]
  })