/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import DAOImpl.NoticeDAO;
import Entity.NoticeEntity;
import util.HibernateUtil;

import org.hibernate.Query;


 public class NoticeDAOImpl implements NoticeDAO {

    @SuppressWarnings("unchecked")
	@Override
    public List<NoticeEntity> showAllNotices(int comp_id2) {
        Session session = HibernateUtil.openSession();
        Query query = session.createQuery("From NoticeEntity where comp_id="+comp_id2+"");
        List<NoticeEntity> noticeList = new ArrayList<NoticeEntity>();
        noticeList = query.list();
        return noticeList;
    }
}
