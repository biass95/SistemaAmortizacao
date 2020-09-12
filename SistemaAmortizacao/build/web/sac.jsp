<%-- 
    Document   : sac
    Created on : 7 de set de 2020, 01:28:53
    Author     : biancasobral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% 
    Exception requestException = null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h4><a href="index.jsp">Voltar</a></h4>
        <h1>Amortização Constante - SAC</h1>
        
        <form>
            Insira o saldo devedor a ser financiado:
            <input type="number" name="saldodev"/><br>
            Insira o numero de parcelas:
            <input type="number" name="nparcela"/><br>
            Insira a taxa de juros:
            <input type="number" name="taxaj"/><br>
            <input type="submit" name="Calcular"/><br>              
        </form>
        
        <% 
            // Declaracao das variaveis de entrada
            double saldodev; 
            int nparcela; 
            double taxaj;
          
            //Tratamento de excessoes, checar o retorno dos inputs;
            
            try { saldodev = Double.parseDouble(request.getParameter("saldodev")); } 
            catch(Exception ex){
            saldodev = 0;
            };
            
            try { nparcela = Integer.parseInt(request.getParameter("nparcela")); } 
            catch(Exception ex){
            nparcela = 0;
            };
            try { taxaj =  (Double.parseDouble(request.getParameter("taxaj")))/100; } 
            catch(Exception ex){
            taxaj = 0;
            };
            
            if (saldodev < 0){
                saldodev = 0;
            }
                
            //Formulas:       
                /*mortizacao = (saldodev / nparcela);
                juros = (taxaj * saldodev);
                parcelaAtual = (juros + amortizacao);*/
        %>
       
        <%-- Tabela --%>
        <table border ="1" >
            <tr>
                <th>Mês</th>
                <th>Prestação</th>
                <th>Juros</th>
                <th>Amortização</th>
                <th>Saldo Dev.</th>
            </tr>
            <%-- Checagem de retorno nulo ou inválido --%>
            <% if (request.getParameter("nparcela") == null){ %>
            <tr><td colspan="5">Não há parâmetros</td></tr>
            <% } else  if(requestException!=null){%>
            <tr><td colspan="2">Parâmetro Inválido</td></tr>
            <%}%> 
            
            <%--Calculo da amortizacao constante --%>
            <% double amortizacao = (saldodev/nparcela);%>
            
            <% for (int i = 0; i <= (nparcela - 1) ; i ++) { %>
            <tr>  
                <%--Mês --%>
                <td><%= i %></td>
                
                <%--Prestaçao --%>
                <% double juros = (taxaj * saldodev);%>
                <td><%= amortizacao + juros %></td>
                
                <%--Juros--%>
                <td><%= juros %></td>
                
                <%--Amortização --%>
                <td><%= amortizacao %></td>
                
                <%--Saldo devedor --%>
                    <%= saldodev = (saldodev - ((taxaj * saldodev) + amortizacao))%>
                      <% if (saldodev < 0) { // Tratamento de valor negativo.
                        saldodev = 0.0;
                    } %>
                    <td><%= saldodev %></td>       
            </tr>
           <%} %>
        </table>
    </body>
</html>

