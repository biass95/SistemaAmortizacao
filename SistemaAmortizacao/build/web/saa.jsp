<%-- 
    Document   : saa
    Created on : 7 de set de 2020, 01:29:08
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
        
        <h1>Sistema de Amortização Americana - SAA</h1>
        
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
            double amortizacao;
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
            
            DecimalFormat df = new DecimalFormat("R$ #,##0.00");

                
          
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
                <td colspan="5">Não há parâmetros</td></tr
                <% } else  if(requestException!=null){%>
                <td colspan="2">Parâmetro Inválido</td></tr>
                <%} else {%> 

                <% for (int i = 0; i <= (nparcela)  ; i ++) { %>      
                <tr scope="row">  
                    <%--Mês --%>
                    <td><%= i %></td>

                    <%--Prestaçao --%>
                    <% double juros = (taxaj * saldodev);%>
                    <td><%= df.format(juros) %></td>

                    <%--Juros--%>
                    <td><%= df.format(juros) %></td>

                    <%--Amortização  --%>
                       <% if (i != nparcela){
                            amortizacao = 0;
                        }else {
                            amortizacao = saldodev;
                        } %>
                    <td><%= df.format(amortizacao) %></td>

                    <%--Saldo devedor --%>
                    <script><%= saldodev = (saldodev - amortizacao)%>
                              <% if (saldodev < 0) { // Tratamento de valor negativo.
                                saldodev = 0;
                    } %></</script>
                        <td><%= df.format(saldodev) %></td>       
                </tr>
               <%   }%>
                <%      }%>
            </table>
     
        <%@include file="WEB-INF/jspf/body-scripts.jspf"%>
    </body>
</html>

