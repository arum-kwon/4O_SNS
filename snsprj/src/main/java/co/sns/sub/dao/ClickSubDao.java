package co.sns.sub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ClickSubDao {

   // 싱글톤
   static ClickSubDao instance = new ClickSubDao();

   static public ClickSubDao getInstance() {
      return instance;
   }

   public int subInsert(Connection conn, String myId, String yourId) {

      int n = 0;
      try {
         String sql = "INSERT INTO SUB_LIST (SUB_NO, FROM_ID, TO_ID) VALUES (SEQ_SUB_NO.nextval, ?, ?)";

         PreparedStatement psmt = conn.prepareStatement(sql);
         psmt.setString(1, myId);
         psmt.setString(2, yourId);
         n = psmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();

      }
      return n;
   }

   public int subDelete(Connection conn, String yourId, String myId){
      int n = 0;
      try {
         String sql = "delete from sub_list where to_id = ? and from_id = ?";

         PreparedStatement psmt = conn.prepareStatement(sql);
         psmt.setString(1, yourId);
         psmt.setString(2, myId);
         n = psmt.executeUpdate();

      } catch (Exception e) {
         e.printStackTrace();

      }
      return n;
   }
}