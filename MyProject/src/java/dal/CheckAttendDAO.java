/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.*;

/**
 *
 * @author Admin
 */
public class CheckAttendDAO extends DBContext {

    public ArrayList<CheckAttendence> getAllStudent(int sid) {
        ArrayList<CheckAttendence> alist = new ArrayList<>();
        String sql = "  select * from CheckAttedance ca , Student s\n"
                + "  where ca.[SID]= s.SID  and ca.SlotID = ?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slot s = new Slot();
                s.setId(rs.getInt(2));
                Student stu = new Student(rs.getInt(8), rs.getString(9), rs.getString(10), rs.getBoolean(11), rs.getString(12));
                CheckAttendence c = new CheckAttendence(rs.getInt(1), s, rs.getBoolean(4), rs.getString(5), stu, rs.getString(6), rs.getString(7));
                alist.add(c);
            }
        } catch (Exception e) {
        }
        return alist;
    }

    public void insertAttendance(int sid, int stid, int checkAttend, String comment, String taker) {
        String sql = "INSERT [CheckAttedance] ( [SlotID], [SID], [CheckAttendance], [Comment], [Taker], [RecordTime]) \n"
                + "VALUES ( ?, ?, ?, ?, ?, GETDATE())";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, stid);
            stm.setInt(3, checkAttend);
            stm.setString(4, comment);
            stm.setString(5, taker);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void deleteSlot(int sid){
      String sql = "delete CheckAttedance where SlotID =?";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.executeUpdate();
        } catch (Exception e) {
        }}
    
    
}
