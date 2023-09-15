create database db_LivrariaM;

use db_LivrariaM;

drop database db_livrariam;

create table tbl_categoria
(	
    id_categoria int primary key auto_increment,
    ds_categoria varchar(100) not null    
);


create table tbl_autor
(	
    id_autor int primary key auto_increment,
    nm_autor varchar(75) not null    
);


create table tbl_livro
(	
    id_livro int primary key auto_increment,
    no_isbn varchar(17) not null,
    id_categoria int not null,
    nm_livro varchar(250) not null,
    id_autor int not null,
    no_pag varchar(4) not null,
    vl_preco decimal(6,2) not null,
    qt_estoque int not null,
    ds_resumo_obra text not null,
    ds_capa varchar(255) not null,
    sg_lancamento enum('S','N') not null,
    constraint fk_cat foreign key(id_categoria) references tbl_categoria(id_categoria),
    constraint fk_autor foreign key(id_autor) references tbl_autor(id_autor)
);

insert into tbl_categoria
values(default,'Ficção Científica'),
(default, 'Suspense/Mistério'),
(default, 'Terror'),
(default, 'Aventura'),
(default, 'Literatura Brasileira'),
(default, 'Fantasia');

insert into tbl_autor
values(default,'Stephen King'),				-- codigo 1
(default, 'George R.R Martin'),				-- codigo 2	
(default, 'Agatha Christie'),				-- codigo 3
(default, 'H.P Lovecraft'),					-- codigo 4
(default, 'H.G Wells'),						-- codigo 5
(default, 'Charlaine Harris'),				-- codigo 6
(default, 'Edgar Allan Poe'),				-- codigo 7
(default, 'Neil Gaiman'),					-- codigo 8
(default, 'C.J Tudor'),						-- codigo 9
(default, 'Bram Stoker'),				    -- codigo 10
(default, 'Machado de Assis'),				-- codigo 11
(default, 'Cecília Meireles'),				-- codigo 12
(default, 'Carlos Drummond de Andrade'),	-- codigo 13
(default, 'Clarice Lispector'),				-- codigo 14
(default, 'Érico Veríssimo'),				-- codigo 15
(default, 'Monteiro Lobato'),				-- codigo 16
(default, 'Holly Black'),			    	-- codigo 17
(default, 'George Orwell');					-- codigo 18

create table tbl_usuario(
	id_usuario int primary key auto_increment,
    nm_usuario varchar(80) not null,
    ds_email varchar(80) not null,
    ds_senha varchar(8) not null,
    ds_status boolean not null,
    ds_log varchar(80) not null,
    ds_cidade varchar(30) not null,
    no_cep char(9) not null
);

insert into tbl_livro
values
(Default,'978-8556511577','6','Conto de Fadas','1','624','59.00','25',

'<p>Romance inédito do mestre do terror e suspense, Stephen King, Conto de fadas é uma história fascinante e assustadora sobre um garoto que descobre um novo mundo, 
onde Bem e Mal estão em guerra.</p>
 <p>Aos dezessete anos de idade, Charlie Reade parece ser um garoto comum: pratica esportes, é um filho atencioso e aluno de desempenho razoável. 
 Suas lembranças, entretanto, não são feitas apenas de momentos felizes. Após perder a mãe em um grave acidente quando tinha apenas dez anos, 
 Charlie precisou aprender a cuidar de si e do pai, que, enlutado com a perda da esposa, buscou refúgio na bebida.
Certo dia, ao pedalar pela rua de casa, Charlie atende um pedido de socorro vindo do quintal de um dos vizinhos: Howard Bowditch. 
O homem recluso e rabugento, que amedrontava as crianças do bairro, cai de uma escada e se machuca gravemente. O chamado por ajuda veio de Radar, a fiel pastor alemão, 
tão idosa quanto seu dono.
Enquanto Bowditch se recupera, Charlie passa a ajudar o vizinho com tarefas domésticas e com o cuidado de Radar, e assim o rapaz faz duas grandes amizades. 
Quando Howard morre, Charlie se depara com uma fita cassete que revela um segredo inimaginável: um portal para outro mundo.</p>', 'conto_de_fadas','N'),
 
 

 (Default,' 978-8556511249','2','Billy Summers','1','472','59.90','40',
'<p>Billy Summers é uma história de guerra, amor, sorte e destino, com um herói complexo buscando sua última chance de redenção. 
Impossível de largar e impossível de esquecer. </p>
 <p>Billy Summers é o homem com a arma; um assassino de aluguel e um dos melhores atiradores do mundo. Mas ele tem um critério: só aceita o serviço se o alvo for 
 realmente uma pessoa ruim.
Agora, Billy quer se aposentar, mas antes precisa realizar um último trabalho. Veterano da guerra no Iraque e um mágico quando se trata de desaparecer depois do crime, 
o hábil assassino tinha tudo planejado. Então, o que poderia dar errado?
Basicamente tudo.
Quando Billy se acomoda em uma cidadezinha do interior, disfarçado como um escritor tentando superar um bloqueio criativo enquanto espera seu alvo ser transferido para 
julgamento, ele não imagina a trama de traições, perseguições e vingança que o aguarda.</p>', 'billy_summers','N'),
 

(Default,'978-8551002933','2','O Homem de Giz','9','272','38.99','23',
'<p>Assassinato e sinais misteriosos em uma trama para fãs de Stranger Things e Stephen King</p>
 <p>Em 1986, Eddie e os amigos passam a maior parte dos dias andando de bicicleta pela pacata vizinhança em busca de aventuras. Os desenhos a giz são seu código secreto: 
 homenzinhos rabiscados no asfalto; mensagens que só eles entendem. Mas um desenho misterioso leva o grupo de crianças até um corpo desmembrado e espalhado em um bosque. 
 Depois disso, nada mais é como antes.
Em 2016, Eddie se esforça para superar o passado, até que um dia ele e os amigos de infância recebem um mesmo aviso: o desenho de um homem de giz enforcado. 
Quando um dos amigos aparece morto, Eddie tem certeza de que precisa descobrir o que de fato aconteceu trinta anos atrás.
Alternando habilidosamente entre presente e passado, O Homem de Giz traz o melhor do suspense: personagens maravilhosamente construídos, mistérios de prender 
o fôlego e reviravoltas que vão impressionar até os leitores mais escaldados.</p>', 'o_homem_de_giz','N'),
 
 
 (Default,'978-8551004753','2','O Que Aconteceu com Annie','9','288','72.82','13',
'<p>“Quando minha irmã tinha oito anos, ela sumiu. Na época, achei que não poderia haver coisa pior. E então ela voltou.“</p>
 <p>Quando Joe Thorne era adolescente, sua irmã mais nova desapareceu. Vinte e cinco anos depois, um e-mail anônimo o leva mais uma vez ao passado: “Eu sei o que aconteceu com sua irmã. Está acontecendo de novo.”

Atolado em dívidas e bem longe do vilarejo onde cresceu, Joe precisa escapar das pessoas perigosas que estão atrás dele, mas também vê a oportunidade de resolver o que arrasta consigo há mais de duas décadas. 
Retornar a Arnhill parece a única opção.
Mas voltar também significa abrir velhas feridas e reencontrar pessoas e lugares que ele nunca mais pensou que veria. Afinal, alguns segredos são grandes demais ― e Joe não 
faz ideia de onde está se metendo.
Neste suspense de ares sobrenaturais, o leitor é carregado por reviravoltas sombrias que o deixam na expectativa até o fim. O que aconteceu com Annie é uma viagem ao lugar 
mais escuro de um passado que precisa ser esquecido.</p>','o_aconteceu_annie','N');
 
 -- segunda parte --
 insert into tbl_livro
values 
(Default,'978-8551006504','2','As Outras Pessoas','9','304','49.90','35',
'<p>Gabe Forman está preso em um engarrafamento, atrasado para o jantar em casa com a família, quando o rosto de sua filha, Izzy, de cinco anos, 
aparece no vidro traseiro do carro à frente e balbucia “papai”. Três anos depois, Gabe passa seus dias e noites rodando pela estrada em que viu Izzy pela última vez.
Garçonete em um dos muitos postos de gasolina por onde Gabe passa à procura da filha, Katie é solidária ao “homem magro”, apelido que deu a ele. 
Ela sabe o que é perder alguém. Há nove anos, sua família ficou destruída depois que seu pai foi assassinado.
Fran também vive na estrada com Alice. Mas elas não estão à procura de ninguém; estão fugindo, porque Fran sabe que, se um dia as encontrarem, elas serão mortas.
Todas essas histórias têm algo em comum: pessoas que passaram por acontecimentos terríveis que não conseguem deixar para trás. 
Elas não vão encontrar a paz no perdão ou no esquecimento. Elas só vão encontrar a paz se fizerem justiça.
Da mesma autora do best-seller O Homem de Giz, um thriller emocionante, cuja narrativa, repleta de ameaça e ação, captura o leitor desde o 
início e explora com habilidade a natureza da justiça e a força do luto.</p>','as_outras_pessoas','S'),
 
 
 (Default,'978-8595086784','2','Assassinato no Expresso do Oriente','3','240','37.33','140',
'<p>Neste clássico da literatura, e um dos mistérios mais famosos da Rainha do Crime, Hercule Poirot precisa descobrir quem está por trás do assassinato no Expresso do Oriente
 – e o culpado está entre os passageiros do trem.</p>
 <p>Em meio a uma viagem, Hercule Poirot é surpreendido por um telegrama solicitando seu retorno a Londres. Então, o famoso detetive belga embarca no Expresso do Oriente, 
 que está inesperadamente cheio para aquela época do ano. Pouco tempo após a meia-noite, o excesso de neve nos trilhos obriga o trem a parar. Na manhã seguinte, 
 o corpo de um dos passageiros é encontrado, golpeado por múltiplas facadas. Isolados, e com um assassino entre eles, a única solução é que Poirot inicie uma investigação 
 para descobrir quem é o criminoso ― antes que ele faça mais uma vítima.
O livro é parte das novas edições de luxo de Agatha Christie da HarperCollins, com novas traduções, capa dura e detalhes sobre a obra ao final da história. 
Você vai se surpreender a cada plot twist.</p>','expresso_do_oriente','N'),
 
(Default,'978-8595085923','2','Os Crimes ABC','3','240','39.90','50',
'<p>Em um dos mais famosos mistérios da Rainha do Crime, o detetive Poirot será o único capaz de pôr um fim à sucessão de crimes macabros de um assassino enigmático... </p>
 <p>Hercule Poirot recebe uma carta inusitada: nela está anunciada a data e o local de um crime. Assinada apenas como “ABC”, o remetente clama ser tão engenhoso que 
 nem mesmo o brilhante detetive seria capaz de pegá-lo. Após o crime de fato ter sido cometido, Poirot consegue uma única pista ― a de que o assassino escolhe suas vítimas 
 em ordem alfabética ― e precisa correr contra o tempo antes que o terrível homicida continue a avançar nas letras… 
O livro é parte das novas edições de luxo de Agatha Christie, com capa dura, comentários sobre a obra, novas traduções e muitos plot twists. </p>','crimes_abc','N'),
 
 
 (Default,'978-8556510464','3','O Iluminado','1','520','73.60','217',
'<p>“O lugar perfeito para recomeçar”, é o que pensa Jack Torrance ao ser contratado como zelador para o inverno. Hora de deixar para trás o alcoolismo, os acessos de fúria, 
os repetidos fracassos. Isolado pela neve com a esposa e o filho, tudo o que Jack deseja é um pouco de paz para se dedicar à escrita. Mas, conforme o inverno se aprofunda, 
o local paradisíaco começa a parecer cada vez mais remoto... e mais sinistro. Forças malignas habitam o Overlook, e tentam se apoderar de Danny Torrance, um garotinho com 
grandes poderes sobrenaturais. Possuir o menino, no entanto, se mostra mais difícil do que esperado. Então os espíritos resolvem se aproveitar das fraquezas do pai... 
Um dos livros mais assustadores de todos os tempos, O iluminado é um clássico de Stephen King. Edição especial com tradução revisada e prólogo e epílogo inéditos.
</p>','o_iluminado','S');
 
 -- terceira parte -- 
 
 insert into tbl_livro
values 
 (Default,'978-8581052434','3','Doutor Sono','1','480','30.90','217',
'<p>Mais de trinta anos depois, Stephen King revela a seus leitores o que aconteceu a Danny Torrance, o garoto no centro de O iluminado, depois de sua terrível 
experiência no Overlook Hotel. Em Doutor Sono, King dá continuidade a essa história, contando a vida de Dan, agora um homem de meia-idade, e Abra Stone, 
uma menina de doze anos com um grande poder. Assombrado pelos habitantes do Overlook Hotel, onde passou um ano terrível da infância, Dan ficou à deriva por décadas, 
desesperado para se livrar do legado de alcoolismo e violência do pai. Por fim, ele se instala em uma cidade de New Hampshire, onde encontra abrigo em uma comunidade do 
Alcoólicos Anônimos que o apoia e um emprego em uma casa de repouso, onde seu poder remanescente da iluminação fornece o conforto final para aqueles que estão morrendo. 
Ajudado por um gato que prevê a morte dos pacientes, ele se torna o Doutor Sono. Então Dan conhece Abra Stone, uma menina com um dom espetacular, a iluminação mais forte que 
já se viu. Ela desperta os demônios de seu passado e Dan se vê envolvido em uma batalha pela alma e sobrevivência dela. Uma guerra épica entre o bem e o mal, uma sangrenta e 
gloriosa história que vai emocionar os milhões de fãs de O Iluminado e satisfazer os leitores deste novo clássico da obra de King.</p>','doctor_sleep','S'),

 (Default,'978-8556512017','2','Holly','1','220','79.90','66',
'<p>Penny Dahl está desesperada para encontrar a filha, Bonnie, que sumiu sem deixar vestígios. Em busca de ajuda profissional, ela liga para a agência Achados e Perdidos, 
sob o comando de Holly Gibney. A detetive reluta em aceitar o caso, porque deveria estar de licença, mas algo na voz de Penny faz com que Holly não consiga ignorar o pedido.
A poucos quarteirões de onde Bonnie foi vista pela última vez, moram Rodney e Emily Harris. Um casal de acadêmicos octogenários, dedicados um ao outro, eles simbolizam a 
banalidade da classe média suburbana. No entanto, no porão de sua casa bem cuidada e repleta de livros, os dois escondem um segredo terrível, que pode estar relacionado ao 
desaparecimento de Bonnie.
Descobrir a verdade se torna uma tarefa quase impossível, e Holly dependerá de seus talentos extraordinários para desmascarar os professores ― antes que eles ataquem novamente.
</p>',
 'holly','S'),
 
 (Default,'978-8595086807','2','Um Corpo na Biblioteca','3','192','32.00','10',
'<p>Às 7 da manhã, os Bantry acordam e encontram o corpo de uma jovem em sua biblioteca, sem fazer ideia de como chegou ali. Chocada com os acontecimentos, 
a Mrs. Bantry chama sua amiga, Miss Marple, a detetive amadora mais famosa da pequena St. Mary Mead, para descobrir a identidade da garota e do assassino. 
Quando outro corpo surge em uma pedreira, cabe a Miss Marple desvendar a conexão entre eles e solucionar o caso.</p>','corpo_biblioteca','S');

-- quarta parte --
 
insert into tbl_livro
values 
 (Default,'978-8556510761','6','Fogo & Sangue - Vol.1','2','664','57.73','303',
'<p>A arrebatadora história dos Targaryen ganha vida neste novo livro de George R.R. Martin, autor de As Crônicas de Gelo e Fogo, 
série que inspirou a adaptação de sucesso da HBO, Game of Thrones.</p>
 <p>Séculos antes dos eventos de A guerra dos tronos, a Casa Targaryen – única família de senhores dos dragões a sobreviver à Destruição de Valíria – tomou residência em 
 Pedra do Dragão. A história de Fogo e sangue começa com o lendário Aegon, o Conquistador, criador do Trono de Ferro, e segue narrando as gerações de Targaryen que lutaram 
 para manter o assento, até a guerra civil que quase destruiu sua dinastia.
O que realmente aconteceu durante a Dança dos Dragões? Por que era tão perigoso visitar Valíria depois da Destruição? Qual é a origem dos três ovos de dragão que chegaram 
a Daenerys? Essas são algumas das questões respondidas neste livro essencial, relatadas por um sábio meistre da Cidadela.
Ricamente ilustrado com mais de oitenta imagens em preto e branco assinadas pelo artista Dough Wheatley, Fogo e sangue dará aos leitores uma nova e completa visão da 
fascinante história de Westeros – um livro imperdível para os fãs do autor.</p>','fogo_sangue','S'),
 
 (Default,'978-8556510785','6','A Guerra dos Tronos: As Crônicas de Gelo e Fogo, volume 1','2','600','52.00','40',
'<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.
O verão pode durar décadas. O inverno, toda uma vida. E a guerra dos tronos começou. Como Guardião do Norte, lorde Eddard Stark não fica feliz quando o rei Robert o 
proclama a nova Mão do Rei. Sua honra o obriga a aceitar o cargo e deixar seu posto em Winterfell para rumar para a corte, onde os homens fazem o que lhes convém, 
não o que devem... e onde um inimigo morto é algo a ser admirado.</p>
<p>Longe de casa e com a família dividida, Eddard se vê cada vez mais enredado nas intrigas mortais de Porto Real, sem saber que perigos ainda maiores espreitam a distância.
Nas florestas ao norte de Winterfell, forças sobrenaturais se espalham por trás da Muralha que protege a região. E, nas Cidades Livres, o jovem Rei Dragão exilado na 
Rebelião de Robert planeja sua vingança e deseja recuperar sua herança de família: o Trono de Ferro de Westeros.</p>','game_of_thrones1','N'),

 (Default,'978-8556510792','6','A Fúria dos Reis: As Crônicas de Gelo e Fogo, volume 2','2','648','67.71','30',
'<p>Nesta emocionante sequência de A guerra dos tronos, George R. R. Martin cria uma obra incomparável. A fúria dos reis nos transporta para um mundo de festas e vinganças, 
feitiçaria e disputas, diferente de tudo que já foi feito.</p>
<p>Um cometa da cor de fogo e sangue corta os céus. E, da antiga cidadela de Pedra do Dragão às costas áridas de Winterfell, reina o caos.
Em A fúria dos reis, seis facções disputam o controle de uma terra dividida e o direito de ocupar o Trono de Ferro de Westeros – e estão dispostos a encarar tempestades, 
levantes e guerras para isso.
Nesta história, irmão trama contra irmão e os mortos se levantam para caminhar pela noite. Aqui, uma princesa se disfarça de menino órfão, um cavaleiro se prepara para 
encarar uma pérfida feiticeira e bárbaros descem das Montanhas da Lua para saquear os campos.
Em um contexto de incesto e fratricídio, alquimia e assassinato, a vitória será dos homens e mulheres que possuírem o mais frio aço... e o mais frio coração. Pois, 
quando se desperta a fúria dos reis, a terra inteira treme.</p>','game_of_thrones2','N'),

 (Default,'978-8556510808','6','A tormenta de espadas: As Crônicas de Gelo e Fogo, volume 3','2','832','66.00','40',
'<p>Este é o terceiro volume da série As Crônicas de Gelo e Fogo, que inclui A guerra dos tronos e A fúria dos reis. Já considerada um clássico, a obra emocionante de 
George R. R. Martin é um dos maiores feitos da literatura fantástica de todos os tempos.</p>
<p>O futuro de Westeros está em jogo, e ninguém descansará até que os Sete Reinos tenham explodido em uma verdadeira tormenta de espadas.
Dos cinco pretendentes ao trono, um está morto e outro caiu em desgraça, e ainda assim a guerra continua em toda sua fúria, enquanto alianças são feitas e desfeitas. 
Joffrey, da Casa Lannister, ocupa o Trono de Ferro, como o instável governante dos Sete Reinos, ao passo que seu rival mais amargo, lorde Stannis, jaz derrotado e 
enfeitiçado pelas promessas da Mulher Vermelha.
O jovem Robb, da Casa Stark, ainda comanda o Norte, contudo, e planeja sua batalha contra os Lannister, mesmo que sua irmã seja refém deles em Porto Real. 
Enquanto isso, Daenerys Targaryen atravessa um continente deixando um rastro de sangue a caminho de Westeros, levando consigo 
os três únicos dragões existentes em todo o mundo.
Enquanto forças opostas avançam para uma gigantesca batalha final, um exército de selvagens chega dos confins da civilização. Em seu rastro vem uma horda de terríveis 
criaturas místicas – os Outros: um batalhão de mortos-vivos cujos corpos são imparáveis.</p>','game_of_thrones3','N');

select count(*) from tbl_livro;
select * from tbl_livro;
select * from tbl_autor;
select * from tbl_categoria;

create view vw_livro 
as select tbl_livro.id_livro, tbl_livro.no_isbn,
	   tbl_categoria.ds_categoria, tbl_livro.nm_livro,
       tbl_autor.nm_autor, tbl_livro.no_pag,
       tbl_livro.vl_preco, tbl_livro.qt_estoque,
       tbl_livro.ds_resumo_obra,
       tbl_livro.ds_capa, tbl_livro.sg_lancamento
from tbl_livro inner join tbl_autor 
on tbl_livro.id_autor = tbl_autor.id_autor
inner join tbl_categoria 
on tbl_livro.id_categoria = tbl_categoria.id_categoria;

select * from vw_livro;

select nm_livro, vl_preco, ds_capa from vw_livro;
select nm_livro, vl_preco, ds_capa from vw_livro where sg_lancamento = 'S';

insert into tbl_usuario values(default, 'Caetano','caetano@gmail.com', 'cae78953',1, 'rua dos pinheiros, 58', 'Osasco', '05100-050');
insert into tbl_usuario values(default, 'Yasmin Oliveira','yasoli@gmail.com', 'yas56325',0, 'rua abraham lincoln, 68', 'Jundiaí', '05360-080');
insert into tbl_usuario values(default, 'Ricardo Marinara','ricnara@outlook.com', 'rm25879',0, 'rua molinari, 288A', 'São Paulo', '05260-000');

select * from tbl_usuario;

CREATE USER 'livraria'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
 GRANT ALL PRIVILEGES ON db_LivrariaM.* TO 'livraria'@'localhost' WITH GRANT OPTION;

