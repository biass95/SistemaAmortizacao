<%-- 
    Document   : tab-price
    Created on : 7 de set de 2020, 01:32:40
    Author     : Danilo Saravy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/header-references.jspf"%>

        <title>JSP Page</title>
    </head>
      <body>
        <h1>Tabela Price</h1>
        <form>
        Valor Financiado (R$) : <input type="text" name="valor"/><br/>
        <br/>
        Número de meses : <input type="text" name="mes"/><br/>
        <br/>
        Valor da taxa mensal (%) : <input type="text" name="taxa"/><br/>
        <br/>
        <input type="submit"></input>
        <hr/>
        <% if (request.getParemeter("calcular")!=null){%>
        <% double v = Double.parseDouble(request.getParemeter("valor")); %>
        <% double m = Double.parseDouble(request.getParemeter("mes")); %>       
        <% double t = Double.parseDouble(request.getParemeter("taxa")); %>
        <% double vr = v; %>
        <% t=t/100;%>
        <% double par = v*((((Math.pow((1+t),m)*t))/((Math.pow((1+t),m)-1))));%>
        Valor da Prestação é R$ <%out.print(String.format("%.2f",par));%><br/>
        Valor Total do Financiamento é R$ <%out.print(String.format("%.2f",par*12));%><br/r>
         <table border = '0' style='text-align:center' align='center' cellspacing='0' cellpadding='4'>
          <tr> 
          <th width ="3%">Parcela</th>
          <th width ="5%">Valor da Prestação</th>
          <th width ="5%">Amortização</th>
          <th width ="5%">Juros</th>
          <th width ="5%">Saldo Devedor</th>
          </tr>
          </table>
        <%for (int i = 0; i< m; i++){%>
        <table border='1' style='text-align:center' align='center' cellspacing='0' cellpadding='4'>
          <tr>
          <tbody>
              <td width = "3%"><%(i+1)%></td><!-- = Número de Parcelas-->
              <td width = "5%">&emsp;&emsp;<%out.print(String.format("%.2f",par));%><!-- = Valor da Parcela-->
              <%double amortizado = par -(t*vr);%>
              <td width = "5%">&emsp;&emsp;<%out.print(String.format("%.2f",amortizado));%></td><"-- = Valor Amortizado -->
              <td width = "5%">&emsp;&emsp:<%out.print(String.format("%.2f",(t*vr)));%><!-- = Valor dos Juros daquele mês -->
              <td width = "5%">&emsp;&emsp;<%out.print(String.format("%2f",vr- amortizado));%></td><!-- = Valor de Saldo Devedor -->
          </body>
          </tr>
          <%vr -=amortizado; %>
       </table>
       <%}%>
   <%}%>
  </body>
</html>
