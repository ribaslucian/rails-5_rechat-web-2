self.delete_all
    
Acronym.create!([

  # 1..
  {id: 1, name: 'Mensagem de Controle', data_refer: 'messages.type'},
  {id: 2, name: 'Mensagem de Alvo', data_refer: 'messages.type'},
  {id: 3, name: 'Resposta de Controle', data_refer: 'messages.type'},
  {id: 4, name: 'Resposta Alvo', data_refer: 'messages.type'},
  
  # 100... 
  {id: 100, name: 'Pergunta 01', data_refer: 'users.answer'},
  {id: 101, name: 'Pergunta 02', data_refer: 'users.answer'},
  {id: 102, name: 'Pergunta 03', data_refer: 'users.answer'},

])