/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOImpl;

import java.util.List;

import Entity.NoticeEntity;

public interface NoticeDAO {
    
    public List<NoticeEntity> showAllNotices(int comp_id2);
}