package profile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.hibernate.Session;
import util.HibernateUtil;

public class profileDAO {

    public static void main( String[] args )
    {
        System.out.println("Hibernate save image into database");
        Session session = HibernateUtil.openSession();

        session.beginTransaction();

        //save image into database
    	File file = new File("C:\\mavan-hibernate-image-mysql.gif");
        byte[] bFile = new byte[(int) file.length()];

        try {
	     FileInputStream fileInputStream = new FileInputStream(file);
	     //convert file into array of bytes
	     fileInputStream.read(bFile);
	     fileInputStream.close();
        } catch (Exception e) {
	     e.printStackTrace();
        }

        profile profile = new profile();
        profile.setImage(bFile);

        session.save(profile);

        //Get image from database
        profile profile2 = (profile)session.get(profile.class, profile.getprofileId());
        byte[] bprofile = profile2.getImage();

        try{
            FileOutputStream fos = new FileOutputStream("C:\\test.gif");
            fos.write(bprofile);
            fos.close();
        }catch(Exception e){
            e.printStackTrace();
        }

        session.getTransaction().commit();
    }
}
