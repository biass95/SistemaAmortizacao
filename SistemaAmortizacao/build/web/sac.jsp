<%-- 
    Document   : sac
    Created on : 7 de set de 2020, 01:28:53
    Author     : biancasobral
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <% 
    Exception requestException = null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="WEB-INF/jspf/header-references.jspf"%>

        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        
        <h1>Amortização Constante - SAC</h1>
        
        <form>
            <table>
                <tr>
                    <td>
                        Insira o saldo devedor a ser financiado:
                    </td>
                    <td>
                        <input type="number" name="saldodev"/>
                    <td>
                </tr>
                <tr>
                    <td>
                    Insira o numero de parcelas:
                    </td>
                    <td>
                    <input type="number" name="nparcela"/><br>
                    </td>
                </tr>
                <tr>
                    <td>
                    Insira a taxa de juros:
                    </td>
                    <td>
                    <input type="number" name="taxaj"/><br>
                    </td>      
                </tr>    
            </table>     
            <button type="submit" class=" btn btn-dark ">Calcular</button> 
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
            
            DecimalFormat df = new DecimalFormat("#,###.00");

                
            //Formulas:       
                /*mortizacao = (saldodev / nparcela);
                juros = (taxaj * saldodev);
                parcelaAtual = (juros + amortizacao);*/
        %>
        <div>
        <%-- Tabela --%>
       
        <table class ="table" border ="1" > 
                <thead class="thead-dark"> <%-- Estilo da tabela --%>
                <tr>
                    <th scope="col">Mês</th>
                    <th scope="col">Prestação</th>
                    <th scope="col">Juros</th>
                    <th scope="col">Amortização</th>
                    <th scope="col">Saldo Devedor</th>
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
                
                <tr scope="row">  
                    <%--Mês --%>
                    <td><%= i %></td>

                    <%--Prestaçao --%>
                    <% double juros = (taxaj * saldodev);%>
                    <td><%= df.format(amortizacao + juros) %></td>

                    <%--Juros--%>
                    <td><%= df.format(juros) %></td>

                    <%--Amortização --%>
                    <td><%= df.format(amortizacao) %></td>

                    <%--Saldo devedor --%>
                    <script><%= saldodev = (saldodev - ((taxaj * saldodev) + amortizacao))%>
                              <% if (saldodev < 0) { // Tratamento de valor negativo.
                                saldodev = 0;
                    } %></</script>
                        <td><%= df.format(saldodev) %></td>       
                </tr>
               <%} %>
            </table>
     
        <%@include file="WEB-INF/jspf/body-scripts.jspf"%>
    </body>
</html>

