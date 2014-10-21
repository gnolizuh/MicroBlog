package ruc;

import java.sql.Timestamp;

public class Comment {
	public int idcomment;
	public int Postid;
	public int Whocommentid;
	public Timestamp Birthday;
	public String Content;
	public String WhocommentName;
	public Comment(){
		
	}
	public void SetWhocommentName(String name){
		this.WhocommentName=name;
	}
   public void SetIdComment(int id){
	   this.idcomment=id;
   }
   public void SetPostid(int id){
	   this.Postid=id;
   }
   public void SetWhocommentid(int id){
	   this.Whocommentid=id;
   }
   public void SetBirthday(Timestamp birthday){
	   this.Birthday=birthday;
   }
   public void SetContent(String content){
	   this.Content=content;
   }
   public String GetWhocommentName(){
	   return this.WhocommentName;
   }
   public int GetIdComment(){
	   return this.idcomment;
   }
   public int GetPostid(){
	   return this.Postid;
   }
   public int GetWhocommentid(){
	   return this.Whocommentid;
   }
   public Timestamp GetBirthday(){
	   return this.Birthday;
   }
   public String GetContent(){
	   return this.Content;
   }
   
}
