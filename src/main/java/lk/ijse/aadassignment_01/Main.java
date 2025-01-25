package lk.ijse.aadassignment_01;

import lk.ijse.aadassignment_01.config.SessionFactoryConfig;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Main {
    public static void main(String[] args) {
        Session session = SessionFactoryConfig.getInstance().getSession();
        Transaction transaction = session.beginTransaction();
        transaction.commit();
        session.close();
    }
}
