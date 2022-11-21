
package com.tech.blog.dao;


import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method for inserting values to database
    
    public boolean saveUser(User user){
        
        boolean f = false;
        try{
            String query =  "insert into user (name , email, password, gender, about) values(?, ?, ?, ?, ?)";

            PreparedStatement pstmt = this.con.prepareStatement(query);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5,user.getAbout());
            
            pstmt.executeUpdate();
            
            f = true;
            
        }
        catch(Exception e ){
            e.printStackTrace();
        }
        return f;
    }
    
    
    //Method to get user data by using email and password
    public User getUserbyEmailandPassword(String email, String password){
        
        User user = null;
        try{
            String query = "select * from user where email = ? and password = ?";
            
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
//                Data from database
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    //Method to update details of user
    
    public boolean updateUser(User user){
        
        boolean f = false;
        
        try{
            String query ="update user set name= ?, email =?, password=?, gender =?, about = ?, profile =? where id =?";
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());
            pstmt.setString(6, user.getProfile());
            pstmt.setInt(7, user.getId());
            
            pstmt.executeUpdate();
            
            f = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public User getUserByUserId( int userId){
        User user = null;
        String q = "select * from user where id =?";
        try {
            
            PreparedStatement pstmt = this.con.prepareStatement(q);
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();
            
            if(set.next()){
                user = new User();
//                Data from database
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return user;
    }
}
