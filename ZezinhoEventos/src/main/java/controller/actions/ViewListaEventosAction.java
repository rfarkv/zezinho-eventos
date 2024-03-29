/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package controller.actions;

import controller.commander.GenericCommander;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.daos.EventoDao;
import model.daos.TipoEspacoDao;
import model.daos.TipoEventoDao;
import model.espaco.TipoEspaco;
import model.evento.Evento;
import model.evento.TipoEvento;

/**
 *
 * @author Leonardo
 */
public class ViewListaEventosAction extends GenericCommander {

    public ViewListaEventosAction(boolean estaLogado) {
        super(estaLogado);
    }

    @Override
    public void executa(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RequestDispatcher rd = request.getRequestDispatcher("template.jsp");
      
      request.setAttribute("page", "/pages/listagens/listagemEventos.jsp");
      
         
      List<TipoEvento> tipoEventos = null;//preencher a combo de tipo de eventos
       tipoEventos = TipoEventoDao.buscarTodosTipoEventos();

        List<TipoEspaco> espacos = null;//preencher a combo de espacos
        espacos = TipoEspacoDao.buscarTodosTiposEspacos();
        
         List<Evento> listaEventos = null;

        
       
        List<Evento> eventos = null;
        if ( request.getParameter("cpSearchNomeEvento") == null ){
            eventos =  EventoDao.buscarTodosEventos();
        }else{
            String dei = request.getParameter("cpDataInicio"); //yyyy-mm-dd
            String def = request.getParameter("cpDataFim");
            eventos = EventoDao.buscarEventosFiltro(
                    request.getParameter("cpSearchNomeEvento"),
                    dei,
                    def,
                    Integer.parseInt(request.getParameter("cpEspacoEvento")),
                    Integer.parseInt(request.getParameter("cpTipoEvento")));
            
        }
        request.setAttribute("eventos", eventos);
        request.setAttribute("times", EventoDao.buscarTodosEventos());
       
        
        
      request.setAttribute("espacos", espacos);
      request.setAttribute("tipoEventos", tipoEventos);
      
      

      request.setAttribute("cpDataInicio", request.getParameter("cpDataInicio"));
      request.setAttribute("cpDataFim", request.getParameter("cpDataFim"));
      request.setAttribute("cpSearchNomeEvento", request.getParameter("cpSearchNomeEvento"));
      request.setAttribute("cpTipoEvento", request.getParameter("cpTipoEvento"));
      request.setAttribute("cpEspacoEvento", request.getParameter("cpEspacoEvento"));
        

        rd.forward(request, response);
    }

}
