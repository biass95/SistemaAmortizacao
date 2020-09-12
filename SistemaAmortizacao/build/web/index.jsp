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

        <h1>Sistemas de Amortização</h1>
            
            <p>Nossa equipe é Formada por Aline, Bianca Sobral e Danilo Saravi.<br>
                Esse projeto consiste em uma aplicação web que tem a finalidade <br>
                de calcular e exibir os três tipos de operações realizados em <br>
                financiamentos:    
            </p>
            <p><b>Amortização Costante -</b> é caracterizada por um valor fixo obtido<br>
               pela divisão do valor do saldo devedor inicial(valor a ser<br>
                financiado), pelo número de parcelas.
            </p>
            <p><b>Amortização Americana -</b> (definição)</p>
            
            <p><b>Tabela Price -</b> (definição)</p>
            
            <p>Abaixo selecione a opção para realizar o sistema de <br>
               amortização desejado:</p>
        
        <h4><a href="sac.jsp">Sistema de Amortização Constante - SAC</a></h4>
        <h4><a href="saa.jsp">Sistema de Amortização Americano - SAA</a></h4>
        <h4><a href="tab-price.jsp">Tabela Price</a></h4>
        
        <p>Dinâmica de grupo: Os sistemas SAC,SAA e Tabela Price, foram desenvolvidos respectivamente pelos integrantes do grupo: Bianca Sobral, Aline e Danilo Saravy</p>
        
        
        <%@include file="WEB-INF/jspf/body-scripts.jspf"%>
    </body>
</html>
