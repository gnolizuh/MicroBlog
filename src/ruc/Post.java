package ruc;
import java.sql.Date;
import java.sql.Timestamp;
public class Post {
public int idpost;
public int ownerid;
public int comnum;
public Timestamp birthday;
public String content;
public String ownername;
public Post(){
	
}
public void setownername(String name){
	this.ownername=name;
}
public String getownername(){
	return this.ownername;
}
public void  setidpost(int id){
	this.idpost=id;
}
public int getidpost(){
	return this.idpost;
}
public void setownid(int id){
	this.ownerid=id;
}
public int getownid(){
	return this.ownerid;
}
public void setcomnum(int num){
	this.comnum=num;
}
public int getcomnum(){
	return this.comnum;
}
public void setbirthday(Timestamp date){
	this.birthday=date;
}
public Timestamp getbirthday(){
	return this.birthday;
}
public void setcontent(String con){
	this.content=con;
}
public String getcontent(){
	return this.content;
}
}
