/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.daos;

import java.util.List;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import static model.daos.BaseDao.getConexao;
import model.espaco.Espaco;

/**
 *
 * @author Leonardo
 */
public class EspacoDao extends BaseDao {
    
    public static List<Espaco> buscarTodosEspacos() {

        Query q = getConexao().createNamedQuery("Espaco.findAll");
        
        return q.getResultList();        
    }


    public static Espaco buscarByIdEspaco(int id) {

        Query q = getConexao().createNamedQuery("Espaco.findByIdespaco");

        q.setParameter("idEspaco", id);
        try {
            
            return (Espaco) q.getSingleResult();

        } catch (NoResultException e) {
            return null;
        }

    }
    
}