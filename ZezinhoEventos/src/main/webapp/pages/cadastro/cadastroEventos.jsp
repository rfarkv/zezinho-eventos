<%-- 
    Document   : cadastroEventos
    Created on : 1 de mai. de 2021, 00:23:03
    Author     : Leonardo
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="model.evento.Evento"%>
<%@page import="model.evento.TipoEvento"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




<h1>${requestScope.titulo}</h1>


<c:if test="${requestScope.msg != null}">
    
<div class="alert alert-success">
    ${requestScope.msg}
</div>
    
</c:if>

<form action="control?ac=eventoCad" method="POST">

    <input type="hidden" name="cpId" value="${requestScope.evento.idEvento}" />


    <div class="Evento">
        <label for="Evento" class="form-label">Nome</label>
        <input required type="text" class="form-control" id="nomeEvento" name="cpNomeEvento"
               value = ${requestScope.evento.nomeEvento}>
    </div><br>

    <div class="Evento">                 
        <label for="Evento "> Tipo de Evento </label> 
        <select name="cpTipoEvento" id="cpTipoEvento" class="form-control">  
            <c:forEach items="${requestScope.tipoEventos}" var="te">
                <option value="${te.idTipoEvento}"
                        <c:if test="${te.idTipoEvento == requestScope.cpTipoEvento}">
                            selected
                        </c:if>
                        >${te.descricaoTipoEvento}</option>                                   
            </c:forEach>  
        </select>        
    </div><br>

    <div class="mb-3">
        <label for="dataEvento" class="form-label">Data do evento</label>
        <input required="" type="date" class="form-control" id="dataEvento" name="cpDataEvento"
               value="<fmt:formatDate value="${e.dataEvento}"  pattern="dd/MM/yyyy" />"
    </div>


    <div class="Evento">                 
        <label for="Evento "> Espa�o </label> 
        <select name="cpEspacoEvento" id="cpEspacoEvento" class="form-control" >  
            <c:forEach items="${requestScope.espacos}" var="e">
                <option value="${e.idTipoEspaco}"
                        <c:if test="${e.idTipoEspaco == requestScope.cpTipoEvento}">
                            selected
                        </c:if>
                        >${e.descricaoEspaco}</option>                                   
            </c:forEach>  
        </select>
    </div><br>


        <div class="form-check">
            <label class="form-check-label" for="flexCheckDefault">
                <input class="form-check-input" type="checkbox"id="flexCheckDefault" id="capacidadeReduzida" name="CpCapacidadeReduzida"
                       value = "${requestScope.evento.capacidadeReduzida}">
                Capacidade Reduzida
            </label>
        </div>
    
    <div class="form-check">
            <label class="form-check-label" for="flexCheckDefault">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" id="aceitaMeiaEntrada" name="CpaceitaMeiaEntrada"
                       value = "${requestScope.evento.aceitameiaentrada}">
                Aceita meia entrada
            </label>
        </div>

        <div class="Evento" id="custoInicial"><br>
            <label for="custoInicial" class="form-label">Custo Inicial</label>
            <input required type="number" min="0" value="0" class="form-control" name="cpCustoInicial"
                   value = "${requestScope.evento.custoInicial}">
        </div>
    
    <div class="Evento" id="CustoExtra"><br>
            <label for="CustoExtra" class="form-label">Custo Extra</label>
            <input required type="number" min="0" value="0" class="form-control" name="cpCustoExtra"
                   value = "${requestScope.evento.custoExtra}">
        </div>


        <div class="Evento" id="valorCadeira"><br>
            <label for="valorCadeira" class="form-label">Valor Cadeira</label>
            <input type="number" min="0" value="0" class="form-control" name="cpValorCadeira"
                   value="${requestScope.espaco.valorCadeira}">
        </div>

        <div class="Evento" id="valorVagaEspecial" >
            <label for="valorVagaEspecial" class="form-label">Valor Vaga Especial</label>
            <input type="number" min="0" value="0" class="form-control" name="cpValorVagaEspecial"
                   value="${requestScope.espaco.valorVagaEspecial}">
        </div>

        <div class="Evento" id="valorCabine">
            <label for="valorCabine" class="form-label">Valor Cabine</label>
            <input type="number" min="0" value="0" class="form-control" name="cpValorCabine"
                   value="${requestScope.espaco.valorCabine}">
        </div><br>

        <div class="Evento" id="valorVagaSalao">
            <label for="valorVagaSalao" class="form-label">Valor Vaga Sal�o</label>
            <input type="number" min="0" value="0" class="form-control"  name="cpValorVagaSalao"
                   value="${requestScope.espaco.valorVagaSalao}">
        </div><br>



        <div class = "text-center">
            <button type="submit" class="btn btn-primary bg-dark">Cadastrar</button>
        </div>
</form>

<!--    <script>
        
        console.log($("#cpEspacoEvento").val());
        
    </script>-->


<script>
    $(function () {
        $("#cpEspacoEvento").change(function () {
//                    if ($("#salao").is(":selected")) {
            if ($(this).val() == '1') {
                $("#valorVagaSalao").show();
                $("#valorCabine").hide();
                $("#valorVagaEspecial").hide();
                $("#valorCadeira").hide();

                $("#valorCadeira").attr("required", false);
                $("#valorCabine").attr("required", false);
                $("#valorVagaEspecial").attr("required", false);
                $("#valorVagaSalao").attr("required", true);
//                document.getElementById("valorCadeira").required = false;
//                document.getElementById("valorCabine").required = false;
//                document.getElementById("valorVagaEspecial").required = false;
//                document.getElementById("valorVagaSalao").required = true;
            } else {
                $("#valorVagaSalao").hide();
                $("#valorCabine").show();
                $("#valorVagaEspecial").show();
                $("#valorCadeira").show();
                $("#valorCadeira").attr("required", true);
                $("#valorCabine").attr("required", true);
                $("#valorVagaEspecial").attr("required", true);
                $("#valorVagaSalao").attr("required", false);
                
//                $("#valorVagaSalao").val(0);
//                document.getElementById("valorCadeira").required = true;
//                document.getElementById("valorCabine").required = true;
//                document.getElementById("valorVagaEspecial").required = true;
//                document.getElementById("valorVagaSalao").required = false;
            }
        }).trigger('change');
    });
</script>


<!--$("#qJogador").html($(e.currentTarget).data("jogador"));-->