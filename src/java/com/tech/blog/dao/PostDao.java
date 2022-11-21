package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    Connection con;

    public PostDao() {
    }

    public PostDao(Connection con) {
        this.con = con;
    }

    //get all categories from  database
    public ArrayList<Category> getAllCategories() {

        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from categories";
            Statement st = con.createStatement();

            ResultSet set = st.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid, name, description);

                list.add(c);

            }

        } catch (Exception e) {
            e.printStackTrace();

        }

        return list;

    }

    //method to save post
    public boolean savePost(Post p) {
        boolean flag = false;

        try {
            String q = "insert into posts(pTitle, pShortDes,  pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(q);

            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpShortDes());
            pstmt.setString(3, p.getpContent());
            pstmt.setString(4, p.getpCode());
            pstmt.setString(5, p.getpPic());
            pstmt.setInt(6, p.getCatId());
            pstmt.setInt(7, p.getUserId());

            pstmt.executeUpdate();

            flag = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return flag;
    }

    //fetch all the posts from database
    public List<Post> getAllPosts() {
        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement pstmt = con.prepareStatement("select * from posts order by pDate asc");

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");

                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");

                int userId = set.getInt("userId");
                String pShortDes = set.getString("pShortDes");
                Post p = new Post(pid, pTitle,pShortDes, pContent, pCode, pPic, date, catId, userId);
                list.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //fetch all the posts of a particular category from database
    public List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();

        try {

            PreparedStatement pstmt = con.prepareStatement("Select * from posts where catid = ?");
            pstmt.setInt(1, catId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                String pShortDes = set.getString("pShortDes");
                Post p = new Post(pid,  pTitle,pShortDes, pContent, pCode, pPic, date, catId, userId);
                list.add(p);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public Post getPostByPostId(int postId){
        
        Post p = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, postId);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                
                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                
                int userId = set.getInt("userId");
                String pShortDes = set.getString("pShortDes");
                p = new Post(pid,  pTitle,pShortDes, pContent, pCode, pPic, date, catId, userId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            
        
        return p;
    }
    public List<Post> getPostByUserId(int userId){
        List<Post> list = new ArrayList<>();
        String q= "SELECT * FROM posts WHERE userId = ?"; 
        
        try {

            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, userId);

            ResultSet set = pstmt.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                String pShortDes = set.getString("pShortDes");
                Post p = new Post(pid,  pTitle,pShortDes, pContent, pCode, pPic, date, catId, userId);
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
    
}
