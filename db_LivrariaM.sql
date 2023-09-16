-- criando o banco de dados --
create database db_LivrariaM;
-- utilizando o banco de dados --
use db_LivrariaM;

drop database db_livrariam;
-- criando a tabela categoria --
create table tbl_categoria
(	
    id_categoria int primary key auto_increment,
    ds_categoria varchar(100) not null    
);
-- criando a tabela autor --
create table tbl_autor
(	
    id_autor int primary key auto_increment,
    nm_autor varchar(75) not null    
);
-- criando a tabela livro --
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
-- criando a tabela usuario --
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

select count(*) from tbl_livro;

-- criando a procedure para inserir as categorias --
drop procedure if exists sp_InsCategoria;
delimiter !!
create procedure sp_InsCategoria(
	in pDs_categoria varchar(100)
)
begin
insert into tbl_categoria values (default, pDs_categoria);
end !!
delimiter ;
-- chamando a procedure para inserir dados na tabela categoria --
call sp_InsCategoria('Ficção Científica');
call sp_InsCategoria('Suspense/Mistério');
call sp_InsCategoria('Terror');
call sp_InsCategoria('Aventura');
call sp_InsCategoria('Literatura Brasileira');
call sp_InsCategoria('Fantasia');
call sp_InsCategoria('Histórias em Quadrinhos');

-- criando a procedure para 'selecionar' a tabela categoria --
drop procedure if exists sp_SelectCategoria;
delimiter !!
create procedure sp_SelectCategoria()
begin
select * from tbl_categoria;
end !!
delimiter ;
-- chamando a tabela categoria --
call sp_SelectCategoria;

-- criando a procedure para inserir dados do autor na tabela autor --
drop procedure if exists sp_InsAutor;
delimiter !!
create procedure sp_InsAutor(
	in pNm_autor varchar(75)
)
begin
	insert into tbl_autor values (default, pNm_autor);
end !!
delimiter ;
-- chamando a procedure para inserir dados na tabela autor --
call sp_InsAutor('Stephen King');					-- codigo 1
call sp_InsAutor('George R.R Martin');				-- codigo 2	
call sp_InsAutor('Agatha Christie');				-- codigo 3
call sp_InsAutor('H.P Lovecraft');					-- codigo 4
call sp_InsAutor('H.G Wells');						-- codigo 5
call sp_InsAutor('Charlaine Harris');				-- codigo 6
call sp_InsAutor('Edgar Allan Poe');				-- codigo 7
call sp_InsAutor('Neil Gaiman');					-- codigo 8
call sp_InsAutor('C.J Tudor');						-- codigo 9
call sp_InsAutor('Bram Stoker');				    -- codigo 10
call sp_InsAutor('Machado de Assis');				-- codigo 11
call sp_InsAutor('Cecília Meireles');				-- codigo 12
call sp_InsAutor('Carlos Drummond de Andrade');		-- codigo 13
call sp_InsAutor('Clarice Lispector');				-- codigo 14
call sp_InsAutor('Érico Veríssimo');				-- codigo 15
call sp_InsAutor('Monteiro Lobato');				-- codigo 16
call sp_InsAutor('Holly Black');			    	-- codigo 17
call sp_InsAutor('George Orwell');					-- codigo 18
call sp_InsAutor('Mauricio de Souza');				-- codigo 19

-- criando a procedure para 'selecionar' a tabela autor --
drop procedure if exists sp_SelectAutor;
delimiter !!
create procedure sp_SelectAutor()
begin
select * from tbl_autor;
end !!
delimiter ;
-- chamando a tabela autor --
call sp_SelectAutor;

-- criando a procedure para inserir dados na tabela usuario --
drop procedure if exists sp_InsUser;
delimiter !!
create procedure sp_InsUser(
	in pNm_usuario varchar(80),
    in pDs_email varchar(80),
    in pDs_senha varchar(8),
    in pDs_status boolean,
    in pDs_log varchar(80),
    in pDs_cidade varchar(30),
    in pNo_cep char(9)
)
begin
 insert into tbl_usuario values(default, pNm_usuario, pDs_email, pDs_senha, pDs_status, pDs_log, pDs_cidade, pNo_cep);
end !!
delimiter ;
-- chamando a procedure para inserir dados na tabela usuario --
call sp_InsUser('Caetano','caetano@gmail.com', 'cae78953',1, 'rua dos pinheiros, 58', 'Osasco', '05100-050');
call sp_InsUser('Yasmin Oliveira','yasoli@gmail.com', 'yas56325',0, 'rua abraham lincoln, 68', 'Jundiaí', '05360-080');
call sp_InsUser('Ricardo Marinara','ricnara@outlook.com', 'rm25879',0, 'rua molinari, 288A', 'São Paulo', '05260-000');
call sp_InsUser('Andre Mauricio','andremauri@hotmail.com', 'am234@am',0, 'avenida 1, 455', 'Osasco', '05310-010');

-- criando a procedure para 'selecionar' a tabela usuario --
drop procedure if exists sp_SelectUser;
delimiter !!
create procedure sp_SelectUser()
begin
select * from tbl_usuario;
end !!
delimiter ;
-- chamando a tabela usuario --
call sp_SelectUser;

-- criando a procedure para inserir dados na tabela livro -- 
drop procedure if exists sp_InsLivro;
delimiter !!
create procedure sp_InsLivro(
	in pNo_isbn varchar(17),
    in pId_categoria int,
    in pNm_livro varchar(250),
    in pId_autor int,
    in pNo_pag varchar(4),
    in pVl_preco decimal(6,2),
    in pQt_estoque int,
    in pDs_resumo_obra text,
    in pDs_capa varchar(255),
    in pSg_lanc enum('S','N')
)
begin
 insert into tbl_livro values (default, pNo_isbn, pId_categoria, pNm_livro, pId_autor,
 pNo_pag, pVl_preco, pQt_estoque, pDs_resumo_obra, pDs_capa, pSg_lanc);
end !!
delimiter ;
-- chamando a procedure para inserir dados na tabela livro --
call sp_InsLivro(' 978-8556511249','2','Billy Summers','1','472','59.90','40',
'<p>Billy Summers é uma história de guerra, amor, sorte e destino, com um herói complexo buscando sua última chance de redenção. 
Impossível de largar e impossível de esquecer. </p>
<p>Billy Summers é o homem com a arma; um assassino de aluguel e um dos melhores atiradores do mundo. Mas ele tem um critério: só aceita o serviço se o alvo for 
realmente uma pessoa ruim.
Agora, Billy quer se aposentar, mas antes precisa realizar um último trabalho. Veterano da guerra no Iraque e um mágico quando se trata de desaparecer depois do crime, 
o hábil assassino tinha tudo planejado. Então, o que poderia dar errado? Basicamente tudo. Quando Billy se acomoda em uma cidadezinha do interior, 
disfarçado como um escritor tentando superar um bloqueio criativo enquanto espera seu alvo ser transferido para julgamento, ele não imagina a trama de traições, 
perseguições e vingança que o aguarda.</p>', 'billy_summers','N');

call sp_InsLivro('978-8551002933','2','O Homem de Giz','9','272','38.99','23',
'<p>Assassinato e sinais misteriosos em uma trama para fãs de Stranger Things e Stephen King</p>
 <p>Em 1986, Eddie e os amigos passam a maior parte dos dias andando de bicicleta pela pacata vizinhança em busca de aventuras. Os desenhos a giz são seu código secreto: 
 homenzinhos rabiscados no asfalto; mensagens que só eles entendem. Mas um desenho misterioso leva o grupo de crianças até um corpo desmembrado e espalhado em um bosque. 
 Depois disso, nada mais é como antes.
Em 2016, Eddie se esforça para superar o passado, até que um dia ele e os amigos de infância recebem um mesmo aviso: o desenho de um homem de giz enforcado. 
Quando um dos amigos aparece morto, Eddie tem certeza de que precisa descobrir o que de fato aconteceu trinta anos atrás.
Alternando habilidosamente entre presente e passado, O Homem de Giz traz o melhor do suspense: personagens maravilhosamente construídos, mistérios de prender 
o fôlego e reviravoltas que vão impressionar até os leitores mais escaldados.</p>', 'o_homem_de_giz','N');

call sp_InsLivro('978-8551004753','2','O Que Aconteceu com Annie','9','288','72.82','13',
'<p>“Quando minha irmã tinha oito anos, ela sumiu. Na época, achei que não poderia haver coisa pior. E então ela voltou.“</p>
 <p>Quando Joe Thorne era adolescente, sua irmã mais nova desapareceu. Vinte e cinco anos depois, um e-mail anônimo o leva mais uma vez ao passado: “Eu sei o que aconteceu com sua irmã. Está acontecendo de novo.”

Atolado em dívidas e bem longe do vilarejo onde cresceu, Joe precisa escapar das pessoas perigosas que estão atrás dele, mas também vê a oportunidade de resolver o que arrasta consigo há mais de duas décadas. 
Retornar a Arnhill parece a única opção.
Mas voltar também significa abrir velhas feridas e reencontrar pessoas e lugares que ele nunca mais pensou que veria. Afinal, alguns segredos são grandes demais ― e Joe não 
faz ideia de onde está se metendo.
Neste suspense de ares sobrenaturais, o leitor é carregado por reviravoltas sombrias que o deixam na expectativa até o fim. O que aconteceu com Annie é uma viagem ao lugar 
mais escuro de um passado que precisa ser esquecido.</p>','o_aconteceu_annie','N');

call sp_InsLivro('978-8551006504','2','As Outras Pessoas','9','304','49.90','35',
'<p>Gabe Forman está preso em um engarrafamento, atrasado para o jantar em casa com a família, quando o rosto de sua filha, Izzy, de cinco anos, 
aparece no vidro traseiro do carro à frente e balbucia “papai”. Três anos depois, Gabe passa seus dias e noites rodando pela estrada em que viu Izzy pela última vez.
Garçonete em um dos muitos postos de gasolina por onde Gabe passa à procura da filha, Katie é solidária ao “homem magro”, apelido que deu a ele. 
Ela sabe o que é perder alguém. Há nove anos, sua família ficou destruída depois que seu pai foi assassinado.
Fran também vive na estrada com Alice. Mas elas não estão à procura de ninguém; estão fugindo, porque Fran sabe que, se um dia as encontrarem, elas serão mortas.
Todas essas histórias têm algo em comum: pessoas que passaram por acontecimentos terríveis que não conseguem deixar para trás. 
Elas não vão encontrar a paz no perdão ou no esquecimento. Elas só vão encontrar a paz se fizerem justiça.
Da mesma autora do best-seller O Homem de Giz, um thriller emocionante, cuja narrativa, repleta de ameaça e ação, captura o leitor desde o 
início e explora com habilidade a natureza da justiça e a força do luto.</p>','as_outras_pessoas','S');

call sp_InsLivro('978-8595086784','2','Assassinato no Expresso do Oriente','3','240','37.33','140',
'<p>Neste clássico da literatura, e um dos mistérios mais famosos da Rainha do Crime, Hercule Poirot precisa descobrir quem está por trás do assassinato no Expresso do Oriente
– e o culpado está entre os passageiros do trem.</p>
<p>Em meio a uma viagem, Hercule Poirot é surpreendido por um telegrama solicitando seu retorno a Londres. Então, o famoso detetive belga embarca no Expresso do Oriente, 
que está inesperadamente cheio para aquela época do ano. Pouco tempo após a meia-noite, o excesso de neve nos trilhos obriga o trem a parar. Na manhã seguinte, 
o corpo de um dos passageiros é encontrado, golpeado por múltiplas facadas. Isolados, e com um assassino entre eles, a única solução é que Poirot inicie uma investigação 
para descobrir quem é o criminoso ― antes que ele faça mais uma vítima.
O livro é parte das novas edições de luxo de Agatha Christie da HarperCollins, com novas traduções, capa dura e detalhes sobre a obra ao final da história. 
Você vai se surpreender a cada plot twist.</p>','expresso_do_oriente','N');

call sp_InsLivro('978-8595085923','2','Os Crimes ABC','3','240','39.90','50',
'<p>Em um dos mais famosos mistérios da Rainha do Crime, o detetive Poirot será o único capaz de pôr um fim à sucessão de crimes macabros de um assassino enigmático... </p>
<p>Hercule Poirot recebe uma carta inusitada: nela está anunciada a data e o local de um crime. Assinada apenas como “ABC”, o remetente clama ser tão engenhoso que 
nem mesmo o brilhante detetive seria capaz de pegá-lo. Após o crime de fato ter sido cometido, Poirot consegue uma única pista ― a de que o assassino escolhe suas vítimas 
em ordem alfabética ― e precisa correr contra o tempo antes que o terrível homicida continue a avançar nas letras… 
O livro é parte das novas edições de luxo de Agatha Christie, com capa dura, comentários sobre a obra, novas traduções e muitos plot twists. </p>','crimes_abc','N');

call sp_InsLivro('978-8556510464','3','O Iluminado','1','520','73.60','217',
'<p>“O lugar perfeito para recomeçar”, é o que pensa Jack Torrance ao ser contratado como zelador para o inverno. Hora de deixar para trás o alcoolismo, os acessos de fúria, 
os repetidos fracassos. Isolado pela neve com a esposa e o filho, tudo o que Jack deseja é um pouco de paz para se dedicar à escrita. Mas, conforme o inverno se aprofunda, 
o local paradisíaco começa a parecer cada vez mais remoto... e mais sinistro. Forças malignas habitam o Overlook, e tentam se apoderar de Danny Torrance, um garotinho com 
grandes poderes sobrenaturais. Possuir o menino, no entanto, se mostra mais difícil do que esperado. Então os espíritos resolvem se aproveitar das fraquezas do pai... 
Um dos livros mais assustadores de todos os tempos, O iluminado é um clássico de Stephen King. Edição especial com tradução revisada e prólogo e epílogo inéditos.
</p>','o_iluminado','S');

call sp_InsLivro('978-8581052434','3','Doutor Sono','1','480','30.90','217',
'<p>Mais de trinta anos depois, Stephen King revela a seus leitores o que aconteceu a Danny Torrance, o garoto no centro de O iluminado, depois de sua terrível 
experiência no Overlook Hotel. Em Doutor Sono, King dá continuidade a essa história, contando a vida de Dan, agora um homem de meia-idade, e Abra Stone, 
uma menina de doze anos com um grande poder. Assombrado pelos habitantes do Overlook Hotel, onde passou um ano terrível da infância, Dan ficou à deriva por décadas, 
desesperado para se livrar do legado de alcoolismo e violência do pai. Por fim, ele se instala em uma cidade de New Hampshire, onde encontra abrigo em uma comunidade do 
Alcoólicos Anônimos que o apoia e um emprego em uma casa de repouso, onde seu poder remanescente da iluminação fornece o conforto final para aqueles que estão morrendo. 
Ajudado por um gato que prevê a morte dos pacientes, ele se torna o Doutor Sono. Então Dan conhece Abra Stone, uma menina com um dom espetacular, a iluminação mais forte que 
já se viu. Ela desperta os demônios de seu passado e Dan se vê envolvido em uma batalha pela alma e sobrevivência dela. Uma guerra épica entre o bem e o mal, uma sangrenta e 
gloriosa história que vai emocionar os milhões de fãs de O Iluminado e satisfazer os leitores deste novo clássico da obra de King.</p>','doctor_sleep','S');

call sp_InsLivro('978-8556512017','2','Holly','1','220','79.90','66',
'<p>Penny Dahl está desesperada para encontrar a filha, Bonnie, que sumiu sem deixar vestígios. Em busca de ajuda profissional, ela liga para a agência Achados e Perdidos, 
sob o comando de Holly Gibney. A detetive reluta em aceitar o caso, porque deveria estar de licença, mas algo na voz de Penny faz com que Holly não consiga ignorar o pedido.
A poucos quarteirões de onde Bonnie foi vista pela última vez, moram Rodney e Emily Harris. Um casal de acadêmicos octogenários, dedicados um ao outro, eles simbolizam a 
banalidade da classe média suburbana. No entanto, no porão de sua casa bem cuidada e repleta de livros, os dois escondem um segredo terrível, que pode estar relacionado ao 
desaparecimento de Bonnie. Descobrir a verdade se torna uma tarefa quase impossível, e Holly dependerá de seus talentos extraordinários para desmascarar os 
professores ― antes que eles ataquem novamente.</p>', 'holly','S');

call sp_InsLivro('978-8595086807','2','Um Corpo na Biblioteca','3','192','32.00','10',
'<p>Às 7 da manhã, os Bantry acordam e encontram o corpo de uma jovem em sua biblioteca, sem fazer ideia de como chegou ali. Chocada com os acontecimentos, 
a Mrs. Bantry chama sua amiga, Miss Marple, a detetive amadora mais famosa da pequena St. Mary Mead, para descobrir a identidade da garota e do assassino. 
Quando outro corpo surge em uma pedreira, cabe a Miss Marple desvendar a conexão entre eles e solucionar o caso.</p>','corpo_biblioteca','S');

call sp_InsLivro('978-8556510761','6','Fogo & Sangue - Vol.1','2','664','57.73','303',
'<p>A arrebatadora história dos Targaryen ganha vida neste novo livro de George R.R. Martin, autor de As Crônicas de Gelo e Fogo, 
série que inspirou a adaptação de sucesso da HBO, Game of Thrones.</p>
 <p>Séculos antes dos eventos de A guerra dos tronos, a Casa Targaryen – única família de senhores dos dragões a sobreviver à Destruição de Valíria – tomou residência em 
 Pedra do Dragão. A história de Fogo e sangue começa com o lendário Aegon, o Conquistador, criador do Trono de Ferro, e segue narrando as gerações de Targaryen que lutaram 
 para manter o assento, até a guerra civil que quase destruiu sua dinastia.
O que realmente aconteceu durante a Dança dos Dragões? Por que era tão perigoso visitar Valíria depois da Destruição? Qual é a origem dos três ovos de dragão que chegaram 
a Daenerys? Essas são algumas das questões respondidas neste livro essencial, relatadas por um sábio meistre da Cidadela.
Ricamente ilustrado com mais de oitenta imagens em preto e branco assinadas pelo artista Dough Wheatley, Fogo e sangue dará aos leitores uma nova e completa visão da 
fascinante história de Westeros – um livro imperdível para os fãs do autor.</p>','fogo_sangue','S');

call sp_InsLivro('978-8556510785','6','A Guerra dos Tronos: As Crônicas de Gelo e Fogo, volume 1','2','600','52.00','40',
'<p>A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones.
O verão pode durar décadas. O inverno, toda uma vida. E a guerra dos tronos começou. Como Guardião do Norte, lorde Eddard Stark não fica feliz quando o rei Robert o 
proclama a nova Mão do Rei. Sua honra o obriga a aceitar o cargo e deixar seu posto em Winterfell para rumar para a corte, onde os homens fazem o que lhes convém, 
não o que devem... e onde um inimigo morto é algo a ser admirado.</p>
<p>Longe de casa e com a família dividida, Eddard se vê cada vez mais enredado nas intrigas mortais de Porto Real, sem saber que perigos ainda maiores espreitam a distância.
Nas florestas ao norte de Winterfell, forças sobrenaturais se espalham por trás da Muralha que protege a região. E, nas Cidades Livres, o jovem Rei Dragão exilado na 
Rebelião de Robert planeja sua vingança e deseja recuperar sua herança de família: o Trono de Ferro de Westeros.</p>','game_of_thrones1','N');

call sp_InsLivro('978-8556510792','6','A Fúria dos Reis: As Crônicas de Gelo e Fogo, volume 2','2','648','67.71','30',
'<p>Nesta emocionante sequência de A guerra dos tronos, George R. R. Martin cria uma obra incomparável. A fúria dos reis nos transporta para um mundo de festas e vinganças, 
feitiçaria e disputas, diferente de tudo que já foi feito.</p>
<p>Um cometa da cor de fogo e sangue corta os céus. E, da antiga cidadela de Pedra do Dragão às costas áridas de Winterfell, reina o caos.
Em A fúria dos reis, seis facções disputam o controle de uma terra dividida e o direito de ocupar o Trono de Ferro de Westeros – e estão dispostos a encarar tempestades, 
levantes e guerras para isso.
Nesta história, irmão trama contra irmão e os mortos se levantam para caminhar pela noite. Aqui, uma princesa se disfarça de menino órfão, um cavaleiro se prepara para 
encarar uma pérfida feiticeira e bárbaros descem das Montanhas da Lua para saquear os campos.
Em um contexto de incesto e fratricídio, alquimia e assassinato, a vitória será dos homens e mulheres que possuírem o mais frio aço... e o mais frio coração. Pois, 
quando se desperta a fúria dos reis, a terra inteira treme.</p>','game_of_thrones2','N');

call sp_InsLivro('978-8556510808','6','A tormenta de espadas: As Crônicas de Gelo e Fogo, volume 3','2','832','66.00','40',
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

call sp_InsLivro('978-8556510884','6','O Festim dos Corvos: As Crônicas de Gelo e Fogo, volume 4','2','608','37.99','15',
'<p>O festim dos corvos é o quarto livro da monumental saga de fantasia As Crônicas de Gelo e Fogo, sucesso internacional que deu origem a Game of Thrones. 
Neste livro, Martin coloca um reino dilacerado à beira da paz... só para ser lançado de novo rumo ao terror e à destruição.</p>
<p>Há séculos os sete grandes reinos de Westeros se enfrentam em amargas disputas, batalhas e traições. Agora, com Joffrey Baratheon e Robb Stark fora da jogada e lordes 
insignificantes competindo pelas Ilhas de Ferro, a guerra que devorou o continente parece ter finalmente chegado ao fim.
No entanto, como após todo grande conflito, não demora para que os sobreviventes, os bandidos, os renegados e os carniceiros avancem para disputar o espólio dos mortos. 
Por toda Westeros os lordes se agitam, formando alianças e fazendo planos, enquanto nomes conhecidos e desconhecidos se apresentam para tomar parte das danças políticas.
Todos precisam lançar mão de suas habilidades e poderes para encarar os tempos de terror que se aproximam. Nobres e plebeus, soldados e feiticeiros, assassinos e saqueadores 
devem arriscar suas fortunas... e suas vidas, pois em um festim de corvos, muitos são os convidados ― e poucos os sobreviventes.</p>', 'game_of_thrones4','N');
-- criando procedure para 'selecionar' a tabela livro --
drop procedure if exists sp_SelectLivro;
delimiter !!
create procedure sp_SelectLivro()
begin
select * from tbl_livro;
end !!
delimiter ;
-- chamando a tabela a livro --
call sp_SelectLivro;

-- criando a view livro --
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

-- criando a procedure para chamar a view livro -- 
drop procedure if exists sp_VwLivro;
delimiter !!
create procedure sp_VwLivro()
begin
 select * from vw_livro;
end !!
delimiter ;
-- chamando a view livro --
call sp_VwLivro;

-- criando a procedure para chamar a view livro contendo apenas nome, preco e capa -- 
drop procedure if exists sp_VwLivroNPC;
delimiter !!
create procedure sp_VwLivroNPC()
begin
 select nm_livro, vl_preco, ds_capa from vw_livro;
end !!
delimiter ;
-- chamando a view livro contendo apenas nome, preco e capa --
call sp_VwLivroNPC;

-- criando a procedure para chamar a view livro contendo lancamento -- 
drop procedure if exists sp_VwLivroLanca;
delimiter !!
create procedure sp_VwLivroLanca()
begin
 select nm_livro, vl_preco, ds_capa from vw_livro where sg_lancamento = 'S';
end !!
delimiter ;
-- chamando a view livro contendo lancamento --
call sp_VwLivroLanca;

CREATE USER 'livraria'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
 GRANT ALL PRIVILEGES ON db_LivrariaM.* TO 'livraria'@'localhost' WITH GRANT OPTION;

