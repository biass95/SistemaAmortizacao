<%-- 
    Document   : index
    Created on : 7 de set de 2020, 01:15:28
    Author     : biancasobral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/header-references.jspf"%>
        
        <title>Sistemas de Amortização</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
        <section>
        <h1>Sistemas de Amortização</h1>
        <div>
            <p>Nossa equipe é Formada por Aline, Bianca Sobral e Danilo Saravy.
                Esse projeto consiste em uma aplicação web que tem a finalidade
                de calcular e exibir os três tipos de operações realizados em 
                financiamentos:    
            </p>
            <p><b>Sistema de Amortização Costante -</b> é caracterizada por um valor fixo 
                obtido pela divisão do valor do saldo devedor inicial(valor a 
                ser financiado), pelo número de parcelas.
            </p>
            <p><b>Sistema de Amortização Americana -</b> é um tipo de quitação de empréstimo
                que favorece aqueles que desejam pagar o valor principal através de uma única 
                parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato 
                firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal. 
            </p> 
            
            <p><b>Tabela Price -</b> (definição)</p>
        </div>
        
        </section>
        <%@include file="WEB-INF/jspf/body-scripts.jspf"%>
    </body>
</html>
