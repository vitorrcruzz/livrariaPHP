<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery livraria -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- JavaScript compilado-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }
    </style>
    <title>Livraria Mística</title>
</head>

<body>
    <?php
    include 'navbar.php';
    include 'cabecalho.html';
    include 'conexao.php';

    $consulta = $cn->query('select nm_livro, vl_preco, ds_capa, qt_estoque from vw_livro');
    ?>

    <div class="container-fluid">
        <div class="row">
            <?php
            $count = 0;
            while ($exibe = $consulta->fetch(PDO::FETCH_ASSOC)) {
                if ($count % 4 == 0) {
                    echo '</div><div class="row">'; // Fecha a linha anterior e inicia uma nova
                }
            ?>
                <div class="col-sm-3">
                    <img src="imagens/<?php echo $exibe['ds_capa']; ?>.jpg" class="img-responsive" style="width:100%;">
                    <div>
                        <h2><b><?php echo mb_strimwidth($exibe['nm_livro'], 0, 19, '...'); ?></b></h2>
                    </div>
                    <div>
                        <h4>R$<?php echo number_format($exibe['vl_preco'], 2, ',', '.'); ?></h4>
                    </div>
                    <div class="text-center"><button class="btn btn-lg btn-block btn-default"><span class="glyphicon glyphicon-info-sign"> Detalhes</span></button></div>
                    <div class="text-center" style="margin-top: 5px; margin-bottom:5px;">
                        <?php if ($exibe['qt_estoque'] > 0) { ?>
                            <button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-usd"> Adicionar ao carrinho</span></button>
                        <?php } else { ?>
                            <button class="btn btn-lg btn-block btn-danger" disabled><span class="glyphicon glyphicon-remove-circle"> Indisponível</span></button>
                        <?php } ?>
                    </div>
                </div>
            <?php
                $count++;
            }
            ?>

        </div><!--Fechamento class row-->
    </div><!--Fechamento class container-->

    <?php include 'footer.html'; ?>

</body>

</html>